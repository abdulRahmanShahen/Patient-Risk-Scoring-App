public  class UpdateMedicationRiskScoreHandler {
public static void UpdateMedicationRiskScore(list<Medication__c> medications) {
set <Id> patientIds = new Set<Id>();
for (Medication__c m : medications) {
    if (m.Patient__c != null) {
        patientIds.add(m.Patient__c);
    }
}
if (patientIds.isEmpty()) return;

list<Patient__c> patientsToUpdate = new List<Patient__c>();
for (Id patientId : patientIds) {
    Integer riskScore = RiskCalculator.calculateRiskScore(patientId);
    String level = RiskCalculator.classifyRisk(riskScore);
    patientsToUpdate.add(new Patient__c(
        Id = patientId,
        Risk_Score__c = riskScore,
        Risk_Level__c = level
    ));
}


}
}