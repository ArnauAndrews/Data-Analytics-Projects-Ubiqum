Project Title: Credit One Default Rate Analysis

Table of Contents

Objective
Problem Description
Investigative Questions
Variables
Project Plan
Financial Statement Analysis
Data Exploration
Feature Engineering
Categorical Variable Analysis
Summary Statistics
Predictive Models
Classification Report
Feature Selection
Updated Model Results
Best Model Selection
Predicting Client Class
Objective<a name="objective"></a>

This project aims to address the issue of increasing customer default rates faced by Credit One, a credit scoring service. The objective is to develop a data-driven solution to better understand the creditworthiness of customers and improve the loan approval process.

Problem Description<a name="problem-description"></a>

Over the past year, Credit One has observed a rise in the number of customers defaulting on loans obtained through their partners. This trend poses a significant risk to Credit One's business. The Data Science team has been tasked with developing an effective and empirically sound solution.

Investigative Questions<a name="investigative-questions"></a>

To address the default rate issue, the project team will investigate the following questions:

How can we ensure that customers will be able to pay back their loans? Can this be predicted?
What attributes in the data are statistically significant in determining loan default?
What concrete insights can be derived from the available data?
How can we utilize proven methods to extract additional information?
Variables<a name="variables"></a>

The dataset provided by Credit One contains the following variables:

ID: ID of each client
Limit_Balance: Amount of credit given in NT dollars
SEX: Gender (1=male, 2=female)
EDUCATION: Education level
MARRIAGE: Marital status
AGE: Age in years
PAY_0 to PAY_6: Repayment status from April to September, 2005
BILL_AMT1 to BILL_AMT6: Amount of bill statement from April to September, 2005
PAY_AMT1 to PAY_AMT6: Amount of previous payment from April to September, 2005
default.payment.next.month: Default payment status (1=yes, 0=no)
Project Plan<a name="project-plan"></a>

Understanding the Problem and Data Science Approach
Data Preparation and Exploration
Feature Engineering and Selection
Model Development and Evaluation
Fine-tuning and Optimizing the Model
Reporting and Recommendations
Financial Statement Analysis<a name="financial-statement-analysis"></a>

This section provides an analysis of financial statements in a banking context, aiming to predict the likelihood of a client defaulting on their financial obligations based on various factors such as age, credit limit, bill amounts, and payment behavior.

Data Exploration<a name="data-exploration"></a>

The initial exploration of the data involved calculating the Pearson correlation matrix between the numerical variables. Key findings include correlations between variables such as Limit_Balance and Mean_Bill_Amount, Mean_Bill_Amount and Mean_Payment_Amount, and Mean_Bill_Amount and Mean_Payment_Status.

FEATURE ENGINEERING

- Mean_Payment_Amount: Represents the average payment amount across six payment periods.
- Mean_Bill_Amount: Calculates the mean bill amount across six billing periods.
- Mean_Payment_Status: Computes the average payment status across six payment periods.
- Consumption>Pay: Binary variable indicating if average monthly consumption is greater than mean payment amount.
- Bill_Amount>Limit_Balance: Binary variable determining if mean bill amount exceeds credit limit balance.
- Constant_Delay_Payment_Status: Binary variable identifying if the customer consistently has delayed payments.
class: Categorical variable representing client classification.

S for super Clients: Consume less than what they pay / Not Default / Payment on Time

A Clients:Consume more than what they pay / Not Default

Default Clients

C Clients: Consume less than what they pay / Default

D Clients: Default / Delay on Payment Time

E Clients: Consume more than what they pay / Default / Delay on Payment Time

Bivariate AnLYSIS

Limit_Balance and Mean_Bill_Amount: There is a positive correlation of 0.42 between Limit_Balance and Mean_Bill_Amount. This finding supports the understanding that the higher the credit limit (Limit_Balance) a client has, the higher their average bill amount (Mean_Bill_Amount) tends to be. This correlation suggests that the credit limit plays a role in determining the monthly bill amounts.
Mean_Bill_Amount and Mean_Payment_Amount: There is a positive correlation of 0.4 between Mean_Bill_Amount and Mean_Payment_Amount. This implies that higher average bill amounts are associated with higher average payment amounts. It suggests that clients who receive larger bills tend to make larger payments.
Mean_Bill_Amount and Mean_Payment_Status: Interestingly, Mean_Bill_Amount shows a positive correlation of 0.28 with Mean_Payment_Status. This suggests that higher bill amounts are positively correlated with clients not paying on time. It implies that clients who have higher bills are more likely to have delayed payments or payment defaults.
Mean_Payment_Status and Limit_Balance: Mean_Payment_Status has a negative correlation of -0.26 with Limit_Balance. This indicates that a lower credit limit is positively correlated with clients making payments on time. It suggests that clients with lower credit limits are more likely to make timely payments or avoid payment defaults.
These correlations provide insights into the relationships between these variables. However, it's important to note that correlation coefficients alone do not capture the entire relationship between variables, and there could be other factors or interactions at play that should be explored through additional analyses.

