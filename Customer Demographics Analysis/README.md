# Contents

1. Investigation of Customer Buying Patterns
   1.1 Business objective
   ...
   ...

## 1.1 Business Objective

To that end, I would like you to explore the customer transaction data we have collected from recent online and in-store sales and see if you can infer any insights about customer purchasing behavior. Specifically, I am interested in the following:

1. Do customers in different regions spend more per transaction? Which regions spend the most/least?
2. Is there a relationship between the number of items purchased and the amount spent?


## 1.2 Variables

The customer transaction data includes the following variables:

- **In-store (Onsite) Purchases**: This column indicates whether the purchase was made in-store or online.
  - 1: Onsite purchases
  - 0: Online purchases

- **Region**: This column represents the region where the purchase was made.
  - 1: North
  - 2: South
  - 3: East
  - 4: West

- **Age**: This variable represents the age of the customer.

- **Items**: This variable denotes the number of items bought in a transaction.

- **Amount**: This variable indicates the amount spent in dollars ($).

Please note the column mapping for the "In-store" and "Region" variables mentioned above.

## 2.1 Univariate Analysis

### 2.1.1 Distribution of the variable "Amount"

- Range: $0 to $3000
- Skewness: Positive skew, indicating lower amounts are more common
- Mean: $835.83
- Std Dev: $721.26
- Median: $582.14

### 2.1.2 Distribution of the variable "Age"

- Distribution: Approximately normal, slightly skewed to the right
- Mean: 45.76 years
- Std Dev: 15.72 years
- Range: 18 to 85 years

### 2.1.3 Distribution of the variable "Items"

- Distribution: Majority (85.64%) of transactions involve 2 to 7 items
- Approximately equal proportions of transactions involve 1 item and 8 items (14.36%)

### 2.1.4 Distribution of the variable "Status"

- Distribution: Evenly split between onsite and online purchases

### 2.1.5 Distribution of the variable "Region"

- Distribution (%): 
  - North: 19.99%
  - South: 24.99%
  - East: 22.50%
  - West: 32.52%

## 2.2 Bivariate Analysis

### 2.2.1 Pearson Correlation Matrix between Numerical variables

- Age and Amount: -0.28
- Age and Items: 0.00066
- Amount and Items: 0.00068

### 2.2.2 Point Biserial Correlation Matrix between Numerical and Dichotomous variables

- Age and Status_ID: -0.17818
- Items and Status_ID: -0.003897
- Amount and Status_ID: -0.085573

### 2.2.3 Phi Correlation Matrix between Dichotomous and Dichotomous variables

- Correlation between Status_ID and Region:
  - Status_ID and Region_East: 0.186779
  - Status_ID and Region_North: 0.707082
  - Status_ID and Region_South: 0.787557
  - Status_ID and Region_West: 0.000000

### 2.2.4 Mean Amount per Region

- Region West: $1283.94
- Region East: $917.97
- Region North: $745.00
- Region South: $252.10

### 2.3 Do any other factors predict if a customer will buy online or in our stores?

- The number of items purchased does not significantly predict the amount spent.
- Other factors like amount spent, age, and region have more predictive power.

### 2.4 Do customers in different regions spend more per transaction?

- West: Highest mean amount per person ($1283.94)
- East: Second-highest mean amount per person ($917.97)
- North: Third-highest mean amount per person ($745.00)
- South: Lowest mean amount per person ($252.10)

### 2.5 Are there differences in the age of customers between regions?

- South: Wide age range, evenly distributed
- West: Majority of customers aged 18 to 60, few customers above 60
- East: Majority of customers aged 18 to 65, few customers above 65
- North: Majority of customers aged 18 to 60, few customers above 60

### 2.6. If so, can we predict the age of a customer in a region based on other demographic data?

- There are clear differences in age based on status (online/on-site) and amount spent.
- Age can be predicted based on other demographic data such as status and amount spent.

### 3. Feature Selection
There is no significant correlation between the number of items purchased and either the age or the amount spent. The correlation coefficients between "Items" and "Age" and between "Items" and "Amount" are close to zero. Therefore, the variable "Items" will not be included in the modeling stage as it does not provide additional insight into customer behavior.
There is a negative correlation of -0.28 between the age of the customer and the amount spent. This means that as the age increases, the amount spent tends to decrease.

### 4. Are there differences in the age of customers between regions? If so, can we predict the age of a customer in a region based on other demographic data?
### 4.1 Modeling Age Prediction

