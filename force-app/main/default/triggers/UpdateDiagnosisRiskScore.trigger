trigger UpdateDiagnosisRiskScore on Diagnosis__c (after Insert, after Update) {

if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) 

{UpdateDiagnosisRiskScoreHandler.UpdateRiskScore(Trigger.new);}

}