public class UpdateVisitRiskScoreHandler {
public static void updateVisitRiskScore(List<Visit__c> visits) {
    Set<Id> patientIds = new Set<Id>();
    for (Visit__c v : visits) {
        if (v.Patient__c != null) {
            patientIds.add(v.Patient__c);
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