In addition to the numerical variables, correlations between the categorical variables and the outcome variable "Outcome_ID" were also examined. The conclusions drawn from these correlations include:

Age_Cat: The age category "50-59" shows the highest correlation with the "Default" outcome, suggesting that clients in this age group have a higher likelihood of defaulting. However, it's important to conduct further analysis to understand the significance and impact of age on the outcome.
Sex: The variable "Sex" does not show a significant correlation with the "Outcome_ID" in this analysis. Additional investigation may be required to explore the relationship between sex and default.
Education: The variable "Education" shows some correlation with the "Outcome_ID." Clients with a "High School" education have a higher correlation with default, while those with a "Graduate School" education have a slightly lower correlation. Further analysis can be performed to understand the impact of education on default rates.
Civil_Status: The variable "Civil_Status" also shows some correlation with the "Outcome_ID." Clients who are "Married" or "Others" have a higher correlation with default, while those who are "Single" or "Unknown" have a lower correlation. Additional investigation can be done to explore the relationship between civil status and default.
Additionally, there are correlations between the numerical variables and the categorical variables. For example, "Limit_Balance" shows some variation across different categories such as "Age_Cat," "Sex," "Education," and "Civil_Status." This suggests that these categorical variables may have an influence on the credit limit assigned to clients.

These findings provide initial insights into the relationships between variables and can guide further analysis and feature selection in predicting the outcome variable "Outcome_ID."Financial Statement Analysis


Data Exploration
The initial exploration of the data involved calculating the Pearson correlation matrix between the numerical variables. The following key findings were observed:

Limit Balance and Mean_Bill_Amount: There is a positive correlation of 0.42 between the credit limit (Limit Balance) and the average bill amount (Mean_Bill_Amount). This suggests that clients with higher credit limits tend to have higher monthly bill amounts.
Mean_Bill_Amount and Mean_Payment_Amount: There is a positive correlation of 0.4 between the average bill amount and the average payment amount. This indicates that clients who receive larger bills tend to make larger payments.
Mean_Bill_Amount and Mean_Payment_Status: Interestingly, Mean_Bill_Amount shows a positive correlation of 0.28 with Mean_Payment_Status. This suggests that higher bill amounts are positively correlated with clients not paying on time, which may lead to payment defaults.
Mean_Payment_Status and Limit_Balance: Mean_Payment_Status has a negative correlation of -0.26 with Limit_Balance. This indicates that clients with lower credit limits are more likely to make timely payments or avoid payment defaults.
Feature Engineering
To address multicollinearity and improve the stability and interpretability of the model, a new variable called Mean_Payment_Status was created. This variable captures the overall payment behavior of the client across multiple months. By combining this variable with the dependent variable (Outcome_ID), we can predict the likelihood of default more effectively.

Categorical Variable Analysis
Further analysis was conducted on the categorical variables, such as age category, gender, education, and civil status. The analysis examined the distribution of default and non-default outcomes within each category. Some noteworthy observations include:

Age Category: Clients in the 50-59 age range had a higher proportion of defaults compared to other age groups.
Gender: The proportion of defaults was slightly higher among females compared to males.
Education: Clients with a high school education had a higher proportion of defaults compared to other education levels.
Civil Status: Married clients had a higher proportion of defaults compared to other civil status categories.
Summary Statistics
Additionally, summary statistics were calculated for certain variables. The following insights were derived:

Age Category and Limit Balance: Clients in the 60-69 age range had the highest average credit limit, followed by the 30-39 age group.
Gender and Limit Balance: On average, females had slightly higher credit limits compared to males.
Education and Limit Balance: Clients with a graduate school education had the highest average credit limit, while those with a high school education had the lowest.
Civil Status and Limit Balance: Married clients had the highest average credit limit, followed by single clients.P

Predictive Models

Predicting default with all variables: 

The following section provides an overview of the predictive models used to predict the outcome of financial statements, specifically focusing on default and non-default categories.

Classification Report

The classification report presents the performance metrics of the model on the test data. It shows precision, recall, and F1-score for each class, as well as overall accuracy.

