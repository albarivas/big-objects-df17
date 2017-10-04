public with sharing class CodeReviewHistoryController {

	@AuraEnabled
	public static List<CodeReviewHistory__b> getCodeReviewsHistory() {
		return [SELECT Story__r.Name, Story__r.StoryName__c,Employee__r.Name, Employee__r.EmployeeName__c, 
                		 Employee__r.EmployeeSurname__c, CodeReviewDate__c, Comments__c, Score__c
                				 FROM CodeReviewHistory__b
                			 ORDER BY 
                	 Employee__c DESC,
                		Story__c DESC,
              CodeReviewDate__c DESC];
	}

	@AuraEnabled
	public static void addCodeReviewHistory(String newCodeReviewSerialized) {
        
        CodeReviewHistory newCodeReview = (CodeReviewHistory)JSON.deserialize(newCodeReviewSerialized, CodeReviewHistory.class);
        
        List<Story__c> stories = [SELECT Id FROM Story__c WHERE Name LIKE :newCodeReview.Story];
        List<Employee__c> employees = [SELECT Id FROM Employee__c WHERE Name LIKE :newCodeReview.Employee];
        
        if (stories.isEmpty() || employees.isEmpty())
            throw new AuraHandledException('No valid story or employee');
        
        CodeReviewHistory__b cr = new CodeReviewHistory__b();
        cr.Story__c = stories[0].Id;
        cr.Comments__c = newCodeReview.Comments;
		cr.Employee__c = employees[0].Id;
        cr.Score__c = newCodeReview.Score;
        cr.CodeReviewDate__c = System.today();
		Database.SaveResult sr = Database.insertImmediate(cr);
        
        if (!sr.isSuccess())
            throw new AuraHandledException('Error while inserting: ' + sr.getErrors());

	}
    
    public class CodeReviewHistory {
        public String Story {get; set;}
		public String Comments {get; set;} 
		public String Employee {get; set;}
        public Integer Score {get; set;}
    }
}