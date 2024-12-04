# Predicting Sleep Quality

### **Overview**
This project, **"Predicting Sleep Quality"**, was completed as part of the **PSTAT 131: Statistical Machine Learning** course at UCSB during Spring 2024. The primary goal is to analyze how lifestyle factors impact sleep health and predict sleep quality using machine learning techniques.

### **Project Objectives**
- Investigate the relationship between lifestyle factors and sleep quality.
- Build predictive models to classify sleep quality based on collected data.
- Evaluate and compare the performance of multiple machine learning algorithms.

### **Key Features**
1. **Data Preprocessing**:
   - Cleaned and transformed the dataset to ensure model readiness.
   - Explored relationships between variables using visualizations.
2. **Feature Engineering**:
   - Created derived variables and applied scaling/normalization techniques.
   - Addressed missing data with appropriate imputation methods.
3. **Machine Learning Models**:
   - Applied algorithms including logistic regression, random forest, and support vector machines.
   - Tuned hyperparameters using cross-validation.
4. **Model Evaluation**:
   - Assessed models using metrics like accuracy, AUC, and confusion matrices.

### **Technologies and Libraries**
- **Language**: R
- **Key Libraries**:
  - `tidyverse` for data manipulation and visualization.
  - `tidymodels` for machine learning workflows.
  - `ggplot2` for creating detailed visualizations.
  - `dplyr` for data wrangling.

### **Results**
The analysis revealed significant correlations between certain lifestyle factors and sleep quality. The best-performing model achieved high predictive accuracy, demonstrating strong potential for practical applications in sleep health analysis.

### **How to Run**
1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo-link.git
   ```
2. Install required R packages:
   ```r
   install.packages(c("tidyverse", "tidymodels", "dplyr", "ggplot2", "readr"))
   ```
3. Run the provided `.Rmd` file in RStudio to reproduce the analysis and visualizations.

### **Author**
- **Jiajia Feng**  
  - UCSB, Spring 2024  
  - Course: PSTAT 131 - Statistical Machine Learning

### **Acknowledgments**
This project was developed under the guidance of PSTAT 131 instructors, leveraging skills in statistical analysis and machine learning.
