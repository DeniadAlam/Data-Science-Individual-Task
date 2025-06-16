install.packages("FSelectorRcpp") 
install.packages("car")
install.packages("FSelector")


library(FSelector)
library(car)
library(dplyr)

titanic_data <- read.csv("S:/10th Semester/Data Science/FinalProject/Individual/Dataset/train.csv", stringsAsFactors = FALSE)
View(titanic_data)


titanic_fs_data <- titanic_data %>%
  mutate(Survived = as.factor(Survived)) %>%
  select(Pclass, Sex, Age, SibSp, Parch, Fare, Embarked, Survived)


titanic_fs_data <- na.omit(titanic_fs_data)


#--------------------------------------------------------------------------------------------------
# Select only numerical columns for correlation calculation
numerical_cols_for_corr <- titanic_fs_data %>%
  select(Age, Fare, SibSp, Parch, Survived) %>%
  mutate(Survived = as.numeric(as.character(Survived))) 

correlation_matrix <- cor(numerical_cols_for_corr, use = "pairwise.complete.obs") 
print("Pearson Correlation Matrix:")
print(correlation_matrix)


correlation_with_survived <- as.data.frame(correlation_matrix["Survived", ])
colnames(correlation_with_survived) <- "Correlation_with_Survived"
print("Pearson Correlation with Survived:")
print(correlation_with_survived %>% arrange(desc(abs(Correlation_with_Survived))))

#--------------------------------------------------------------------------------------------------



anova_age_survived <- aov(Age ~ Survived, data = titanic_fs_data)
print("ANOVA for Age vs. Survived:")
print(summary(anova_age_survived))


anova_fare_survived <- aov(Fare ~ Survived, data = titanic_fs_data)
print("ANOVA for Fare vs. Survived:")
print(summary(anova_fare_survived))


anova_sibsp_survived <- aov(SibSp ~ Survived, data = titanic_fs_data)
print("ANOVA for SibSp vs. Survived:")
print(summary(anova_sibsp_survived))


anova_parch_survived <- aov(Parch ~ Survived, data = titanic_fs_data)
print("ANOVA for Parch vs. Survived:")
print(summary(anova_parch_survived))

#----------------------------------------------------------------------------------------

chisq_pclass_survived <- chisq.test(titanic_fs_data$Pclass, titanic_fs_data$Survived)
print("Chi-squared test for Pclass vs. Survived:")
print(chisq_pclass_survived)
cat("\nExpected values for Pclass vs. Survived:\n")
print(chisq_pclass_survived$expected)



chisq_sex_survived <- chisq.test(titanic_fs_data$Sex, titanic_fs_data$Survived)
print("\nChi-squared test for Sex vs. Survived:")
print(chisq_sex_survived)
cat("\nExpected values for Sex vs. Survived:\n")
print(chisq_sex_survived$expected) 


cat("\nExpected values for Embarked vs. Survived (from initial chisq.test attempt):\n")
temp_chisq_embarked <- chisq.test(titanic_fs_data$Embarked, titanic_fs_data$Survived)
print(temp_chisq_embarked$expected)

print("\nFisher's Exact Test for Embarked vs. Survived (Recommended due to low expected counts):")
print(fisher_embarked_survived)

#----------------------------------------------------------------------------------------------------




formula_mi <- Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked


mi_results <- information.gain(formula_mi, titanic_fs_data)
print("Mutual Information (Information Gain) with Survived:")
print(mi_results %>% arrange(desc(attr_importance)))


exists("information.gain")
getAnywhere("information.gain")
sessionInfo()


