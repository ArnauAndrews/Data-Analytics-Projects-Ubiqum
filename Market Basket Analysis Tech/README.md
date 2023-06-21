# Acquisition Opportunities and Challenges of Electronidex Market Basket Analysis of Electronidex

**Subtitle: Unveiling Insights from Customer Purchase Patterns**

Prepared by: Report for Blackwell Arnau Andrews

## Table of Contents
- [Matters on the Docket](#matters-on-the-docket)
- [Market Basket Analysis and Association rules](#market-basket-analysis-and-association-rules)
- [Best-Selling Categories](#categories-frequencies)
- [Best-Selling Products](#electronidexs-best-seller-products)
- [Patterns within Electronidex](#interesting-patterns-within-electronidex)
- [Should Blackwell acquire Electronidex?](#should-blackwell-acquire-electronidex)
- [Recommendations](#recommendations)
- [Challenges & Limitations](#challenges--limitations)
- [Further Steps](#further-steps)
- [Additional Insights](#additional-insights)

## Matters on the Docket

A brief look at what we will discuss in this presentation:

- Market Basket Analysis
- Interesting Patterns within Electronidex
- Should Blackwell acquire Electronidex?
- Recommendations
- Challenges & Limitations


### Market Basket Analysis and Association Rules

Market basket analysis is a technique used to uncover relationships between products that are frequently purchased together. By analyzing customer purchase patterns, we can identify associations and use them to optimize product placement, cross-selling strategies, and marketing campaigns. It involves identifying associations or relationships between products that are frequently purchased together. These associations can be represented as rules. Three key metrics used to evaluate these rules are:

- **Support**: The support of a rule represents the proportion of transactions in the dataset that contain both the antecedent (left-hand side) and consequent (right-hand side) items of the rule. It indicates the popularity or frequency of the rule.
- **Confidence**: Confidence measures the conditional probability that the consequent item will be purchased given that the antecedent item is already in the basket. It indicates the strength of the rule.
- **Lift**: Lift is the ratio of observed support to expected support if the items in the rule were independent. It shows whether the rule's antecedent and consequent items are independent or if there is a relationship between them.

By analyzing these metrics, we can identify strong rules that have high support, confidence, and lift. These rules provide valuable insights for decision-making, such as optimizing product placement, designing effective cross-selling strategies, and improving marketing campaigns.

In this analysis, the association rules were generated using the R programming language and the arules package. The arules package provides a comprehensive set of functions for performing market basket analysis and extracting meaningful association rules from transactional data.

By leveraging the rules package, we were able to efficiently analyze Electronidex's transaction data and uncover valuable patterns and associations among the purchased items. These rules can guide decision-making processes and offer opportunities for optimization and growth.


## Categories Frequencies

The frequency distribution of product categories in Electronidex's transactions is as follows:

<img width="720" alt="Screenshot 2023-06-21 at 16 11 13" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/c3676e7f-138e-41a0-91d8-3e2cf2301092">

| Category                | Frequency |
|-------------------------|-----------|
| Desktop                 | 0.329     |
| Laptop                  | 0.306     |
| Monitor                 | 0.236     |
| Computer Mice           | 0.199     |
| Keyboard                | 0.191     |
| Active Headphones       | 0.158     |
| Mouse and Keyboard Combo| 0.134     |
| Accessories             | 0.121     |
| Speakers                | 0.100     |
| Printers                | 0.092     |

## Electronidex's Best Seller Products

The top-selling products in Electronidex based on their frequency of purchase are:

<img width="672" alt="Screenshot 2023-06-21 at 16 11 20" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/18ad4634-968b-481a-8812-37dbfa7e78ef">

1. iMac
2. HP Laptop
3. Cyberpower Gamer Desktop
4. Apple Earpods
5. Apple MacBook Air
6. Lenovo Desktop Computer
7. Dell Desktop
8. Apple MacBook Pro
9. ViewSonic Monitor
10. Acer Desktop
11. Microsoft Wireless Desktop Keyboard and Mouse
12. Samsung Monitor


## Interesting Patterns within Electronidex

Through market basket analysis of Electronidex's transaction data, we have discovered several interesting patterns and item relationships. These findings shed light on customer preferences and can guide decision-making processes related to acquisition opportunities. Here are some key insights:

- **Best-Selling Categories:** The most popular rules in categories in Electronidex are Desktop, Laptop, and Monitor. By acquiring Electronidex and expanding our portfolio with Desktop products, Blackwell can capitalize on the high demand for these items and potentially increase sales in other best-selling categories.

<img width="1168" alt="Screenshot 2023-06-21 at 19 09 24" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/cb9e2bf2-4cb5-4b29-abad-7af481ab0dbd">

<img width="706" alt="Screenshot 2023-06-21 at 19 16 09" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/999ff453-9079-430d-959b-9d0d1edeec26">

<img width="866" alt="Screenshot 2023-06-21 at 16 19 45" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/4b17ab71-fab0-45a4-b503-d2cee58dc551">

- **Best-Selling Products:** The most popular rules in Electronidex products iMac, HP Laptop, and CYBERPOWER Gamer Desktop. By acquiring Electronidex and expanding our portfolio with Desktop products, Blackwell can capitalize on the high demand for these items and potentially increase sales in other best-selling products.
  
<img width="1080" alt="Screenshot 2023-06-21 at 19 10 07" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/b645764d-f837-44c4-a906-97ac8b38d337">
- 
<img width="703" alt="Screenshot 2023-06-21 at 19 16 19" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/f614e976-655c-4f93-9f44-fca9a3edaad1">

<img width="862" alt="Screenshot 2023-06-21 at 16 19 36" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/8f1722cf-cc61-4886-909f-a3f2eeec78e7">

- **Patterns within items:** 

- Customer Segments: Electronidex serves a diverse range of customers. The market can be segmented into affluent, mid-tier, and casual buyers. By understanding these customer segments, Blackwell can tailor marketing strategies to target specific groups effectively. In particular, focusing on B2B and B2C customers and catering to the needs of gamers, high-budget buyers, and office buyers can yield significant opportunities for growth.
  
<img width="860" alt="Screenshot 2023-06-21 at 16 19 21" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/8b266b91-a9bb-4c76-8c47-8b292bb6d0c9">

## Should Blackwell acquire Electronidex?

Based on the insights gained from the market basket analysis, there are compelling reasons for Blackwell to consider acquiring Electronidex. The acquisition would allow Blackwell to expand its product offering, specifically in the Desktop category, which has shown strong demand. By leveraging the existing customer base and market presence of Electronidex, Blackwell can strengthen its position in the electronics retail industry.

## Recommendations

Based on the market basket analysis and current insights, the following recommendations are made:

1. **Remove the 10 least consumed products to optimize store space, reduce costs, improve inventory management, and enhance customer satisfaction.** These 10 items combined do not have strong association rules with other products and sell only 0.2% of times combined. 
2. **Implement cross-selling and bundling strategies by offering discounts on accessories and minor products when customers purchase Desktop, Monitor, or Laptop items.**
3. **Devise targeted marketing campaigns tailored towards B2B and B2C customers, focusing on gamers, high-budget buyers, and office buyers.**

## Challenges & Limitations

While market basket analysis provides valuable insights, it is essential to acknowledge the challenges and limitations associated with this approach. Some potential challenges and limitations include:

- Data Availability: The analysis heavily relies on the availability and quality of transactional data. Incomplete or inaccurate data may affect the accuracy of the results.
- Interpretation of Associations: Associations discovered through market basket analysis represent statistical relationships and do not necessarily imply causal relationships. Care should be taken when interpreting these associations.
- Dynamic Market: The market for electronics is dynamic, with constantly changing trends and customer preferences. Ongoing analysis and adaptation are necessary to stay aligned with market dynamics.

## Further Steps

To continue leveraging market basket analysis for growth and optimization, the following steps are recommended:

- **Pin down seasonality shifts:** Identify patterns of products that sell during specific times of the year, such as Winter, Summer, Christmas, and Spring Break. Optimize inventory management and adjust prices for seasonally affected products. Consider adjusting the store layout throughout different seasons to align with customer preferences.
- **Identify location trends**: Analyze sales data across different store locations and online channels. Understand regional consumer behavior and tailor business decisions accordingly. This can help personalize marketing efforts, product selection, and inventory management based on regional demand.

## Additional Insights

**Seasonality**: The next challenge is to identify seasonality shifts and adjust inventory management and pricing accordingly. Analyzing sales patterns during Winter, Summer, Christmas, and Spring Break can optimize business operations.

**Location Trends**: Analyzing sales data across various store locations and online channels can provide valuable insights into regional consumer behavior. This information can be used to tailor business decisions and meet the specific needs of different regions.

## Appendix





