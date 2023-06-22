![nations](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/207cb128-a608-49bc-b68d-5fb074c771bc)

Credit One Default Prediction

This project aims to address the issue of increasing customer default rates faced by Credit One, a credit scoring service. The objective is to develop a data-driven solution to better understand the creditworthiness of customers and improve the loan approval process. The project will leverage data science techniques and tools, primarily using Python and various libraries.

Problem Description

Over the past year, Credit One has observed a rise in the number of customers defaulting on loans obtained through their partners. This trend poses a significant risk to Credit One's business, as their credit scoring service could potentially lose clients. To mitigate this problem, the Data Science team has been tasked with developing an effective and empirically sound solution.

Unlike typical data analytics problems, the team has been granted full autonomy to employ any tools and methods necessary to solve the problem effectively. While Python and several key libraries will be used for the majority of the work, the team is encouraged to explore other libraries if they contribute to the optimal solution.

Investigative Questions

To address the default rate issue, the project team will investigate the following questions:

How can we ensure that customers will be able to pay back their loans? Can this be predicted?
What attributes in the data are statistically significant in determining loan default?
What concrete insights can be derived from the available data?
How can we utilize proven methods to extract additional information?
It is important to note that customer spending habits cannot be directly controlled, and the analysis may not always reveal the underlying reasons behind default. The focus should remain on the problems that can be solved and the insights that can be derived from the data.

Variables

The dataset provided by Credit One contains the following variables:

ID: ID of each client
Limit_Balance: Amount of credit given in NT dollars (including individual and family/supplementary credit)
SEX: Gender (1=male, 2=female)
EDUCATION: Education level (1=graduate school, 2=university, 3=high school, 4=others, 5=unknown, 6=unknown)
MARRIAGE: Marital status (1=married, 2=single, 3=others, 0=others)
AGE: Age in years
PAY_0 to PAY_6: Repayment status from April to September, 2005 (-1=pay duly, 1=payment delay for one month, 2=payment delay for two months, ..., 8=payment delay for eight months, 9=payment delay for nine months and above)
BILL_AMT1 to BILL_AMT6: Amount of bill statement from April to September, 2005 (NT dollar)
PAY_AMT1 to PAY_AMT6: Amount of previous payment from April to September, 2005 (NT dollar)
default.payment.next.month: Default payment status (1=yes, 0=no)
Project Plan

Understanding the Problem and Data Science Approach
Data Preparation and Exploration
Feature Engineering and Selection
Model Development and Evaluation
Fine-tuning and Optimizing the Model
Reporting and Recommendations
The team will provide regular progress updates, and a detailed report summarizing the findings and recommendations will be delivered in the coming days.

Note: The above information provides an overview of the README.md file. The subsequent sections will focus on the implementation details and results of each step in the project plan.

Feature Engineering

Mean_Payment_Amount: This variable represents the average payment amount across the six payment periods (Pay_Amount1 to Pay_Amount6). It provides an overall measure of the customer's average payment behavior.
Mean_Bill_Amount: This variable calculates the mean bill amount across the six billing periods (Bill_Amount1 to Bill_Amount6). It gives an average representation of the customer's bill amount over time.
Mean_Payment_Status: This variable computes the average payment status across the six payment periods (Payment_1 to Payment_6). It indicates the average delay or punctuality of the customer's payments.
Consumption_September: This variable calculates the consumption amount for the month of September. It represents the difference between the bill amount in October (Bill_Amount2) and the adjusted previous bill and payment amounts.
Consumption_August: This variable measures the consumption amount for the month of August. It calculates the difference between the bill amount in September (Bill_Amount3) and the adjusted previous bill and payment amounts.
Consumption_July: This variable represents the consumption amount for the month of July. It computes the difference between the bill amount in August (Bill_Amount4) and the adjusted previous bill and payment amounts.
Consumption_June: This variable indicates the consumption amount for the month of June. It calculates the difference between the bill amount in July (Bill_Amount5) and the adjusted previous bill and payment amounts.
Consumption_May: This variable measures the consumption amount for the month of May. It computes the difference between the bill amount in June (Bill_Amount6) and the adjusted previous bill and payment amounts.
Mean_Consumption_Amount: This variable calculates the average monthly consumption amount across the five months (September to May). It provides an overall measure of the customer's average consumption behavior.
Consumption>Pay: This binary variable indicates whether the average monthly consumption amount is greater than the mean payment amount. It assigns a value of 1 if consumption is greater and 0 if it is less or equal.
Bill_Amount>Limit_Balance: This binary variable determines whether the mean bill amount exceeds the customer's credit limit balance. It assigns a value of 1 if the mean bill amount is higher and 0 if it is lower or equal.
Constant_Delay_Payment_Status: This binary variable identifies whether the customer consistently has delayed payments across all six payment periods. It assigns a value of 1 if all payment statuses are negative (delayed) and 0 otherwise.
class: This categorical variable represents the client classification. It assigns one of the following labels: 'C' (Master), 'A' (Super), 'S' (A Clients), 'D' (B Clients), or 'E' (C Clients) based on specific conditions.
These new variables provide additional information and insights about the customers' payment behavior, consumption patterns, credit utilization, and client classification.

