# Automotive-Fuel-Efficiency-Analysis-and-Prediction-using-R

## Project Overview

This project focuses on performing Exploratory Data Analysis (EDA) and building a **Multiple Linear Regression model** using the classic `mtcars` dataset. The primary objective is to model and predict a car's **Miles per Gallon (MPG)** based on its various performance and design characteristics (e.g., horsepower, weight, number of cylinders).

The analysis serves as a fundamental exercise in statistical modeling and model evaluation using R.

---

## Libraries Used:
- **ggplot2**: for all custom plots (Histograms, Predictions vs. Actuals).

- **dplyr**: for data manipulation.

- **corrplot**: for the correlation visualization.

- **randomForest**: for additional Machine Learning comparison.

---

## Data & Methodology

### Data Source
* **Dataset:** `mtcars`
* **Variables:** 11 car characteristics (e.g., `hp`, `wt`, `disp`, `cyl`) used to predict the target variable, `mpg`.

<img width="871" height="267" alt="Summary of mtcars Dataset" src="https://github.com/user-attachments/assets/a377b046-215a-4342-8ff8-bc565ddbf019" />

<img width="617" height="232" alt="Structure of mtcars Dataset" src="https://github.com/user-attachments/assets/741bbcc0-8782-41f0-81fd-864380d42909" />

---

### Analysis Steps
1.  **Exploratory Data Analysis (EDA):** Visualizing distributions and correlations.
2.  **Model Building:** A multiple linear regression model (`lm(mpg ~ .)`) was trained on 80% of the data.
3.  **Model Evaluation:** Predictions were made on the remaining 20% test set.
4.  **Assumptions Check:** Residual analysis was performed to validate model assumptions (Normality, Homoscedasticity).

---

## Key Findings (Linear Regression)

The final multiple linear regression model yielded the following evaluation metrics on the test set:

| Metric | Value | Interpretation |
| :--- | :--- | :--- |
| **Mean Squared Error (MSE)** | 6.70685986063386 | Average squared distance between predictions and actual MPG. |
| **Root Mean Squared Error (RMSE)** | 2.58976057978993 | Prediction error in the same units as MPG. |

The residuals plots indicates that while the model captures the main trends in the data (hence the reasonable RMSE), the residuals plots might show minor deviations from the ideal.

---

## Visualizations

### 1. Correlation Matrix
* **Insight:** Highlights strong negative correlations between **MPG** and variables like **Weight (`wt`)**, **Displacement (`disp`)**, and **Horsepower (`hp`)**.

<img width="858" height="567" alt="corrplot" src="https://github.com/user-attachments/assets/30b0b3da-a313-4f63-80b2-ee72b17bbe4a" />

---

### 2. Predictions vs. Actuals
* **Insight:** Shows how closely the model's predictions align with the true MPG values on the test set. Points near the dashed red line (y=x) indicate good performance.

<img width="858" height="567" alt="ggplot of Predicted vs Actual" src="https://github.com/user-attachments/assets/daed3f9f-e01c-4c89-a23d-eea29b7bb47e" />

---

## 🛠️ Requirements and Setup

To run this project, you need R and RStudio, along with the following libraries:

```R
# Install all required packages if they are not already installed
install.packages(c("ggplot2", "dplyr", "corrplot", "randomForest"))
```

---

## Running the Code
1. Clone this repository:
```bash
git clone https://github.com/GaganMS004/Automotive-Fuel-Efficiency-Analysis-and-Prediction-using-R
```
2. Open the main R script file (Automotive Fuel Efficiency Analysis and Prediction.R) in RStudio.
3. Ensure all required packages are installed.
4. Execute the entire script to load the data, train the model, and generate all plots and metrics.
