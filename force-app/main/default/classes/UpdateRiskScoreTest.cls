@isTest
public class UpdateRiskScoreTest {
    
    @isTest
     public static void testUpdateRiskScoreTrigger() {

        Patient__c patient = new Patient__c(Name = 'Test Patient');
        insert patient;
        
        Diagnosis__c diagnosis = new Diagnosis__c(
            Name = 'Test Diagnosis',
            Patient__c = patient.Id
        );

        Test.startTest();

        insert diagnosis;

        Patient__c updatedPatient = [SELECT Id, Risk_Score__c, Risk_Level__c FROM Patient__c WHERE Id = :patient.Id];
        
        System.assertNotEquals(null, updatedPatient.Risk_Score__c, 'Risk Score should not be null');
        System.assertNotEquals(null, updatedPatient.Risk_Level__c, 'Risk Level should not be null');

        Test.stopTest();
    }

    @isTest
    public static void testUpdateRiskScoreTrigger_onUpdate() {
        Patient__c patient = new Patient__c(Name = 'Test Patient');
        insert patient;

        Diagnosis__c diagnosis = new Diagnosis__c(
            Name = 'Test Diagnosis',
            Patient__c = patient.Id
        );
        insert diagnosis;

        diagnosis.Name = 'Updated Diagnosis';
        update diagnosis;

        Patient__c updatedPatient = [SELECT Id, Risk_Score__c, Risk_Level__c FROM Patient__c WHERE Id = :patient.Id];
        
        System.assertNotEquals(null, updatedPatient.Risk_Score__c);
        System.assertNotEquals(null, updatedPatient.Risk_Level__c);
    }
}