markdown
Copy code
Classification Report:

            precision    recall  f1-score   support

     Default       0.40      0.51      0.45       213
 Not Default       0.85      0.79      0.82       746

    accuracy                           0.72       959
   macro avg       0.63      0.65      0.63       959
weighted avg       0.75      0.72      0.73       959
Precision: It measures the proportion of correctly predicted instances of a class out of all instances predicted as that class.
Precision for the Default class is 0.40, meaning 40% of instances predicted as default were actually correct.
Precision for the Not Default class is 0.85, indicating that 85% of instances predicted as not default were actually correct.
Recall: It measures the proportion of actual instances of a class that were correctly identified.
Recall for the Default class is 0.51, suggesting that 51% of the actual default instances were correctly identified.
Recall for the Not Default class is 0.79, indicating that 79% of the actual non-default instances were correctly identified.
F1-score: It is the harmonic mean of precision and recall, providing a balance between the two metrics.
The Default class has an F1-score of 0.45, indicating the model's performance in capturing both precision and recall for the default class.
The Not Default class has an F1-score of 0.82, showing a better balance between precision and recall for the non-default class.
Accuracy: The model achieved an overall accuracy of 0.72, meaning it correctly predicted 72% of the instances.

Feature Selection

The feature selection process identified the most important variables for predicting the outcome. The table below shows the selected features and their corresponding importance scores:

Feature	Importance
Bill_Amount1	0.06
Mean_Payment_Status	0.05
Consumption_July	0.05
These three variables were found to be statistically significant in predicting the outcome. After combining them, it was discovered that Mean_Payment_Status alone is the best predictor for the outcome. This approach significantly reduced the model's complexity and multicollinearity.

Updated Model Results

An improved model was built based on the new variable called Class, which summarizes the financial behavior of each type of client. The model achieved the following results:

markdown
Copy code
Classification Report:

            precision    recall  f1-score   support

     Default       0.40      0.51      0.45       213
 Not Default       0.85      0.79      0.82       746

    accuracy                           0.72       959
   macro avg       0.63      0.65      0.63       959
weighted avg       0.75      0.72      0.73       959
Although the macro average did not improve significantly (0.63 vs. 0.65), the model's complexity was greatly reduced to two variables. The overall performance of the improved model suggests that it provides a better balance between precision and recall for both classes.

Best Model Selection

A comparison of various models was conducted, and the following table presents the best models based on different evaluation metrics:

Model	Accuracy	Balanced Accuracy	ROC AUC	F1 Score	Time Taken
AdaBoostClassifier	0.72	0.65	None	0.73	0.14
LabelSpreading	0.72	0.64	None	0.73	0.17
LabelPropagation	0.72	0.64	None	0.73	0.08
ExtraTreesClassifier	0.69	0.64	None	0.71	0.08
RandomForestClassifier	0.69	0.64	None	0.71	0.09
DecisionTreeClassifier	0.69	0.64	None	0.71	0.01
...	...	...	...	...	...
The table shows the top-performing models based on various evaluation metrics such as accuracy, balanced accuracy, ROC AUC, and F1 score. The time taken by each model for training is also provided.



These results can be used to select the best model based on specific requirements and priorities.


Updated model results: 




Please note that this is a general structure for a readme.md file on GitHub. You can modify and format the content according to your needs, adding additional sections or information as necessary.Predicting Client Class

This project focuses on predicting the client class based on various features related to payment behavior and consumption patterns. The goal is to develop a classification model that can assist banks in assessing the risk associated with new clients and making informed decisions regarding credit limits and tailored services.

Feature Importance

The following features have been identified as the most statistically significant variables for predicting the client class:

Consumption>Pay: 0.26
Mean_Consumption_Amount: 0.10
Bill_Amount1: 0.04
Consumption_September: 0.04
Consumption_May: 0.03
Mean_Payment_Status: 0.03
Consumption_August: 0.03
Mean_Payment_Amount: 0.03
Age: 0.03
Consumption_July: 0.03
These features, when combined, provide the best predictive power for determining the client class.

Model Evaluation

Several classification models have been evaluated using the dataset. Here are the performance metrics of the models:

