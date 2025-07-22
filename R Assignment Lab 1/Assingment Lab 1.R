library(dplyr)
library(tidyr)
library(infotheo)   
library(psych)     
library(caret)      


data <- read.csv("/Users/tareqjamilsarkar/Downloads/healthcare_dataset.csv", header = TRUE, sep = ",")
data

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
data

