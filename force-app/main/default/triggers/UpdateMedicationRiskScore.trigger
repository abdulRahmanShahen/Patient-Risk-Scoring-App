trigger UpdateMedicationRiskScore on Medication__c (after Insert, after Update) {
if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) 
{UpdateMedicationRiskScoreHandler.UpdateMedicationRiskScore(Trigger.new);}

}