trigger UpdateVisitRiskScore on Visit__c (after Insert, after Update) {
{

if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) 

{UpdateVisitRiskScoreHandler.updateVisitRiskScore(Trigger.new);}
}
}