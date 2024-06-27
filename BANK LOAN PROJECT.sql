


-- TOTAL LOAN APPLICATION
SELECT FORMAT(COUNT(id), 'N0') AS total_loan_apllication
FROM [financial_loan (1)]

-- MTD LOAN APPLICATIONS
SELECT FORMAT(COUNT(id), 'N0') AS MTD_loan_apllication
FROM [financial_loan (1)]
where issue_date >=DATEADD(MONTH,-1,(select max(issue_date) from [financial_loan (1)])) 
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))

-- PMTD LOAN APLICATION
SELECT FORMAT(COUNT(id), 'N0') AS MTD_loan_apllication
FROM [financial_loan (1)]
where MONTH(issue_date) =11  
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))


-- TOTAL FUNDED AMOUNT 
Select format(sum(loan_amount),'N0') TOTAL_FUNDED_AMOUNT from [financial_loan (1)]


--MTD FUNDED AMOUNT
SELECT FORMAT(SUM(loan_amount), 'N0') AS MTD_FUNDED_AMOUNT
FROM [financial_loan (1)]
where issue_date >=DATEADD(MONTH,-1,(select max(issue_date) from [financial_loan (1)])) 
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))


-- PMTD FUNDED AMOUNT
SELECT FORMAT(SUM(loan_amount), 'N0') AS PMTD_FUNDED_AMOUNT
FROM [financial_loan (1)]
where month(issue_date ) =11
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))


-- TOTAL_AMOUNT_RECIVED
Select format(sum(total_payment),'N0') TOTAL_AMOUNT_RECIVED from [financial_loan (1)]

-- MTD_TOTAL_AMOUNT_RECIVED
SELECT FORMAT(SUM(total_payment), 'N0') AS MTD_TOTAL_AMOUNT_RECIVED
FROM [financial_loan (1)]
where issue_date >=DATEADD(MONTH,-1,(select max(issue_date) from [financial_loan (1)])) 
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))

-- PMTD_TOTAL_AMOUNT_RECIVED
SELECT FORMAT(SUM(total_payment), 'N0') AS PMTD_TOTAL_AMOUNT_RECIVED
FROM [financial_loan (1)]
where month(issue_date ) =11
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))


-- AVG_INTEREST_RATE
SELECT  round(AVG(int_rate),4)*100 as AVG_INTEREST_RATE FROM [financial_loan (1)]


-- MTD_AVG_INTEREST_RATE

SELECT  round(AVG(int_rate),4)*100 as MTD_AVG_INTEREST_RATE FROM [financial_loan (1)]
where issue_date >= DATEADD(month,-1,(select max(issue_date) from [financial_loan (1)]))
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))


-- PMTD_AVG_INTREST_RATE

SELECT  round(AVG(int_rate),4)*100 as PMTD_AVG_INTEREST_RATE FROM [financial_loan (1)]
where MONTH(issue_date) = 11  
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))


-- AVG_DTI
SELECT  round(AVG(dti),4)*100 as AVG_DTI FROM [financial_loan (1)]

-- MTD_AVG_DTI
SELECT  round(AVG(dti),4)*100 as MTD_AVG_DTI FROM [financial_loan (1)]
where issue_date >= DATEADD(month,-1,(select max(issue_date) from [financial_loan (1)]))
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))

-- PMTD_AVG_DTI
SELECT  round(AVG(dti),4)*100 as PMTD_AVG_DTI FROM [financial_loan (1)]
where MONTH(issue_date) = 11  
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))


-- GOOD_LOAN_APLICATION_PERCENTAGE
 SELECT  
		(COUNT(CASE WHEN loan_status ='Fully paid' or loan_status ='Current' then id end ) * 100) / count(id)  as Good_loan_percentage
		FROM [financial_loan (1)]

-- GOOD_LOAN_APLICATION
SELECT FORMAT(COUNT(id),'N0') AS GOOD_LOAN_APLICATION FROM [financial_loan (1)]
WHERE loan_status = 'Fully paid' or loan_status= 'Current'

-- GOOD_LOAN_FUNDED_AMOUNT
SELECT FORMAT(SUM(loan_amount),'N0') AS GOOD_LOAN_FUNDED_AMOUNT FROM [financial_loan (1)]
WHERE loan_status = 'Fully paid' or loan_status= 'Current'

-- GOOD_LOAN_RECIVED_AMOUNT
SELECT FORMAT(SUM(total_payment),'N0') AS GOOD_LOAN_RECIVED_AMOUNT FROM [financial_loan (1)]
WHERE loan_status = 'Fully paid' or loan_status= 'Current'

