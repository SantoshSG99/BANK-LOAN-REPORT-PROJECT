Detailed Overview of the Bank Loan Analysis Power BI Project
Objective: The objective of this project was to analyze loan performance, assess key metrics, and develop insightful, interactive dashboards to aid in strategic decision-making. The project aimed to provide a comprehensive view of loan applications, funding, repayments, and borrower characteristics to monitor loan health and identify trends or anomalies.

Step-by-Step Approach:
1. Data Preparation:
Data Source: A CSV file containing loan data was loaded into Power BI.
Data Quality Check: Data was reviewed in Power Query to identify any null values or inconsistencies. The dataset was in good quality, which allowed for smooth processing.
Date Table Creation: A custom date table was generated using the DAX function CALENDAR(min('financial_loan (1)'[issue_date]), max('financial_loan (1)'[issue_date])) for accurate time-based analysis.
Additional fields like "Month" and "Month Number" were created to facilitate time intelligence calculations.
Key Performance Indicators (KPIs):
1. Total Loan Applications:

Calculation: The total loan applications were calculated using COUNT('financial_loan (1)'[id]), which yielded 38.6K applications.
MTD (Month-to-Date) Loan Applications: Using DAX, CALCULATE(TOTALMTD([TOTAL LOAN APLICATION], 'date table'[Date])), the MTD figure was 4.3K.
MoM (Month-over-Month) Loan Applications: The percentage change between months was calculated as ([MTD LOAN APLICATION] - [PMTD LOAN APLICATION]) / [PMTD LOAN APLICATION], resulting in a 6.9% increase in applications.
2. Total Funded Amount:

Calculation: The total funded amount was determined with SUM('financial_loan (1)'[loan_amount]), amounting to $435.8M.
MTD Funded Amount: The MTD calculation using TOTALMTD([TOTAL FUNDED AMOUNT], 'date table'[Date]) showed $54.0M funded in the current month.
MoM Funded Amount: Month-over-Month funding change was 13.0%.
3. Total Amount Received:

Calculation: The total amount received from borrowers was calculated as SUM('financial_loan (1)'[total_payment]), which totaled $473.1M.
MTD Amount Received: Month-to-Date amount received was $58.1M.
MoM Amount Received: Month-over-Month change for received payments was 15.8%.
4. Average Interest Rate:

Calculation: The average interest rate was computed with AVERAGE('financial_loan (1)'[int_rate]), resulting in 12.0%.
MTD Interest Rate: The MTD interest rate stood at 12.4%.
MoM Interest Rate: Month-over-Month variation was 15.8%.
5. Average Debt-to-Income Ratio (DTI):

Calculation: The average DTI was determined using AVERAGE('financial_loan (1)'[dti]), equaling 13.3%.
MTD DTI: The current MTD DTI stood at 13.7%.
MoM DTI: Month-over-Month DTI change was 2.7%.
Loan Categorization:
To distinguish between "Good Loans" (fully paid or current loans) and "Bad Loans" (charged off loans), a new field was created in the data:

Good Loans:

Good Loan %: (CALCULATE([TOTAL LOAN APLICATION],'financial_loan (1)'[GOOD VS BAD LOAN] = "Good Loan")) / [TOTAL LOAN APLICATION], which was 86.2%.
Total Good Loan Applications: 33K.
Funded Amount: $370.2M.
Amount Received: $435.8M.
Bad Loans:

Bad Loan %: (CALCULATE([TOTAL LOAN APLICATION],'financial_loan (1)'[GOOD VS BAD LOAN] = "Bad Loan")) / [TOTAL LOAN APLICATION], which was 13.8%.
Total Bad Loan Applications: 5.3K.
Funded Amount: $65.5M.
Amount Received: $37.3M.
Dashboard Design:
1. Summary Dashboard:
This dashboard provides a high-level view of the key KPIs:

Donut Chart: Used to show the percentage of Good vs. Bad Loans.
KPI Cards: Display key statistics like total applications, funded amount, amount received, and MTD/MoM variations for each.
2. Overview Dashboard:
This dashboard focuses on deeper insights into loan performance and borrower behavior:

Monthly Trends (Line Chart): Analyzes seasonality and long-term trends in loan applications and funding.
Regional Analysis (Filled Map): Assesses lending activity across different states, revealing regional disparities.
Loan Term Analysis (Donut Chart): Breaks down loans by their term lengths.
Employee Length Analysis (Bar Chart): Examines how borrower employment length impacts loan applications.
Loan Purpose Breakdown (Bar Chart): Shows the distribution of loans based on their stated purpose.
Home Ownership Analysis (Tree Map): Visualizes the impact of home ownership on loan approvals and disbursements.
3. Detailed Dashboard:
This dashboard provides a granular, table-based view for in-depth analysis:

Grid View: Displays details such as loan ID, purpose, home ownership, grade, issue date, total funded amount, sum of interest, installment amount, and total amount received.
Slicers: Added for state, grade, and loan purpose, allowing users to filter data interactively and focus on specific segments.
Visualizations and Interactivity:
The dashboards include interactive elements like slicers for filtering by state, loan grade, and loan purpose.
Multiple chart types were employed (donut charts, line charts, filled maps, bar charts, and tree maps) to provide a rich, multi-faceted view of the data.
A Loan Status Grid View provides a consolidated overview of loan applications, funded amounts, and MTD metrics, aiding decision-makers in tracking loan performance efficiently.
Outcomes:
Enhanced Risk Management: By categorizing loans into Good and Bad, the project helped identify areas of high default risk.
Improved Strategic Insights: The regional and purpose-based analysis aided in understanding where loan applications were most concentrated and what borrowers sought financing for.
Informed Decision-Making: The detailed grid view and KPIs provided crucial insights into the bank’s lending performance, allowing stakeholders to make data-driven decisions.
Conclusion:
This Power BI project successfully delivered a comprehensive solution for bank loan analysis, providing a detailed view of loan metrics and performance through various interactive dashboards. It facilitated a deeper understanding of borrower behavior, loan health, and lending trends, thus empowering stakeholders to enhance strategic planning and risk management.
