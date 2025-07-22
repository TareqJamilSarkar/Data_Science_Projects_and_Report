install.packages("dplyr")
install.packages("tidyr")
install.packages("infotheo")
install.packages("psych")
install.packages("caret")
install.packages("ggplot2")
install.packages("moments")
install.packages("GGally")


library(dplyr)
library(tidyr)
library(infotheo)
library(psych)
library(caret)
library(ggplot2)
library(moments)  
library(GGally)   


data <- read.csv("/Users/tareqjamilsarkar/Downloads/healthcare_dataset.csv", header = TRUE, sep = ",")


str(data)


colnames(data) <- make.names(colnames(data))


num_cols <- c("Age", "Billing.Amount")
cat_cols <- c("Gender", "Medical.Condition")


pearson_result <- cor.test(data$Age, data$Billing.Amount, method = "pearson")
print(pearson_result)

spearman_result <- suppressWarnings(
  cor.test(data$Age, data$Billing.Amount, method = "spearman", exact = FALSE)
)
print(spearman_result)


anova_result <- aov(Billing.Amount ~ Gender, data = data)
print(summary(anova_result))


chi_table <- table(data$Gender, data$Medical.Condition)
chi_result <- chisq.test(chi_table)
print(chi_result)


missing_summary <- colSums(is.na(data))
print(missing_summary)


data$Age[is.na(data$Age)] <- median(data$Age, na.rm = TRUE)
data$Billing.Amount[is.na(data$Billing.Amount)] <- median(data$Billing.Amount, na.rm = TRUE)


get_mode <- function(v) {
  uniqv <- na.omit(unique(v))
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


data$Gender[is.na(data$Gender)] <- get_mode(data$Gender)
data$Medical.Condition[is.na(data$Medical.Condition)] <- get_mode(data$Medical.Condition)


print("Missing Values After Handling:")
print(colSums(is.na(data)))


for (col in num_cols) {
  mean_val <- mean(data[[col]], na.rm = TRUE)
  median_val <- median(data[[col]], na.rm = TRUE)
  mode_val <- get_mode(data[[col]])
  skew_val <- skewness(data[[col]], na.rm = TRUE)
  
  print(paste("Variable:", col))
  print(paste("Mean:", mean_val))
  print(paste("Median:", median_val))
  print(paste("Mode:", mode_val))
  print(paste("Skewness:", skew_val))
  if (skew_val > 0) {
    print("Skew: Positive (Right-skewed)")
  } else if (skew_val < 0) {
    print("Skew: Negative (Left-skewed)")
  } else {
    print("Skew: Symmetrical")
  }
  
  ggplot(data, aes_string(x = col)) +
    geom_histogram(binwidth = 5, fill = "steelblue", color = "black") +
    geom_vline(aes(xintercept = mean_val), color = "red", linetype = "dashed", size = 1) +
    geom_vline(aes(xintercept = median_val), color = "green", linetype = "dotted", size = 1) +
    labs(title = paste("Histogram of", col), x = col, y = "Count") +
    theme_minimal() -> p
  print(p)
}


for (cat_col in cat_cols) {
  for (num_col in num_cols) {
    ggplot(data, aes_string(x = cat_col, y = num_col, fill = cat_col)) +
      geom_boxplot() +
      labs(title = paste("Boxplot of", num_col, "by", cat_col)) +
      theme_minimal() -> p
    print(p)
  }
}


ggplot(data, aes(x = Age, y = Billing.Amount)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Scatter Plot: Age vs Billing Amount") +
  theme_minimal() -> scatter
print(scatter)


ggpairs(data[, num_cols]) -> garlic_plot
print(garlic_plot)

