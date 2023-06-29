**Access the following link to view the full project published in RPubs**:

https://rpubs.com/ArnauAndrews/1057199

**I have developed a comprehensive time series dashboard** that enables Smart Home owners to analyze and visualize their power consumption data over time, facilitating informed decision-making and empowering them to adopt energy-saving habits.

# Smart Home Power Consumption Analysis

This project aims to analyze and forecast power consumption data from a large 'Smart Home' apartment housing development. The goal is to provide evidence for the adoption of electrical sub-metering devices used for power management in Smart Homes, as well as empower Smart Home owners with greater understanding and control of their power usage.

## Table of Contents

- [Project Overview](#project-overview)
- [Onboarding Process](#onboarding-process)
- [Dataset Information](#dataset-information)
- [Data Insights and Recommendations](#data-insights-and-recommendations)
- [Forecasting and Analysis Summary](#forecasting-and-analysis-summary)
- [Recommendations for Sub-metering Company](#recommendations-for-sub-metering-company)
- [Conclusion](#conclusion)

## Project Overview

We have been tasked with conducting an analytical deep dive into sub-metering generated data and producing high-quality visualizations that support a positive narrative around the benefits of sub-meters. Additionally, we need to demonstrate the ability to predict future energy consumption based on the same data.

## Onboarding Process

To ensure a successful project, the following steps should be taken during the onboarding process:

- **Conduct research** to understand the client's business, specifically Smart Homes, sub-meters, and household power consumption.
- **Identify any skill or knowledge gaps** and fill them through self-learning, focusing on data munging, sub-setting, DateTime manipulation, and Time Series analysis.
- **Perform an initial exploration of the data**, addressing potential issues, conducting preprocessing, and noting summary statistics.
- **Hold a project kick-off meeting** with the client to present the project details and initial data exploration findings.
- **Create a PowerPoint presentation** to be delivered during the kick-off meeting, providing confidence in the analysis process and showcasing the project's relevance to the client's business needs.

## Dataset Information

The dataset contains 47 months of energy usage data from sub-meters in a house located in Sceaux, France. The data includes measurements of electric power consumption from three sub-meters with a one-minute sampling rate.

## Data Insights and Recommendations

Based on the analysis of the power consumption data, the following insights and recommendations were derived:

- AC power consumption peaks around noon, suggesting the need to adjust temperature settings when leaving home.
- A decreasing trend in **Water Heater & AC consumption** was observed in 2008, indicating a potential for power savings in the future.
- Power consumption in the kitchen varies, likely due to dishwasher usage.
- Adding outdoor temperature data to the dataset would provide insights based on temperature changes.
- Separating Water Heater and AC into two different sub-meters would make it easier to understand power consumption for these appliances.
- Generating a consumption comparison between the current month and the previous month can help homeowners identify behaviors that lead to lower power usage.
- Developing a reminder system to alert homeowners when power consumption reaches a certain threshold would encourage energy-saving habits.
- Creating an app for homeowners to monitor power consumption in real-time can promote awareness and enable informed decisions.
- Generating reports on the amount of power saved through the use of sub-meters would showcase the benefits to the utility company.

<img width="536" alt="Screenshot 2023-06-23 at 17 19 44" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/665e13fa-2aab-4064-a3bd-155a833af64a">

## Forecasting and Analysis Summary

The forecasting and analysis process included cleaning and preprocessing the dataset, followed by exploratory data analysis. The findings can be summarized as follows:

- Linear models were a good fit for monthly data but performed poorly for daily frequency predictions.
- Holt-Winters approach showed promise in predicting monthly and hourly consumption trends, but the wide confidence intervals limited their usefulness.

![Unknown](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/d2954e50-f30d-4571-b838-99642db18a49)

- The accuracy of predictions can be improved by incorporating additional variables such as the number of residents, outdoor temperature, electricity price, and household income changes.
- Alternative modeling approaches, such as random forest or gradient boosting, could be explored for more accurate predictions.

## Recommendations for Sub-metering Company

Based on the analysis and forecasting results, the following recommendations are made to the sub-metering company:

- Install an additional sub-meter to capture the energy consumption of devices outside the three sub-metered areas, such as heating systems.
- Alternatively, reconsider the placement of the existing sub-meters to capture the most power-consuming appliances accurately.
- Explore the use of additional variables and advanced modeling techniques to improve the accuracy of predictions.
- Continue data collection and analysis to identify other devices' power consumption patterns in different rooms.

<img width="512" alt="Screenshot 2023-06-23 at 17 19 11" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/005a1f09-1f21-4743-89ed-806e6941fd27">


- Provide clear consumption comparisons and reminders to homeowners, encouraging energy-saving behaviors.

## Conclusion

This project aims to provide insights and forecasting capabilities for a sub-metering company operating in the Smart Home sector. By analyzing power consumption data, we can empower Smart Home owners with better understanding and control of their energy usage. The recommendations provided will assist the developer in offering highly efficient Smart Homes that provide owners with valuable power usage analytics.

The project also proposes the development of a dashboard application that enables homeowners to manage their power consumption effectively. The dashboard app will have the following features:

1. **Visualization of Power Consumption**: The app will provide intuitive visualizations that allow homeowners to monitor their power consumption patterns over time. This includes daily, monthly, yearly, weekly, seasonal, hour views, as well as comparisons between different sub-meters and appliances.
   
![newplot](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/c4bb2129-dabc-4609-ad45-32f35fddcb7f)>

![newplot-2](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/ec92c57d-e0ae-41d6-bca8-0faff4cf7311)

![newplot-3](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/22261126-5e56-4144-a6b2-eeb09598a964)

![newplot-4](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/7c93eadb-c775-486d-af50-59023c15982f)

![newplot-5](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/21835956-e237-485d-8c28-01dd5694b89f)

![newplot-6](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/e459bab9-3ac5-4e49-b1a9-1ef99cea6fcd)

2. **Real-time Monitoring**: Homeowners will be able to track their power consumption in real-time, allowing them to identify any sudden spikes or unusual patterns. This feature promotes awareness and encourages energy-saving habits.


https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/72efffd7-f1d1-4f59-a3f8-ac230a4c8972

3. **Customizable Alerts**: The dashboard app will allow homeowners to set custom thresholds for power consumption. When the consumption exceeds the specified threshold, the app will send alerts and reminders to prompt energy-saving actions.

4. **Recommendations and Tips**: Based on the analysis of power consumption data, the app will provide personalized recommendations and energy-saving tips to homeowners. This will help them make informed decisions and optimize their power usage.

5. **Usage Comparison**: The app will enable homeowners to compare their current power consumption with previous periods, such as the previous month or year. This feature will help identify behaviors or changes that lead to lower power usage and encourage sustainable practices.

<img width="503" alt="Screenshot 2023-06-23 at 17 19 22" src="https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/0e0c073e-fef4-443a-87de-02093ea47ff9">


Overall, the dashboard app will serve as a powerful tool for homeowners to manage their power consumption efficiently, promote energy-saving behaviors, and contribute to a more sustainable and environmentally friendly Smart Home ecosystem.

