# "Optimizing Indoor Localization: Evaluating Machine Learning Models Using a WLAN Fingerprinting Database"

## Table of Contents
- [Goal of the Data Analysis](#goal-of-the-data-analysis)
- [Abstract](#abstract)
- [Purpose of the Research](#purpose-of-the-research)
- [Advantages](#advantages)
- [Challenges](#challenges)
- [Contribution](#contribution)
- [Description of Each Variable](#description-of-each-variable)
- [Table 1: Longitude Models](#table-1-longitude-models)
- [Table 2: Latitude Models](#table-2-latitude-models)
- [Table 3: Building-Floor Models](#table-3-building-floor-models)
- [Making Predictions with the Best Model](#making-predictions-with-the-best-model)
- [Findings and Conclusions](#findings-and-conclusions)
- [Applications and Next Steps](#applications-and-next-steps)
- [Usability and Purpose](#usability-and-purpose)

## Goal of the Data Analysis

The goal of the data analysis is to evaluate multiple machine learning models and determine the best one for indoor localization. The objective is to make a recommendation to the client and potentially incorporate the recommended model into a smartphone app for indoor locationing. The provided public dataset can be used to test the accuracy of localization algorithms based on Received Signal Strength Indicator (RSSI) levels or compare different localization algorithms under the same experimental framework.

## Abstract

This work presents a multi-building and multi-floor localization database based on WLAN fingerprinting. The database is the largest in the literature and the first publicly available database for indoor localization research. It includes comprehensive features and raw information captured by more than 20 users and 25 different mobile devices. The database aims to facilitate the comparison of state-of-the-art localization algorithms by providing a common dataset for researchers in the mobile sensing community.

## Purpose of the Research

The purpose of this research is to address the lack of a common database for comparing indoor localization methods based on WLAN fingerprinting. Existing works in the field often use their own data, making it challenging to compare different methods. By providing a publicly available database, researchers can obtain comparable results and make advancements in the field of indoor localization. The UJIIndoorLoc database presented in this work overcomes the limitations of previous databases, such as small size and limited coverage.

## Advantages

- **Easy deployment**: WLAN fingerprint-based methods are easy to deploy as they utilize the existing WLAN infrastructure without requiring additional hardware installation. This eliminates the need for extra infrastructure and associated costs.
- **No new hardware implementation**: The proposed approach is infrastructure-less and utilizes the already available WLAN access points (WAPs) to construct the database using mobile phones. This eliminates the need for implementing new hardware for indoor locationing.

## Challenges

- **Physical obstacles**: The indoor environment introduces physical obstacles such as walls and floors that weaken the radio signal (RSSI). Predicting the spread of radio signals in indoor environments is challenging due to reflections and multipath interference.
- **Motion effects**: The motion of the user carrying the mobile device affects the RSSI values. Different carrying positions or movements can influence the measured RSSI values in WLAN-based positioning systems.
- **Lack of a common database**: The lack of a common database for comparison purposes hinders the evaluation and comparison of different WLAN fingerprint-based localization methods. Each approach typically uses its own database, making it difficult to compare and benchmark different methods.

## Contribution

The main contribution of this work is the creation and presentation of the UJIIndoorLoc database, which is the largest and first publicly available database in the field. It covers a surface area of 108,703m2 across three buildings with 4 or 5 floors. The database contains 933 different places (reference points), with 21,049 sampled points captured for training/learning and validation/testing. The data collection involved more than 20 users and 25 different models of mobile devices.

![Map-of-the-UJI-Riu-Sec-Campus-and-zoom-on-the-Tx-Buildings-Pink-refers-to-the-ESTCE-Tx](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/5844dfa4-7f4e-471d-aacf-e8867d831de3)


## Description of Each Variable

- **001-520 RSSI levels**: The most important information for WLAN fingerprinting comparison purposes. Represented as a 520-element vector of integer values, where each value corresponds to the RSSI level of a specific Wireless Access Point (WAP) identified by its MAC address. RSSI levels are measured in decibels (dBm) and range from -100 dBm (very weak signal) to 0 dBm (extremely good signal).
- **521-523 Real-world coordinates of the sample points**: Represented by three values in each record, including longitude, latitude, and floor.

**Plot of the initial dataset**

![plot_rotation](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/057c5b53-f3fc-450f-8247-8774fffba51a)

## Table 1: Longitude Models

|         Model         | R-Squared |    RMSE   |
|-----------------------|-----------|-----------|
| Decision Tree         |   0.9757  |  350.717  |
| **Extra Trees**       | **0.9896** | **150.110** |
| RandomForest          |   0.9843  |  226.328  |
| Bagging               |   0.9804  |  283.040  |
| LGBM                  |   0.9719  |  404.880  |

## Table 2: Latitude Models

|         Model         | R-Squared |   RMSE    |
|-----------------------|-----------|-----------|
| Decision Tree         |   0.9237  |  376.370  |
| **Extra Trees**       | **0.9631** | **181.944** |
| RandomForest          |   0.9588  |  203.194  |
| Bagging               |   0.9519  |  237.132  |
| LGBM                  |   0.9419  |  286.704  |

## Table 3: Building-Floor Models

|        Model        |   Recall  | F1-Score | Accuracy |
|---------------------|-----------|----------|----------|
| LGBMClassifier      |  0.8526   | 0.8293   | 0.8632   |
| **RandomForestClassifier** |  **0.8572**   | **0.8541**   | **0.8776**   |
| ExtraTreesClassifier |  0.8453   | 0.8350   | 0.8596   |
| BaggingClassifier   |  0.7442   | 0.7303   | 0.7624   |
| SVC              | 0.7986 | 0.7916 | 0.8020   |

# Making Predictions with the Best Model

To achieve the most accurate predictions, we followed a coherent order of prediction using a combination of classifiers and regressors. We experimented with different orders, considering the variables in the following sequence: **Building-Floor**, **Latitude**, and **Longitude**.

- We started by making predictions for the variable that best predicted the model: **Longitude**. These predicted values were then incorporated into the dataset as an independent variable.
- Next, we performed a train-test split on the dataset, considering **Building-Floor**, **Latitude**, and the **appended Longitude predictions**. We allocated 50% of the samples for testing, resulting in a test dataset containing **50,750 samples**.
- We appended the latitude predictions to the dataset and proceeded to make predictions for **Latitude**.
- Following the same train-test split procedure, this time considering **Building-Floor** and the appended **Longitude and Latitude**.

**Best First Model**: Extra Trees Regressor for the **Longitude** variable. We utilized this model to make predictions for Longitude using the test dataset.

Through this approach, we aimed to leverage the predictive accuracy of the models and continually improve the predictions for each subsequent variable based on the already predicted variables.

## Findings and Conclusions

By applying the aforementioned methodology, we were able to make predictions for the variables in a coherent order, considering their dependencies. **By leveraging the initial predictions with the highest accuracy, we improved the overall predictive performance of the model.**

- The use of different models for classification and regression tasks allowed us to optimize the predictions for each variable. 
- We observed that the Extra Trees Regressor performed exceptionally well in predicting the **Longitude** variable.

In conclusion, our approach of iteratively predicting variables based on the best model and incorporating the predicted values into the dataset yielded improved results. This methodology can be applied to similar prediction tasks to enhance the accuracy and reliability of the predictions.

**Interactive plot of the predictions**

[https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/5776df6f-63a9-4f5a-9236-30f5ee04c688
](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/20f7f4ba-c380-4614-96bf-c9139754be12)

# Applications and Next Steps

## Applications

The developed methodology and predictive models have various applications in the field of indoor localization and mobile sensing. Some potential applications include:

- **Indoor Navigation**: The accurate prediction of building, floor, latitude, and longitude can be leveraged to develop smartphone apps for indoor navigation, helping users navigate complex indoor environments with ease.
- **Location-based Services**: By accurately determining the user's indoor location, location-based services such as personalized recommendations, targeted advertising, and resource allocation can be optimized.
- **Asset Tracking**: The ability to predict the precise indoor location can be utilized for tracking and managing assets within large indoor spaces, such as warehouses, hospitals, or shopping centers.

## Next Steps

While the current project has provided valuable insights and predictive models for indoor localization, there are several potential avenues for further exploration and improvement:

- **Model Refinement**: Fine-tuning and optimizing the existing models can potentially enhance their predictive accuracy and performance.
- **Feature Engineering**: Exploring additional features, such as time-based patterns, environmental conditions, or user behavior, could lead to improved predictions and a more comprehensive understanding of indoor localization.
- **Real-time Implementation**: Adapting the predictive models and algorithms for real-time implementation on mobile devices would enable instant indoor localization and navigation capabilities.

# Usability and Purpose

By following the provided methodology and leveraging the predictive models, users can benefit from improved indoor localization accuracy, leading to enhanced indoor navigation experiences, location-based services, and asset management. The project serves as a foundation for further research and development in the field, driving innovation and practical applications in the domain of indoor localization.
