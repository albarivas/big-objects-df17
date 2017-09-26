public with sharing class CodeReviewHistoryController {
	public CodeReviewHistoryController() {
		
	}

	@AuraEnabled
	public static List<CodeReviewHistory2__b> getCodeReviewsHistory() {
		return [SELECT CanBeMerged__c, CodeReviewDate__c, Comments__c, Employee__r.Name, 
		EstimatedHours__c, RealHours__c, Score__c, Story__c FROM CodeReviewHistory2__b];
	}

	@AuraEnabled
	public static void addCodeReviewHistory(CodeReviewHistory2__b codeReviewHistory) {
		Database.insertImmediate(codeReviewHistory);
	}
}