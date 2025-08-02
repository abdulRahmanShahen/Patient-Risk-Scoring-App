public  class WeeklyRiskScoreUpdate implements Schedulable {
    public static  void execute(SchedulableContext sc) {
        List<Patient__c> patients = [SELECT Id, Risk_Score__c FROM Patient__c];

        for (Patient__c p : patients) {

            if (p.Risk_Score__c != null) {
                if (p.Risk_Score__c >= 80) p.Risk_Level__c = 'High';
                else if (p.Risk_Score__c >= 50) p.Risk_Level__c = 'Moderate';
                else p.Risk_Level__c = 'Low';
            }
        }

        update patients;
    }
}