Model	Accuracy	Balanced Accuracy	ROC AUC	F1 Score	Time Taken
LabelSpreading	0.72	0.68	None	0.73	0.25
LabelPropagation	0.72	0.68	None	0.73	0.16
LGBMClassifier	0.68	0.67	None	0.70	0.32
RandomForestClassifier	0.68	0.67	None	0.70	0.12
BaggingClassifier	0.70	0.67	None	0.71	0.02
DecisionTreeClassifier	0.69	0.67	None	0.70	0.01
ExtraTreeClassifier	0.69	0.67	None	0.70	0.01
ExtraTreesClassifier	0.69	0.67	None	0.70	0.11
SVC	0.74	0.65	None	0.73	0.13
LogisticRegression	0.57	0.64	None	0.60	0.02
LinearDiscriminantAnalysis	0.57	0.63	None	0.60	0.01
NearestCentroid	0.54	0.62	None	0.58	0.01
CalibratedClassifierCV	0.58	0.62	None	0.60	0.80
Perceptron	0.39	0.61	None	0.34	0.01
SGDClassifier	0.73	0.60	None	0.70	0.02
LinearSVC	0.57	0.59	None	0.58	0.28
RidgeClassifier	0.57	0.58	None	0.58	0.01
RidgeClassifierCV	0.57	0.58	None	0.58	0.01
BernoulliNB	0.70	0.58	None	0.69	0.01
KNeighborsClassifier	0.76	0.57	None	0.72	0.02
NuSVC	0.40	0.56	None	0.44	0.21
PassiveAggressiveClassifier	0.38	0.55	None	0.31	0.01
AdaBoostClassifier	0.79	0.55	None	0.72	0.13
QuadraticDiscriminantAnalysis	0.42	0.40	None	0.31	0.01
GaussianNB	0.41	0.40	None	0.31	0.01
DummyClassifier	0.48	0.20	None	0.31	0.01
Client Class Classification Report

The classification report provides an overview of the accuracy, recall, precision, and F1-score for each client class:

markdown
Copy code
              precision    recall  f1-score   support

           A       0.85      0.74      0.79       573
           C       0.27      0.38      0.32       127
           D       0.37      0.47      0.41       106
           E       0.53      1.00      0.69        27
           S       0.84      0.79      0.81       365

    accuracy                           0.70      1198
   macro avg       0.57      0.67      0.61      1198
weighted avg       0.74      0.70      0.71      1198
In this classification, the classes are defined as follows:

Not Default Clients:
S (Super Clients): Consume less than what they pay / Not Default / Payment on Time
A Clients: Consume more than what they pay / Not Default
Default Clients:
C Clients: Consume less than what they pay / Default
D Clients: Default / Delay on Payment Time
E Clients: Consume more than what they pay / Default / Delay on Payment Time
Conclusions

Based on the analysis and classification results, the following measures can be considered for existing clients:

Client Classification Reward System: Measures for existing clients:
S Clients will have their Limit Balance increased by 25%:
Reason: Super clients are considered low-risk clients who consume less than what they pay and make their payments on time. Increasing their limit balance rewards their responsible behavior and provides them with more flexibility to manage their finances. This measure can enhance their satisfaction and loyalty, potentially leading to increased customer retention and positive word-of-mouth.
A Clients will have their Limit Balance increased by 10%:
Reason: A clients are not default clients, but they consume more than what they pay. By increasing their limit balance, the bank can provide them with a slightly higher credit limit to better accommodate their spending patterns. This measure aims to strike a balance between meeting their credit needs while mitigating the risk associated with their higher consumption.
C Clients will have their Limit Balance decreased by 25%:
Reason: C clients are default clients who consume less than what they pay. Decreasing their limit balance reduces their credit exposure, helping the bank mitigate potential losses associated with their default status. It also serves as a risk management measure to align their credit limit with their ability to repay.
D Clients will have their Limit Balance decreased by 50% and an increase in pay time of 3 months:
Reason: D clients are default clients who not only consume more than what they pay but also have a delay in payment time. The proposed measure aims to reduce their credit limit significantly to minimize the bank's risk exposure. Additionally, increasing the pay time provides them with a longer period to fulfill their payment obligations, potentially improving their chances of repayment and reducing the likelihood of further default.
E Clients will have their Limit Balance decreased by 75%:
Reason: E clients are default clients who consume more than what they pay and have a delay in payment time. They represent a higher level of credit risk for the bank. By reducing their limit balance significantly, the bank can limit their credit utilization and exposure. This measure helps protect the bank from potential losses associated with their default status and reinforces risk management practices.
These measures aim to align the credit limits of different client segments with their credit behavior, risk profiles, and ability to repay. By adjusting the limit balance based on these factors, the bank can optimize its risk exposure, minimize default rates, and maintain a healthy lending portfolio.Conclusions

Based on the analysis and classification results, the following measures can be considered for existing clients:

