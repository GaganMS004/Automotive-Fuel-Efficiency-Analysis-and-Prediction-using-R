install.packages("randomForest")

# Load required libraries
library(ggplot2)
library(dplyr)
library(corrplot)
library(randomForest)

# Load dataset
data <- mtcars

# Exploratory Data Analysis (EDA)
summary(data)
str(data)

# Data Visualization
# Correlation Matrix
corr_matrix <- cor(data)
corrplot(corr_matrix, method = "circle")

# Scatterplot Matrix
pairs(data)

# Visualizing individual variables
ggplot(data, aes(x = mpg)) +
  geom_histogram(fill = "skyblue", color = "black", bins = 10) +
  ggtitle("Distribution of Miles per Gallon")

ggplot(data, aes(x = hp)) +
  geom_histogram(fill = "salmon", color = "black", bins = 10) +
  ggtitle("Distribution of Horsepower")

# Linear Regression Model
# Splitting data into training and testing sets
set.seed(123)
sample <- sample.int(n = nrow(data), size = floor(.8*nrow(data)), replace = F)
train_data <- data[sample, ]
test_data  <- data[-sample, ]

# Building the linear regression model
lm_model <- lm(mpg ~ ., data = train_data)

# Summary of the linear regression model
summary(lm_model)

# Predictions on the test set
predictions <- predict(lm_model, newdata = test_data)

# Evaluation Metrics
# Mean Squared Error (MSE)
mse <- mean((predictions - test_data$mpg)^2)
print(paste("Mean Squared Error:", mse))

# Root Mean Squared Error (RMSE)
rmse <- sqrt(mse)
print(paste("Root Mean Squared Error:", rmse))

# Visualizing Predictions vs. Actuals
ggplot() +
  geom_point(data = test_data, aes(x = mpg, y = predictions), color = "blue") +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  ggtitle("Predictions vs. Actuals") +
  xlab("Actual Miles per Gallon") +
  ylab("Predicted Miles per Gallon")

# Residual Analysis
residuals <- residuals(lm_model)
fitted_values <- fitted(lm_model)

plot(fitted_values, residuals, main = "Residuals vs. Fitted Values", xlab = "Fitted values", ylab = "Residuals")

# Homoscedasticity Check
fitted_values <- fitted(lm_model)

plot(fitted_values, residuals, main = "Residuals vs. Fitted Values", xlab = "Fitted values", ylab = "Residuals")

# Normality Check
qqnorm(residuals)
qqline(residuals)

# Building the Random Forest model
rf_model <- randomForest(
  mpg ~ .,
  data = train_data,
  ntree = 500,       # Number of trees to grow
  importance = TRUE  # Calculate variable importance
)

# Summary of the Random Forest model
print(rf_model)

# Predictions on the test set
rf_predictions <- predict(rf_model, newdata = test_data)

# Evaluation Metrics for Random Forest
# Mean Squared Error (MSE)
rf_mse <- mean((rf_predictions - test_data$mpg)^2)
print(paste("Random Forest Mean Squared Error:", rf_mse))

# Root Mean Squared Error (RMSE)
rf_rmse <- sqrt(rf_mse)
print(paste("Random Forest Root Mean Squared Error:", rf_rmse))

# 6. Visualize Variable Importance
varImpPlot(rf_model)
