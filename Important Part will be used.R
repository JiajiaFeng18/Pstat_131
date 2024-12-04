# Load necessary libraries
library(dplyr)       # For data manipulation
library(ggplot2)     # For data visualization
library(tidymodels)  # For modeling
library(readr)       # For reading CSV files

# Load the data
sleep_data <- read_csv("Sleep.csv")

# Print the first few rows of the dataset
print(head(sleep_data))

# Data Cleaning
# Standardizing column names
sleep_data <- sleep_data %>%
  rename(
    person_id = PersonID,
    gender = Gender,
    age = Age,
    occupation = Occupation,
    sleep_duration = SleepDuration,
    quality_of_sleep = QualityOfSleep,
    physical_activity_level = PhysicalActivityLevel,
    stress_level = StressLevel,
    bmi_category = BMICategory,
    blood_pressure = BloodPressure,
    heart_rate = HeartRate,
    daily_steps = DailySteps,
    sleep_disorder = SleepDisorder
  )

# Convert categorical data to factors
sleep_data <- sleep_data %>%
  mutate(
    gender = as.factor(gender),
    occupation = as.factor(occupation),
    bmi_category = as.factor(bmi_category),
    sleep_disorder = as.factor(sleep_disorder),
    quality_of_sleep = factor(quality_of_sleep, levels = 1:10, ordered = TRUE),
    stress_level = factor(stress_level, levels = 1:10, ordered = TRUE)
  )

# Exploratory Data Analysis (EDA)
# Summary statistics
print(summary(sleep_data))

# Histogram of Sleep Duration
ggplot(sleep_data, aes(x = sleep_duration)) +
  geom_histogram(binwidth = 1, fill = "blue") +
  labs(title = "Histogram of Sleep Duration", x = "Hours of Sleep", y = "Count")

# Boxplot for Quality of Sleep across different BMI categories
ggplot(sleep_data, aes(x = bmi_category, y = as.numeric(quality_of_sleep), fill = bmi_category)) +
  geom_boxplot() +
  labs(title = "Quality of Sleep across BMI Categories", x = "BMI Category", y = "Quality of Sleep")

# Correlation Plot (if needed, convert appropriate columns to numeric)
# install.packages("corrplot")
library(corrplot)
numeric_data <- select(sleep_MarkdownDescriptiondata, age, sleep_duration, daily_steps)
cor_mat <- cor(numeric_data, use = "complete.obs")
corrplot(cor_mat, method = "circle")

# Setup Model (Example with Random Forest)
set.seed(123)
data_split <- initial_split(sleep_data, prop = 0.75, strata = quality_of_sleep)
train_data <- training(data_split)
test_data <- testing(data_split)

# Recipe
sleep_recipe <- recipe(quality_of_sleep ~ ., data = train_data) %>%
  step_dummy(all_nominal(), -all_outcomes()) %>%
  step_normalize(all_numeric())

# Model Specification
rf_spec <- rand_forest(trees = 500) %>%
  set_engine("ranger") %>%
  set_mode("classification")

# Workflow
sleep_workflow <- workflow() %>%
  add_recipe(sleep_recipe) %>%
  add_model(rf_spec)

# Fit the model
sleep_fit <- fit(sleep_workflow, data = train_data)

# Evaluate the model
sleep_results <- predict(sleep_fit, new_data = test_data) %>%
  bind_cols(test_data) %>%
  metrics(truth = quality_of_sleep, estimate = .pred_class)

print(sleep_results)