Client Classification Reward System: Measures for existing clients:
S Clients will have their Limit Balance increased by 25%:
Reason: Super clients are considered low-risk clients who consume less than what they pay and make their payments on time. Increasing their limit balance rewards their responsible behavior and provides them with more flexibility to manage their finances. This measure can enhance their satisfaction and loyalty, potentially leading to increased customer retention and positive word-of-mouth.
A Clients will have their Limit Balance increased by 10%:
Reason: A clients are not default clients, but they consume more than what they pay. By increasing their limit balance, the bank can provide them with a slightly higher credit limit to better accommodate their spending patterns. This measure aims to strike a balance between meeting their credit needs while mitigating the risk associated with their higher consumption.
C Clients will have their Limit Balance decreased by 25%:
Reason: C clients are default clients who consume less than what they pay. Decreasing their limit balance reduces their credit exposure, helping the bank mitigate potential losses associated with their default status. It also serves as a risk management measure to align their credit limit with their ability to repay.
D Clients will have their Limit Balance decreased by 50% and an increase in pay time of 3 months:
Reason: D clients are default clients who not only consume more than what they pay but also have a delay in payment time. The proposed measure aims to reduce their credit limit significantly to minimize the bank's risk exposure. Additionally, increasing the pay time provides them with a longer period to fulfill their payment obligations, potentially improving their chances of repayment and reducing the likelihood of further default.
E Clients will have their Limit Balance decreased by 75%:
Reason: E clients are default clients who consume more than what they pay and have a delay in payment time. They represent a higher level of credit risk for the bank. By reducing their limit balance significantly, the bank can limit their credit utilization and exposure. This measure helps protect the bank from potential losses associated with their default status and reinforces risk management practices.
These measures aim to align the credit limits of different client segments with their credit behavior, risk profiles, and ability to repay. By adjusting the limit balance based on these factors, the bank can optimize its risk exposure, minimize default rates, and maintain a healthy lending portfolio.

From a financial point of view, assessing risk and reward after applying the measures, the bank has achieved the following:

Total Limit_Balance before the measures:

kotlin
Copy code
class
A   194,510,000.00
C    36,300,000.00
D    32,720,000.00
E     6,270,000.00
S   127,540,000.00
Name: Limit_Balance, dtype: float64
Total Limit_Balance after applying the measures:

kotlin
Copy code
class
A   213,961,000.00
C    27,225,000.00
D    16,360,000.00
E     1,567,500.00
S   159,425,000.00
Name: Limit_Balance_After, dtype: float64
Total Limit_Balance before the measures: 397,340,000.0
Total Limit_Balance after applying the measures: 418,538,500.0
Total percentage increase: 5.34%

By comparing these two totals, we can assess the impact of the measures on the bank's risk and reward:

The total Limit_Balance after applying the measures (418,538,500.0) is higher than the total Limit_Balance before the measures (397,340,000.0).

This suggests that the bank has increased its overall credit exposure. The bank has taken on additional risk by increasing the credit limits for S clients (super clients) and A clients. This indicates a willingness to reward responsible behavior and provide more credit to low-risk clients who consume less than what they pay and make payments on time.

On the other hand, the bank has decreased the credit limits for C clients, D clients, and E clients. This reduction in credit limits reflects a risk management strategy to mitigate potential losses associated with defaulting and delayed payment behaviors.

Overall, the bank has taken a calculated approach to manage risk and reward. By adjusting credit limits based on client behavior and default status, the bank aims to optimize its lending portfolio, minimize default rates, and maintain a healthy balance between risk and profitability.

No demographic variables (Sex, Civil_Status, Age, or Education) are statistically significant in predicting whether the client will default. The prediction of Client Class and its measures for current clients provide the financial institution with a better outcome in assessing risks and rewards regarding the types of clients. Moreover, it offers more insight and an improvement over the Outcome Model, where the prediction of Default Rate was not reliable.

This dataset pertains to a real-case scenario of a bank that went bankrupt in Taiwan in 2006, which provides additional insight into why credits were given to everyone despite their demographic variables and Payment_History. The analysis helps provide an alternative approach to what could have been done if additional measures had been taken regarding the Client Classification Reward System.

By considering the client classification reward system and incorporating it into the credit decision-making process, the financial institution could have made more informed and effective decisions regarding the allocation of credit. This would have contributed to a better risk management approach and potentially avoided the unfortunate outcome of bankruptcy.

Overall, this analysis serves as a valuable lesson and provides an alternative perspective on what could have been done differently to enhance risk assessment and decision-making in relation to the client classification reward system.
