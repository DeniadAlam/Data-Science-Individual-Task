# Data-Science-Individual-Task


# 🧊 Titanic Survival Analysis – Introduction to Data-Science Final Project (Tasks 1 & 2)

This project performs an in-depth Exploratory Data Analysis (EDA) and statistical testing on the Titanic dataset from Kaggle. The analysis is carried out as part of **Lab Task 1 & 2** for the Introduction to Data Science (IDS) course.

---

## 📌 Dataset

- **Source**: [Kaggle Titanic Competition](https://www.kaggle.com/c/titanic/data?select=train.csv)
- **Description**: The Titanic dataset contains passenger information to predict survival outcomes. It includes both numerical and categorical features like `Age`, `Fare`, `Pclass`, `Sex`, `Embarked`, `SibSp`, and `Parch`.

---

## 🧪 Lab Task 1 – Exploratory Data Analysis (EDA)

### 📊 Visualizations

#### 🔸 Histograms
- `Age`
- `Fare`
- `SibSp` (Number of siblings/spouses aboard)
- `Parch` (Number of parents/children aboard)

#### 🔸 Bar Charts
- `Pclass` (Passenger class)
- `Sex`
- `Embarked` (Port of embarkation)

#### 🔸 Scatter Plots
- Survival status vs:
  - `Age`
  - `Fare`
  - `SibSp`
  - `Parch`

#### 🔸 Violin Plots
- `Age` vs `Pclass`
- `Fare` vs `Embarked`
- `Age` vs `Sex`
- `Fare` vs `Sex`
- `Age` vs `Survived`
- `Fare` vs `Survived`

---

## 📊 Lab Task 2 – Statistical Testing

### 🔹 Pearson Correlation Coefficient
- Evaluates linear correlation between numerical features and survival.

### 🔹 ANOVA (Analysis of Variance)
- Tests performed for:
  - `Age` vs `Survived`
  - `Fare` vs `Survived`
  - `SibSp` vs `Survived`
  - `Parch` vs `Survived`

### 🔹 Chi-Squared Test
- Tests for dependency between:
  - `Pclass` & `Survived`
  - `Sex` & `Survived`
  - `Embarked` & `Survived`

### 🔹 Mutual Information
- Measures dependency between categorical variables and the survival outcome.

---

## 📁 Project Structure

```text
📦 ids_final_project_group_03/
├── scraping/                   # Not used in Titanic analysis – from template
├── preprocessing/             # For preprocessing steps if applicable
├── topic_modeling/            # Not applicable in this task
├── figures/                   # All generated plots and charts
├── data/                      # Contains Titanic dataset CSV
├── report.pdf                 # Final report submission (this PDF)
└── README.md                  # Project documentation
```

## 📌 Tools & Libraries

- **Python** (Jupyter Notebook)
- **Pandas** – Data manipulation and analysis  
- **NumPy** – Numerical computations  
- **Matplotlib** & **Seaborn** – Data visualization  
- **SciPy** & **Scikit-learn (sklearn)** – Statistical tests and feature analysis

---

## 📍 Conclusion

This project offers insights into the key factors affecting survival on the Titanic through both visual exploration and statistical testing. By applying techniques like histograms, violin plots, correlation analysis, ANOVA, chi-squared tests, and mutual information, the study demonstrates how data science can uncover patterns in real-world datasets. It reinforces the importance of combining exploratory data analysis with statistical inference to make data-driven decisions.


