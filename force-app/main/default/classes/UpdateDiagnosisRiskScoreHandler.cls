public class UpdateDiagnosisRiskScoreHandler {
public static void UpdateRiskScore(List<Diagnosis__c> diagnoses) {
Set<Id> patientIds = new Set<Id>();
for (Diagnosis__c d : diagnoses) {
if (d.Patient__c != null) {
    patientIds.add(d.Patient__c);
}
}

if (patientIds.isEmpty()) return;

List<Patient__c> patientsToUpdate = new List<Patient__c>();
for (Id patientId : patientIds) {
Integer riskScore = RiskCalculator.calculateRiskScore(patientId);
String level = RiskCalculator.classifyRisk(riskScore);
patientsToUpdate.add(new Patient__c(
    Id = patientId,
    Risk_Score__c = riskScore,
    Risk_Level__c = level
));
}

if (!patientsToUpdate.isEmpty()) {
update patientsToUpdate;
}
}
}
