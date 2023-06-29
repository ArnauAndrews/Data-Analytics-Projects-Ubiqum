# **UJIIndoorLoc Database - Exploratory Data Analysis (EDA)**

## **Goal of the Data Analysis**

The goal of the data analysis is to evaluate multiple machine learning models and determine the best one for indoor localization. The objective is to make a recommendation to the client and potentially incorporate the recommended model into a smartphone app for indoor locationing. The provided public dataset can be used to test the accuracy of localization algorithms based on Received Signal Strength Indicator (RSSI) levels or compare different localization algorithms under the same experimental framework.

## **Abstract**

This work presents a multi-building and multi-floor localization database based on WLAN fingerprinting. The database is the largest in the literature and the first publicly available database for indoor localization research. It includes comprehensive features and raw information captured by more than 20 users and 25 different mobile devices. The database aims to facilitate the comparison of state-of-the-art localization algorithms by providing a common dataset for researchers in the mobile sensing community.

## **Purpose of the Research**

The purpose of this research is to address the lack of a common database for comparing indoor localization methods based on WLAN fingerprinting. Existing works in the field often use their own data, making it challenging to compare different methods. By providing a publicly available database, researchers can obtain comparable results and make advancements in the field of indoor localization. The UJIIndoorLoc database presented in this work overcomes the limitations of previous databases, such as small size and limited coverage.

## **Advantages**

- **Easy deployment**: WLAN fingerprint-based methods are easy to deploy as they utilize the existing WLAN infrastructure without requiring additional hardware installation. This eliminates the need for extra infrastructure and associated costs.
- **No new hardware implementation**: The proposed approach is infrastructure-less and utilizes the already available WLAN access points (WAPs) to construct the database using mobile phones. This eliminates the need for implementing new hardware for indoor locationing.

## **Challenges**

- **Physical obstacles**: The indoor environment introduces physical obstacles such as walls and floors that weaken the radio signal (RSSI). Predicting the spread of radio signals in indoor environments is challenging due to reflections and multipath interference.
- **Motion effects**: The motion of the user carrying the mobile device affects the RSSI values. Different carrying positions or movements can influence the measured RSSI values in WLAN-based positioning systems.
- **Lack of a common database**: The lack of a common database for comparison purposes hinders the evaluation and comparison of different WLAN fingerprint-based localization methods. Each approach typically uses its own database, making it difficult to compare and benchmark different methods.

## **Contribution**

The main contribution of this work is the creation and presentation of the UJIIndoorLoc database, which is the largest and first publicly available database in the field. It covers a surface area of 108,703m2 across three buildings with 4 or 5 floors. The database contains 933 different places (reference points), with 21,049 sampled points captured for training/learning and validation/testing. The data collection involved more than 20 users and 25 different models of mobile devices.

## **Description of Each Variable**

- **001-520 RSSI levels**: The most important information for WLAN fingerprinting comparison purposes. Represented as a 520-element vector of integer values, where each value corresponds to the RSSI level of a specific Wireless Access Point (WAP) identified by its MAC address. RSSI levels are measured in decibels (dBm) and range from -100 dBm (very weak signal) to 0 dBm (extremely good signal).
- **521-523 Real-world coordinates of the sample points**: Represented by three values in each record, including longitude, latitude, and floor.
