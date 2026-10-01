# AI-Assisted Medicaid Program Integrity & Financial Risk Analytics

### A Business Analyst Case Study Using Microsoft Fabric, SQL, Python, AI/ML & Power BI

## Project Overview

This independent portfolio project demonstrates an end-to-end Business Analysis and Data Analytics workflow focused on Medicaid program integrity and financial risk analysis.

The project shows how public Medicaid data can be transformed into structured business requirements, analytical models, AI-assisted anomaly indicators, financial review metrics, and interactive Power BI reporting.

The solution follows the workflow:

**Business Problem → Requirements → Data Quality → Microsoft Fabric → SQL → Python/AI → Financial Risk Analysis → Power BI → UAT**

---

## Business Problem

Medicaid programs process large volumes of healthcare utilization and reimbursement data across geographic areas, products, utilization types, and reporting periods.

The objective of this case study was to design a repeatable analytical process that can help analysts:

* Identify statistically unusual utilization and reimbursement patterns
* Highlight financial indicators requiring additional review
* Understand reimbursement and utilization trends
* Prioritize observations for human review
* Present findings through an interactive business dashboard

The analysis is designed as a **decision-support tool** and does not determine fraud, improper payments, or confirmed financial loss.

---

## Project Objectives

* Translate a healthcare/financial business problem into documented requirements
* Perform stakeholder and process analysis
* Develop current-state and future-state processes
* Assess data quality and document limitations
* Analyze Medicaid utilization and reimbursement data using SQL
* Perform exploratory analysis using Python
* Apply AI-assisted anomaly detection
* Develop financial review indicators
* Build interactive Power BI dashboards
* Define user stories and acceptance criteria
* Perform UAT and analytical validation
* Demonstrate responsible AI and human oversight

---

## Data Sources

The project uses publicly available Medicaid data.

### State Drug Utilization Data

The primary analytical dataset contains more than **5.3 million records** covering 2024 Medicaid drug utilization information.

Key fields include:

* State
* Utilization Type
* Product/NDC information
* Quarter
* Units Reimbursed
* Number of Prescriptions
* Total Amount Reimbursed
* Medicaid Amount Reimbursed
* Non-Medicaid Amount Reimbursed
* Suppression indicator

A representative sample was created for portfolio demonstration and GitHub use.

### Medicaid Medical Loss Ratio (MLR) Data

MLR summary data was used for additional financial and program-level context.

Key fields include:

* State
* Program Name
* Program Type
* Eligibility Group
* Reporting Year
* MLR Numerator
* MLR Denominator
* Adjusted MLR
* Remittance Amount

---

## Technology Stack

| Technology       | Purpose                                          |
| ---------------- | ------------------------------------------------ |
| Microsoft Fabric | Data platform and analytical environment         |
| SQL              | Data analysis and financial metrics              |
| Python           | Data profiling, EDA and analytical modeling      |
| Scikit-learn     | AI-assisted anomaly detection                    |
| Power BI         | Interactive dashboards and reporting             |
| Excel            | Requirements, data quality and UAT documentation |
| Microsoft Word   | BRD and business analysis documentation          |
| GitHub           | Portfolio and project documentation              |

---

## Business Analysis Deliverables

The project includes:

* Stakeholder Analysis
* Requirements Gathering Approach
* Business Requirements
* Functional Requirements
* Non-Functional Requirements
* Business Rules
* As-Is Process
* To-Be Process
* Gap Analysis
* Process Improvement Analysis
* Requirements Traceability Matrix
* Business Requirements Document
* User Stories
* Acceptance Criteria
* UAT Test Cases

---

## Data & Analytics

### SQL Analysis

SQL was used to analyze:

* Reimbursement by state
* Prescription volume
* Quarterly reimbursement trends
* Utilization type
* Reimbursement per prescription
* Product-level reimbursement
* Financial concentration
* MLR remittance metrics

### Python Analysis

Python was used for:

* Data profiling
* Missing-value analysis
* Suppression analysis
* Exploratory data analysis
* Feature engineering
* Financial metric analysis
* AI-assisted anomaly detection

---

## AI-Assisted Anomaly Detection

An **Isolation Forest** model was used to identify statistically unusual observations within the usable analytical sample.

The model considered features including:

* Units reimbursed
* Number of prescriptions
* Total reimbursement
* Reimbursement per prescription

The model identified:

**263 unusual observations**

representing approximately:

**5.01% of the usable analytical sample**

The results were combined with financial indicators to create review-priority categories.

These outputs are **analytical indicators only** and do not establish fraud, waste, abuse, improper payments, or confirmed financial loss.

---

## Financial Risk Analysis

Financial review indicators were developed using:

* Total reimbursement
* Prescription volume
* Reimbursement per prescription
* High reimbursement indicators
* High prescription indicators
* Anomaly scores

The purpose was to help analysts prioritize observations for additional validation and human review.

---

## Power BI Dashboard

The Power BI solution contains three primary pages:

### 1. AI Anomaly Summary

Provides executive-level KPIs and a high-level view of unusual observations.

### 2. AI Anomaly Review Results

Provides detailed analytical review information including:

* State/geography
* Quarter
* Reimbursement
* Reimbursement per prescription
* Anomaly score
* Review priority
* Risk category

### 3. Business Impact

Translates analytical findings into business-focused insights, review processes, and governance considerations.

Dashboard screenshots are available in the **Power BI** folder.

---

## Validation & UAT

The project includes defined UAT scenarios covering:

* Dashboard calculations
* SQL/Python reconciliation
* Data quality rules
* Suppression handling
* Anomaly methodology
* Financial indicators
* Dashboard filtering
* Governance and human-review requirements

The validation approach ensures that analytical outputs are traceable back to documented requirements and calculations.

---

## Key Data Limitations

Several limitations were identified and documented:

* A large portion of utilization/financial fields may be suppressed.
* Suppressed values are not treated as zero.
* The source contains an `XX` geographic category representing an unmapped/unknown geography rather than a U.S. state.
* Provider-level identifiers are not available in the analytical dataset.
* The AI model identifies unusual statistical patterns; it does not determine fraud or improper payments.
* The analytical sample is used for portfolio demonstration and does not represent an official Medicaid risk assessment.

---

## Business Analyst Perspective

This project demonstrates experience across the complete analytical lifecycle:

**Stakeholder Needs → Requirements → Process Analysis → Data Strategy → Analytics → AI-Assisted Insights → Reporting → UAT → Business Impact**

The Business Analyst responsibilities demonstrated in this case study include:

* Requirements gathering
* Stakeholder analysis
* Process modeling
* Business rules
* Data requirements
* Analytical requirements
* User stories
* Acceptance criteria
* UAT planning
* Data validation
* Dashboard requirements
* AI governance
* Business communication

---

## Project Disclaimer

This is an independent portfolio case study using publicly available Medicaid data. It is not an official CMS, state Medicaid agency, or government implementation.

The analytical findings are intended for demonstration and decision-support purposes only and do not establish fraud, improper payments, confirmed financial loss, or actual savings.

---

## Author

**Srikanth**

Business Analyst | Data Analyst | Healthcare Analytics

**Core Skills:** Business Analysis, Requirements Gathering, SQL, Python, Power BI, Microsoft Fabric, Data Analytics, Healthcare Analytics, AI-Assisted Analytics, UAT
