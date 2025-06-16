install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("GGally") 
install.packages("patchwork")



library(ggplot2)
library(dplyr)
library(tidyr)
library(GGally)
library(patchwork)


titanic_data <- read.csv("S:/10th Semester/Data Science/FinalProject/Individual/Dataset/train.csv", stringsAsFactors = FALSE)
#View(titanic_data)



titanic_data$Age[is.na(titanic_data$Age)] <- median(titanic_data$Age, na.rm = TRUE)


titanic_data$Pclass <- as.factor(titanic_data$Pclass)
titanic_data$Sex <- as.factor(titanic_data$Sex)
titanic_data$Embarked <- as.factor(titanic_data$Embarked)


titanic_data <- drop_na(titanic_data, Embarked)


selected_features <- titanic_data %>%
  select(Pclass, Sex, Age, SibSp, Parch, Fare, Embarked)

#-----------------------------------------------------------------------------------------------


ggplot(selected_features, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency") +
  theme_minimal()


ggplot(selected_features, aes(x = Fare)) +
  geom_histogram(binwidth = 20, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of Fare", x = "Fare", y = "Frequency") +
  theme_minimal()


ggplot(selected_features, aes(x = SibSp)) +
  geom_histogram(binwidth = 1, fill = "salmon", color = "black") +
  labs(title = "Distribution of SibSp", x = "Number of Siblings/Spouses", y = "Frequency") +
  theme_minimal()


ggplot(selected_features, aes(x = Parch)) +
  geom_histogram(binwidth = 1, fill = "lightcoral", color = "black") +
  labs(title = "Distribution of Parch", x = "Number of Parents/Children", y = "Frequency") +
  theme_minimal()
#----------------------------------------------------------------------------------------------


ggplot(selected_features, aes(x = Pclass)) +
  geom_bar(fill = "steelblue", color = "black") +
  labs(title = "Passenger Class Distribution", x = "Passenger Class", y = "Count") +
  theme_minimal()


ggplot(selected_features, aes(x = Sex)) +
  geom_bar(fill = "darkseagreen", color = "black") +
  labs(title = "Gender Distribution", x = "Sex", y = "Count") +
  theme_minimal()


ggplot(selected_features, aes(x = Embarked)) +
  geom_bar(fill = "lightpink", color = "black") +
  labs(title = "Embarkation Port Distribution", x = "Port of Embarkation", y = "Count") +
  theme_minimal()

#---------------------------------------------------------------------------------------------





p1 <- ggplot(titanic_data, aes(x = Age, y = Fare, color = as.factor(Survived))) +
  geom_point(alpha = 0.6) +
  labs(title = "Age vs. Fare", x = "Age", y = "Fare", color = "Survived") +
  scale_color_manual(values = c("0" = "red", "1" = "blue"),
                     labels = c("0" = "Did Not Survive", "1" = "Survived")) +
  theme_minimal()


p2 <- ggplot(titanic_data, aes(x = Age, y = SibSp, color = as.factor(Survived))) +
  geom_point(alpha = 0.6) +
  labs(title = "Age vs. SibSp", x = "Age", y = "Siblings/Spouses", color = "Survived") +
  scale_color_manual(values = c("0" = "red", "1" = "blue"),
                     labels = c("0" = "Did Not Survive", "1" = "Survived")) +
  theme_minimal()


p3 <- ggplot(titanic_data, aes(x = Fare, y = Parch, color = as.factor(Survived))) +
  geom_point(alpha = 0.6) +
  labs(title = "Fare vs. Parch", x = "Fare", y = "Parents/Children", color = "Survived") +
  scale_color_manual(values = c("0" = "red", "1" = "blue"),
                     labels = c("0" = "Did Not Survive", "1" = "Survived")) +
  theme_minimal()


combined_scatter_plots <- p1 + p2 + p3 +
  plot_layout(guides = 'collect') + # Collects all legends into one
  plot_annotation(title = 'Pairwise Scatter Plots by Survival Status') 


print(combined_scatter_plots)
#----------------------------------------------------------------------------------------------


ggplot(titanic_data, aes(x = Pclass, y = Age, fill = Pclass)) +
  geom_violin() +
  labs(title = "Age Distribution by Passenger Class", x = "Passenger Class", y = "Age") +
  theme_minimal()


ggplot(titanic_data, aes(x = Embarked, y = Fare, fill = Embarked)) +
  geom_violin() +
  labs(title = "Fare Distribution by Embarkation Port", x = "Port of Embarkation", y = "Fare") +
  theme_minimal()


ggplot(titanic_data, aes(x = Sex, y = Age, fill = Sex)) +
  geom_violin() +
  labs(title = "Age Distribution by Sex", x = "Sex", y = "Age") +
  theme_minimal()


ggplot(titanic_data, aes(x = Sex, y = Fare, fill = Sex)) +
  geom_violin() +
  labs(title = "Fare Distribution by Sex", x = "Sex", y = "Fare") +
  theme_minimal()


ggplot(titanic_data, aes(x = as.factor(Survived), y = Age, fill = as.factor(Survived))) +
  geom_violin() +
  labs(title = "Age Distribution by Survival Status", x = "Survived (0 = No, 1 = Yes)", y = "Age") +
  theme_minimal()


ggplot(titanic_data, aes(x = as.factor(Survived), y = Fare, fill = as.factor(Survived))) +
  geom_violin() +
  labs(title = "Fare Distribution by Survival Status", x = "Survived (0 = No, 1 = Yes)", y = "Fare") +
  theme_minimal()
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------