--BAD_LOAN_APLICATION_PERCENTAGE
 SELECT  
		(COUNT(CASE WHEN loan_status ='Charged off' then id end ) * 100) / count(id)  as bad_loan_percentage
		FROM [financial_loan (1)]

--BAD__LOAN_APLICATION
SELECT FORMAT(COUNT(id),'N0') AS BAD_LOAN_APLICATION FROM [financial_loan (1)]
WHERE loan_status = 'Charged off'

--BAD_LOAN_FUNDED_AMOUNT
SELECT FORMAT(SUM(loan_amount),'N0') AS BAD_LOAN_FUNDED_AMOUNT FROM [financial_loan (1)]
WHERE loan_status = 'Charged off'


--BAD_LOAN_RECIVED_AMOUNT
SELECT FORMAT(SUM(total_payment),'N0') AS BAD_LOAN_RECIVED_AMOUNT FROM [financial_loan (1)]
WHERE loan_status = 'Charged off'


-- LOAN_STATUS
 SELECT  loan_status, 
		FORMAT(COUNT(id),'N0') AS LOANCOUNT,
		FORMAT(SUM(total_payment),'N0') AS TOTAL_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS TOTAL_AMOUNT_FUNDED,
		ROUND(AVG(int_rate *100),4) AS INTEREST_RATE,
		ROUND(AVG(dti * 100),4) AS DTI
													FROM [financial_loan (1)]
GROUP BY loan_status


-- MTD_LOAN_STATUS

 SELECT  loan_status, 
		
		FORMAT(SUM(total_payment),'N0') AS MTD_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS MTD_AMOUNT_FUNDED
															FROM [financial_loan (1)]
WHERE  issue_date >= DATEADD(month,-1,(select max(issue_date) from [financial_loan (1)]))
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))

GROUP BY loan_status

-- PMTD_LOAN_STATUS

 SELECT  loan_status, 
		
		FORMAT(SUM(total_payment),'N0') AS PMTD_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS PMTD_AMOUNT_FUNDED
															FROM [financial_loan (1)]
WHERE  MONTH(issue_date) = 11
				and (issue_date >= DATEADD(YEAR,-1,(select max(issue_date) from [financial_loan (1)])))

GROUP BY loan_status


-- MONTHLY_TREND
SELECT	
		MONTH(issue_date) AS MONTH_NUM,
		DATENAME(MONTH,issue_date) AS MONTH_NAME,
		FORMAT(COUNT(id),'N0') AS TOTAL_LOAN_APLICATIONS,
		FORMAT(SUM(total_payment),'N0') AS TOTAL_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS TOTAL_AMOUNT_FUNDED
																FROM [financial_loan (1)]
GROUP BY MONTH(issue_date),DATENAME(MONTH,issue_date)
ORDER BY MONTH(issue_date)

-- BY_ADRESS_STATE

 SELECT  address_state, 
		FORMAT(COUNT(id),'N0') AS TOTAL_APLICATION,
		FORMAT(SUM(total_payment),'N0') AS TOTAL_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS TOTAL_AMOUNT_FUNDED
		
													FROM [financial_loan (1)]
GROUP BY address_state
ORDER BY TOTAL_AMOUNT_RECIVED DESC



-- LOAN_TERM

 SELECT  term, 
		FORMAT(COUNT(id),'N0') AS TOTAL_APLICATION,
		FORMAT(SUM(total_payment),'N0') AS TOTAL_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS TOTAL_AMOUNT_FUNDED
		
													FROM [financial_loan (1)]
GROUP BY term
ORDER BY TOTAL_AMOUNT_RECIVED DESC

-- BY EMP_LENGTH

SELECT  emp_length, 
		FORMAT(COUNT(id),'N0') AS TOTAL_APLICATION,
		FORMAT(SUM(total_payment),'N0') AS TOTAL_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS TOTAL_AMOUNT_FUNDED
		
													FROM [financial_loan (1)]
GROUP BY emp_length
ORDER BY TOTAL_APLICATION DESC

-- PURPOSE
SELECT  purpose, 
		FORMAT(COUNT(id),'N0') AS TOTAL_APLICATION,
		FORMAT(SUM(total_payment),'N0') AS TOTAL_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS TOTAL_AMOUNT_FUNDED
		
													FROM [financial_loan (1)]
GROUP BY purpose


-- HOME OWNERSHIP
SELECT  home_ownership, 
		COUNT(id) AS TOTAL_APLICATION,
		FORMAT(SUM(total_payment),'N0') AS TOTAL_AMOUNT_RECIVED,
		FORMAT(SUM(loan_amount),'N0') AS TOTAL_AMOUNT_FUNDED
		
													FROM [financial_loan (1)]
GROUP BY home_ownership
ORDER BY TOTAL_APLICATION DESC


