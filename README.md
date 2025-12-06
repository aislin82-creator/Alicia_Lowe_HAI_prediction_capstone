Comparative Case Study: Machine Learning Approaches for Predicting Hospital-Acquired Infections (HAIs) in ICU Patients

By: Alicia Lowe
Capstone DS785

Overview:
This GitHub repository contains all the necessary code to create filtered MIMIC-IV tables from BigQuery, along with the RMD file for data cleaning, preprocessing, EDA, model building, and evaluation for HAI prediction. The project implemented Logistic Regression (LR), random forests (RF), XGBoost (XGB), and artificial neural networks (ANN), with models using 10-fold CV and 5-fold double cross-validation. 
Repository Structure:
SQL folder
	01_core_patients.sql – used to create the core patients table from MIMIC-IV
	02_create_diagnoses.sql – used to create a diagnosis table from patients in core patient table
	03_create_labs.sql – used to create labs table from core patient table
	04_creater_micro.sql – used to create microbiology results table from core patient table
	05_create_pharmacy.sql – used to create the pharmaceutical table from core patient table
	06_create_procedures.sql -used to create the procedures table from core patient table
Capstone.Rmd – All the cleaned R code needed to complete the capstone analysis
Visuals.docx – Word document with some of the final analysis plots and graphics
