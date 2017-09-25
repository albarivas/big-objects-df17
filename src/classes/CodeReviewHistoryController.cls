public with sharing class CodeReviewHistoryController {

	@AuraEnabled
	public static List<CodeReviewHistory__b> getCodeReviewsHistory() {
		return [SELECT CanBeMerged__c, CodeReviewDate__c, Comments__c, Employee__r.Name, 
		EstimatedHours__c, RealHours__c, Score__c, Story__c FROM CodeReviewHistory__b];
	}

	@AuraEnabled
	public static void addCodeReviewHistory(CodeReviewHistory__b codeReviewHistory) {
		Database.insertImmediate(new List<sObject>{codeReviewHistory});
	}
}