public class RiskCalculator {

    public static Integer calculateRiskScore(Id patientId) {
        Integer riskScore = 0;

        Map<String, Integer> weights = new Map<String, Integer>();
        for (Risk_Factor__mdt riskFactor : [
            SELECT Factor_Name__c, Weight__c FROM Risk_Factor__mdt
        ]) {
            weights.put(riskFactor.Factor_Name__c, Integer.valueOf(riskFactor.Weight__c));
        }

        // Diagnosis
        for (Diagnosis__c d : [
            SELECT Diagnosis_Type__c FROM Diagnosis__c WHERE Patient__c = :patientId
        ]) {
            if (d.Diagnosis_Type__c == 'Chronic') {
                riskScore += 2; 
            } else if (weights.containsKey(d.Diagnosis_Type__c)) {
                riskScore += weights.get(d.Diagnosis_Type__c);
            }
        }

        // Visits
        for (Visit__c v : [
            SELECT Type__c, Date__c FROM Visit__c WHERE Patient__c = :patientId
        ]) {
            if (v.Type__c == 'Emergency' && v.Date__c >= System.today().addDays(-30)) {
                riskScore += 3;
            } else if (weights.containsKey(v.Type__c)) {
                riskScore += weights.get(v.Type__c);
            }
        }

        // Medications
        for (Medication__c m : [
            SELECT Interaction_Risk_Level__c FROM Medication__c WHERE Patient__c = :patientId
        ]) {
            if (m.Interaction_Risk_Level__c == 'High') {
                riskScore += 4;
            }
        }

        return riskScore;
    }

    public static String classifyRisk(Integer riskScore) {
        if (riskScore >= 7) return 'High';
        else if (riskScore >= 4) return 'Moderate';
        else return 'Low';
    }
}
