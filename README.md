🏥 Patient Risk Scoring Engine – Salesforce
A real-world simulation of a clinical risk scoring system built entirely in Salesforce using Apex, Triggers, Custom Metadata, and Dynamic Forms. This project demonstrates how you can automate patient risk assessment based on clinical data and best practices.

📌 Project Goal
To automatically calculate and update each patient’s Risk_Score__c and categorize them as Low, Medium, or High Risk based on:

Their diagnoses

Their medications

This supports healthcare providers in prioritizing care, preventing complications, and identifying high-risk patients early.

🧩 Architecture Overview
The system is composed of:

Custom Objects:
Object	Description
Patient__c	Main entity representing a patient
Diagnosis__c	Stores patient diagnoses (linked to patient)
Medication__c	Stores patient medications (linked to patient)

Core Components:
Component	Purpose
Apex Triggers	Automatically recalculate score on insert/update
Trigger Handler Classes	Clean separation of logic per object
RiskScoringService	Central service to calculate and update risk
Custom Metadata: Risk_Map__mdt	Stores risk values for diagnoses and medication types
Validation Rules	Ensures data completeness and accuracy
Dynamic Forms + Visibility	Highlights High Risk patients visually

🛠️ How It Works
When a Diagnosis__c or Medication__c is added or updated:

Trigger fires and delegates logic to its handler

Handler calls the shared RiskScoringService

The service:

Pulls all related diagnoses/medications

Matches them with values in Custom Metadata

Calculates total Risk_Score__c

Updates the Risk_Level__c field (Low / Medium / High)

If a patient is High Risk, a red alert banner shows on the record page using Dynamic Forms Visibility Rules.

💡 Why Custom Metadata?
Flexible and Configurable: No hardcoded logic

Easily Extendable: Add new diagnoses/medications without touching code

Admin-Friendly: Changes can be made from Setup without deployment 
Test Coverage
+85% test coverage across all classes

Includes edge cases (e.g., patients with no diagnoses, multiple high-risk meds)

🧪 Admin Features
Validation Rules to prevent incomplete records

Formula Fields to show risk visually

Record Types (if needed for segmentation)

Field-Level Security for controlled visibility


⚙️ Developer Details
Apex Structure


force-app/
├── main/
│   └── default/
│       ├── classes/
│       │   ├── RiskScoringService.cls
│       │   ├── DiagnosisTriggerHandler.cls
│       │   ├── MedicationTriggerHandler.cls
│       │   └── [Test Classes...]
│       ├── triggers/
│       │   ├── UpdateDiagnosisRiskScore.trigger
│       │   └── UpdateMedicationRiskScore.trigger
│       └── metadata/
│           └── Risk_Map__mdt



🧑‍💼 About Me
I'm a Salesforce Certified Developer & Admin, currently seeking opportunities in:

HealthTech / Health Informatics Projects

Salesforce Back-End Development

Medical CRM Automation

Let’s connect 👉 [https://www.linkedin.com/in/abdul-rahman-shaheen-ab145a24al](https://www.linkedin.com/in/abdul-rahman-shaheen-ab145a24a/)


🟢 Status
🛠️ Project Complete
📦 Ready for review
🚀 Currently open for contributions & collaboration






