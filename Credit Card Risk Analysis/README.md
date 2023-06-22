# Credit One Default Rate Analysis


## Table of Contents

1. [Problem Description](#problem-description)
   - [Investigative Questions](#investigative-questions)
2. [Data Exploration](#data-exploration)
   - [Demographic Variable Analysis](#demographic-variable-analysis)
3. [Feature Engineering](#feature-engineering)
4. [Predictive Models](#predictive-models)
   - [Predictive Model Outcome](#predictive-model-outcome)
     - [Feature Selection](#feature-selection)
     - [Model Evaluation](#model-evaluation)
   - [Predictive Model Class](#predictive-model-class)
     - [Feature Importance](#feature-importance)
     - [Model Evaluation](#model-evaluation-1)
     - [Client Class Classification Report](#client-class-classification-report)
5. [Client Class Conclusions](#client-class-conclusions)
6. [Conclusions and Next Steps](#conclusions-and-next-steps)


## Problem Description

This project aims to address the issue of increasing customer default rates faced by Credit One, a credit scoring service. The objective is to develop a data-driven solution to better understand the creditworthiness of customers and improve the loan approval process.

Over the past year, Credit One has observed a rise in the number of customers defaulting on loans obtained through their partners. This trend poses a significant risk to Credit One's business. The Data Science team has been tasked with developing an effective and empirically sound solution.

This dataset pertains to a real-case scenario of a bank that went bankrupt in Taiwan in 2006, which provides additional insight into why credits were given to everyone despite their demographic variables and Payment_History. The analysis helps provide an alternative approach to what could have been done if additional measures had been taken regarding the Client Classification Reward System.


### Investigative Questions

To address the default rate issue, the project team will investigate the following questions:

- How can we ensure that customers will be able to pay back their loans? Can this be predicted?
- What attributes in the data are statistically significant in determining loan default?
- What concrete insights can be derived from the available data?
- How can we utilize proven methods to extract additional information?


### Variable Description 


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

## Data Exploration  

- There is a positive correlation (0.42) between the credit limit (Limit_Balance) and the average bill amount (Mean_Bill_Amount). This suggests that clients with higher credit limits tend to have higher monthly bill amounts.
- A positive correlation (0.4) exists between the average bill amount (Mean_Bill_Amount) and the average payment amount (Mean_Payment_Amount).
- Clients who receive larger bills tend to make larger payments.
- Mean_Bill_Amount shows a positive correlation (0.28) with Mean_Payment_Status, indicating that higher bill amounts are associated with clients not paying on time.
- Mean_Payment_Status has a negative correlation (-0.26) with Limit_Balance, suggesting that clients with lower credit limits are more likely to make timely payments.

## Demographic Variable Analysis

**Demographic variables (Age, Sex, Education and Civil Status) do not have a statistically significant impact on whether the client will default or not having respective p-values lower than the threshold of 0.05.**

- Age Category and Limit Balance: Clients in the 60-69 age range had the highest average credit limit, followed by the 30-39 age group.
- Gender and Limit Balance: Females had slightly higher average credit limits compared to males.
- Education and Limit Balance: Clients with a graduate school education had the highest average credit limit, while those with a high school education had the lowest.
- Civil Status and Limit Balance: Married clients had the highest average credit limit, followed by single clients.

## Feature Engineering

  
To address multicollinearity and enhance model stability and interpretability, a new variable called Mean_Payment_Status was created. This variable captures the overall payment behavior of clients across multiple months and improves the predictive power of the model.


- Mean_Payment_Amount: Represents the average payment amount across six payment periods.
- Mean_Bill_Amount: Calculates the mean bill amount across six billing periods.
- Mean_Payment_Status: Computes the average payment status across six payment periods.
- Consumption>Pay: Binary variable indicating if average monthly consumption is greater than mean payment amount.
- Bill_Amount>Limit_Balance: Binary variable determining if mean bill amount exceeds credit limit balance.
- Constant_Delay_Payment_Status: Binary variable identifying if the customer consistently has delayed payments.
- class: Categorical variable representing client classification.:
- S for super Clients: Consume less than what they pay / Not Default / Payment on Time
- A Clients:Consume more than what they pay / Not Default
- C Clients: Consume less than what they pay / Default
- D Clients: Default / Delay on Payment Time
- E Clients: Consume more than what they pay / Default / Delay on Payment Time


# Predictive Models

## Predictive Model Outcome

Predicting whether the client will default or not: 


### Feature Selection

The feature selection process identified the most important variables for predicting the outcome. The table below shows the selected features and their corresponding importance scores:

Feature	Importance
Bill_Amount1	0.06
Mean_Payment_Status	0.05
Consumption_July	0.05

These three variables were found to be statistically significant in predicting the outcome. After combining them, it was discovered that Mean_Payment_Status alone is the best predictor for the outcome. This approach significantly reduced the model's complexity and multicollinearity.

### Model Evaluation


A comparison of various models was conducted, and the following table presents the best models based on different evaluation metrics:

Here is the table formatted in markdown syntax for the readme.md file:

| Model                    | Accuracy | Balanced Accuracy | ROC AUC | F1 Score | Time Taken |
|--------------------------|----------|-------------------|---------|----------|------------|
| AdaBoostClassifier       | 0.72     | 0.65              | None    | 0.73     | 0.14       |
| LabelSpreading           | 0.72     | 0.64              | None    | 0.73     | 0.17       |
| LabelPropagation         | 0.72     | 0.64              | None    | 0.73     | 0.08       |
| ExtraTreesClassifier     | 0.69     | 0.64              | None    | 0.71     | 0.08       |
| RandomForestClassifier   | 0.69     | 0.64              | None    | 0.71     | 0.09       |
| DecisionTreeClassifier   | 0.69     | 0.64              | None    | 0.71     | 0.01       |
| ExtraTreeClassifier      | 0.69     | 0.63              | None    | 0.71     | 0.01       |


The table shows the top-performing models based on various evaluation metrics such as accuracy, balanced accuracy, ROC AUC, and F1 score. The time taken by each model for training is also provided.




### Classification Report Outcome

![Unknown-2](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/886086ee-7fbd-4b88-b051-5aacee4c052d)

|     Class    | Precision | Recall | F1-Score | Support |
|-------------:|----------:|-------:|---------:|--------:|
|   Default    |   0.40    |  0.51  |   0.45   |   213   |
| Not Default  |   0.85    |  0.79  |   0.82   |   746   |
|-------------:|----------:|-------:|---------:|--------:|
|   Accuracy   |           |        |   0.72   |   959   |
|  Macro Avg   |   0.63    |  0.65  |   0.63   |   959   |
|Weighted Avg  |   0.75    |  0.72  |   0.73   |   959   |


The model achieved an overall accuracy of 72%, correctly predicting 72% of instances.
The model's performance is better in predicting non-default instances compared to default instances.

Given these results, an improved model will be developed using a new variable called "Class," which summarizes the financial behavior of each type of client, to identify morea accurately the clients who are going to default since these are the ones who incurr in most losses. 


## Predictive Model Class


### Feature Importance

The following features have been identified as the most statistically significant variables for predicting the client class:

![Unknown](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/86518be7-7beb-4920-9c0e-e9556224e8b9)

These features, when combined, provide the best predictive power for determining the client class.

### Model Evaluation

Several classification models have been evaluated using the dataset. Here are the performance metrics of the models:

Here is the table formatted in markdown syntax for the readme.md file:

| Model                    | Accuracy | Balanced Accuracy | ROC AUC | F1 Score | Time Taken |
|--------------------------|----------|-------------------|---------|----------|------------|
| LabelSpreading           | 0.72     | 0.68              | None    | 0.73     | 0.25       |
| LabelPropagation         | 0.72     | 0.68              | None    | 0.73     | 0.16       |
| LGBMClassifier           | 0.68     | 0.67              | None    | 0.70     | 0.32       |
| RandomForestClassifier   | 0.68     | 0.67              | None    | 0.70     | 0.12       |
| BaggingClassifier        | 0.70     | 0.67              | None    | 0.71     | 0.02       |
| DecisionTreeClassifier   | 0.69     | 0.67              | None    | 0.70     | 0.01       |
| ExtraTreeClassifier      | 0.69     | 0.67              | None    | 0.70     | 0.01       |
| ExtraTreesClassifier     | 0.69     | 0.67              | None    | 0.70     | 0.11       |
| SVC                      | 0.74     | 0.65              | None    | 0.73     | 0.13       |
| LogisticRegression       | 0.57     | 0.64              | None    | 0.60     | 0.02       |


### Client Class Classification Report


The classification report provides an overview of the accuracy, recall, precision, and F1-score for each client class:


|          | precision | recall | f1-score | support |
|----------|-----------|--------|----------|---------|
|    A     |   0.85    |  0.74  |   0.79   |   573   |
|    C     |   0.27    |  0.38  |   0.32   |   127   |
|    D     |   0.37    |  0.47  |   0.41   |   106   |
|    E     |   0.53    |  1.00  |   0.69   |   27    |
|    S     |   0.84    |  0.79  |   0.81   |   365   |
|----------|-----------|--------|----------|---------|
| accuracy |           |        |   0.70   |   1198  |
| macro avg|   0.57    |  0.67  |   0.61   |   1198  |
|weighted avg| 0.74    |  0.70  |   0.71   |   1198  |


In this classification, the classes are defined as follows:

Not Default Clients:
S (Super Clients): Consume less than what they pay / Not Default / Payment on Time
A Clients: Consume more than what they pay / Not Default
Default Clients:
C Clients: Consume less than what they pay / Default
D Clients: Default / Delay on Payment Time
E Clients: Consume more than what they pay / Default / Delay on Payment Time

![Unknown-2](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/886086ee-7fbd-4b88-b051-5aacee4c052d)


## Client Class Conclusions

Based on the analysis and classification results, the following measures can be considered for existing clients:

## Client Classification Reward System: Measures for existing clients:

**S Clients will have their Limit Balance increased by 25%:**

- Reason: Super clients are low-risk clients who exhibit responsible behavior by consuming less than what they pay and making timely payments. Increasing their limit balance rewards their financial responsibility and provides them with more flexibility. This measure can enhance their satisfaction, loyalty, and potentially lead to increased customer retention.

**A Clients will have their Limit Balance increased by 10%:**

- Reason: A clients are non-default clients but consume more than what they pay. Increasing their limit balance slightly accommodates their spending patterns while mitigating associated risks. This measure aims to strike a balance between meeting their credit needs and managing risk.

**C Clients will have their Limit Balance decreased by 25%**

- Reason: C clients are default clients who consume less than what they pay. Decreasing their limit balance reduces credit exposure and helps mitigate potential losses. It aligns their credit limit with their ability to repay and serves as a risk management measure.

**D Clients will have their Limit Balance decreased by 50% and an increase in pay time of 3 months:**

- Reason: D clients are default clients who consume more than what they pay and have a delay in payment time. The proposed measure significantly reduces their credit limit to minimize the bank's risk exposure. Increasing the pay time provides them with a longer period to fulfill payment obligations and improves chances of repayment.
  
**E Clients will have their Limit Balance decreased by 75%:**

- Reason: E clients are default clients who consume more than what they pay and have a delay in payment time. They represent a higher level of credit risk. By reducing their limit balance significantly, the bank can limit their credit utilization and exposure. This measure protects the bank from potential losses and reinforces risk management practices.

These measures aim to align the credit limits of different client segments with their credit behavior, risk profiles, and ability to repay. Adjusting the limit balance based on these factors allows the bank to optimize risk exposure, minimize default rates, and maintain a healthy lending portfolio.

## Conclusions and next steps

From a financial point of view, assessing risk and reward after applying the measures, the bank has achieved the following:

- The bank has achieved a total limit balance increase of 5.34% after applying the measures, indicating an overall increase in credit exposure.
- The bank increased credit limits for S and A clients, indicating a willingness to reward responsible behavior and provide more credit to low-risk clients.
- Credit limits for C, D, and E clients were reduced as a risk management strategy to mitigate potential losses associated with defaulting and delayed payment behaviors.
- The bank has taken a calculated approach to manage risk and reward, optimizing its lending portfolio and maintaining a balance between risk and profitability.

  
- No demographic variables (Sex, Civil_Status, Age, Education) are statistically significant in predicting client default.
The prediction of Client Class and its measures provide a better outcome in assessing risks and rewards compared to the unreliable prediction of Default Rate.
- The dataset reflects a real-case scenario of a bankrupt bank in Taiwan, highlighting the need for additional measures in credit decision-making.
- Incorporating the client classification reward system into the credit decision-making process could have led to more informed and effective decisions, enhancing risk management and potentially avoiding bankruptcy.
  
The analysis serves as a valuable lesson and provides an alternative perspective on improving risk assessment and decision-making related to the client classification reward system.
