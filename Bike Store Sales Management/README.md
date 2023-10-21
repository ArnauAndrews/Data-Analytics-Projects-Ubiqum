**Project Summary:**
This project involves creating detailed reports for marketing and sales teams using Power BI. The project aims to address specific business needs, including Year-to-Date (YTD) reports, margin percentages, production costs, sales vs. last year (LY), and categorizations for clients and products. The project leverages various Power BI features, including Data Analysis Expressions (DAX) functions, conditionals, switches, variables, and disconnected tables to achieve these objectives.

**Objectives Accomplished:**
1. **YTD Reports:** YTD reports were created using the `TOTALYTD` function to accumulate sales, margin, and production costs from the beginning of the year up to the current date.

2. **Margin Percentages:** Margin percentages were calculated using the `DIVIDE` function to divide margin values by total sales.

3. **Comparison with LY:** Measures were developed to compare YTD values with the same period of the previous year using the `DATEADD` function and `SAMEPERIODLASTYEAR` function.

4. **Categorization:** Clients, products, and resellers were categorized based on various conditions using nested `IF` functions and simplified using the `SWITCH` function.

5. **Variables:** Variables were introduced to simplify complex DAX measures, making them more readable and maintainable.

6. **Disconnected Tables:** Disconnected tables were created to allow users to select which measure to display in a single graph, making the reports more dynamic and space-efficient.

**Purpose:**
The project's primary purpose is to create comprehensive reports that address the specific needs of the marketing and sales teams. These reports provide insights into performance metrics, customer categorization, and product analysis. Power BI is used as the primary tool for data analysis, visualization, and reporting.

**Tools Used:**
1. **Power BI:** Power BI Desktop and Power BI Web are used for data analysis, modeling, and creating interactive reports and dashboards.

2. **Data Source:** The project uses the AdventureWorks Sales Sample database as a data source.

3. **DAX Functions:** Various DAX functions, including `TOTALYTD`, `DATEADD`, `DIVIDE`, `SWITCH`, and `SELECTEDVALUE`, are employed for data manipulation and calculations.

4. **Variables:** Variables are utilized to simplify complex DAX expressions.

5. **Disconnected Tables:** Disconnected tables are created to enable dynamic measure selection through slicers.

Overall, the project equips the marketing and sales teams with informative and customizable reports that facilitate data-driven decision-making.


![0001](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/13806798-7b94-4f92-ab68-47238a2824d3)
![0002](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/1f8e4b97-306f-4493-b1bd-35bb84550917)
![0003](https://github.com/ArnauAndrews/Data-Analytics-Projects-Ubiqum/assets/132329252/9c2f344f-9140-4941-81fc-76db8ece9a04)