The first model trained to predict the age of customers using other demographic data achieved an accuracy of 0.40 However, the precision and recall for the "Mid" and "Young" age groups were low, indicating that the model struggled to accurately classify customers into these categories. The model's overall performance was not satisfactory.

Therefore, predicting the age of a customer in a region based on other demographic data does not appear to be feasible due to significant overlapping within the age categories when considering factors such as region, amount spent, and transaction status. The model was unable to make clear distinctions between age groups.

### 5. Is there any correlation between age of a customer and if the transaction was made online or in the store? Do any other factors predict if a customer will buy online or in our stores?
Based on the analysis, there is a weak negative correlation (-0.17818) between the age of a customer and whether the transaction was made online or in-store. This suggests that as the age increases, the likelihood of making an online transaction decreases slightly. However, it is important to note that other factors may have a stronger influence on whether a customer chooses to buy online or in-store, as indicated by the model's performance in predicting region based on demographic data. Further investigation and modeling would be necessary to identify the key factors predicting customer buying behavior online or in-store.


### 6. Modelling 

### 6.1.Age Model

- Predicting age groups based on demographic data (Region, Amount, and Status) is challenging.
- The second model shows some improvement compared to the first model but still struggles to accurately predict age_bin categories.
- The model has low precision and recall for the "Mid" and "Young" classes, indicating difficulty in distinguishing between these age groups.
- The overall accuracy of the second model is 0.40, an improvement from the first model's accuracy of 0.33, but still relatively low.

**Conclusion**: Significant overlap within the age_bin categories and the presence of data from the same cases in different columns make it challenging for the model to differentiate between age groups. Predicting age solely based on the provided demographic data may not be feasible without additional variables or further exploration.

### 6.2.Region Model

- The accuracy of the model is 0.64, which indicates that it performs significantly better than random guessing (25% accuracy for four regions). The precision, recall, and F1-score vary for each region:
- The South region shows the highest precision, recall, and F1-score, indicating that the model accurately predicts this region. This could be due to moderate correlations between age, status, amount, and the South region, as well as the fact that all purchases in the South region are made in-store.
- The model performs relatively well for the West region with moderate precision, recall, and F1-score. The North and East regions have lower performance measures, suggesting more overlapping of variables and difficulty in accurately predicting the regions.

**Conclusion** The model can provide insights and predictions about the region where an item was bought, with the South region being the most accurately predicted. However, predictions for other regions should be taken with caution, as the model's performance varies across different regions.

### 6.3 Status Model:

- The model achieved an accuracy of 0.84, indicating that it can correctly classify most of the data points.
- The precision and recall scores are high for both classes, indicating that the model is good at predicting positive cases for both online and onsite purchases.
- The F1-score, which is a balance between precision and recall, is also high for both classes.
- The model performed slightly better for online purchases, as indicated by higher precision, recall, and F1-score for that class.
- The macro and weighted averages are both high, indicating that the model's performance is good overall.

**Conclusion:** The results suggest that the model is effective at predicting whether a customer will make a purchase online or onsite and could be used to inform marketing and sales strategies.

### 6.4 Amount Model:

- The model's R-squared value is 0.431, indicating that the independent variables explain 43.1% of the variance in the dependent variable (amount).
- The p-values of the coefficients suggest that Status_ID and Age are statistically significant predictors of the amount.
- The mean absolute error (MAE) of the model is 0.558, indicating that, on average, the model's predictions are off by approximately 0.558 on a scaled basis.
- 
**Conclusion:** While the model explains a moderate amount of variance in the amount variable, the high MAE suggests that its predictions are not very accurate. This could be due to the limited number of independent variables or other factors not accounted for in the model.

### 7. Limitations and Challenges  
To predict age more accurately, we need more information based on:
- Marital Status
- Income
- Employment
- 
### 8. Conclusions and Next Steps 

Status can be accurately predicted which can be used to:
- Study the possibility to open a store in the South to increase onsite sales
- Allocate marketing funds to the North region to incentivize online spending
  
Region can somewhat be predicted which can be used to:
- Provisioning of stocks for each region
- Allocate marketing budgets to each region based on their needs:

Amount can somewhat be predicted which can be used to:
- Target marketing campaings to promote higher expenditure on regions where the amount spent is low.
- Understand our customer's expenditure behaviors based on Age, Region and Status



