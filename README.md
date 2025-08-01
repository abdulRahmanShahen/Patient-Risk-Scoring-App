# 🩺 Patient Risk Scoring in Salesforce Health Cloud  
**A Clean-Code, Trigger-Based Approach to Scoring Patient Risk Using Custom Metadata & Apex Frameworks**


## 📌 Project Overview

This project showcases a **modular, scalable, and testable** risk scoring system for **Patients** in Salesforce Health Cloud.  
It’s designed with Salesforce best practices in mind: **framework thinking**, **custom metadata**, and **separation of concerns** via **Trigger-Handler architecture**.

✅ **Admin-configurable logic** using **Custom Metadata Types**  
✅ **Multiple triggers** with **dedicated handlers**  
✅ Built with **Test-Driven Development** mindset  
✅ Follows **Single Responsibility Principle**

---

## 🧠 Problem Statement

Healthcare providers using Salesforce often need to assign **dynamic, rule-based risk scores** to patients — based on diagnoses, medications, or other conditions — without writing code every time the logic changes.

---

## 🎯 Solution Architecture

This solution lets **admins control the risk logic** from Setup using **Custom Metadata**, while Apex classes apply the logic during inserts/updates.


flowchart TD
  A[Diagnosis__c Trigger] --> B[DiagnosisTriggerHandler]
  B --> C[RiskScoreService]
  A2[Medication__c Trigger] --> B2[MedicationTriggerHandler]
  B2 --> C

  C --> D[Custom Metadata Rules: Risk_Criteria__mdt]
  C --> E[Patient__c: Update Risk_Score__c]


  🧪 Testing Coverage
100% logic coverage

Tested for:

Insert and update of Diagnosis__c

Insert and update of Medication__c

Valid and invalid conditions

No-matching metadata rule edge case

🧩 Extensibility
This system is easily extendable to:

Add risk rules for Lab Results, Procedures, etc.

Connect with Einstein Analytics dashboards

Generate alerts for High-Risk Patients

🔒 Permissions & Security
Custom Metadata is read-only in production

Business logic doesn’t require field-level changes

Bulk-safe: trigger handlers use List<Id> patterns

👨‍💻 Author
Abdalrahman Shaheen
Certified Salesforce Admin & Developer | Salesforce Engineering




