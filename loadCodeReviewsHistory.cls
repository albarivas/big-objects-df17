List<Story__c> stories = [SELECT Id FROM Story__c];
List<Employee__c> employees = [SELECT Id FROM Employee__c];
List<CodeReviewHistory__b> crs = new List<CodeReviewHistory__b>();

for (Employee__c employee : employees) {
    for (Story__c story : stories) {
        Integer rand1 = Math.round(Math.random()*10);
        CodeReviewHistory__b cr = new CodeReviewHistory__b();
        cr.Story__c = story.Id;
        cr.Employee__c = employee.Id;
        cr.Comments__c = 'Wow, your code rocks!';
        cr.CanBeMerged__c = 'True';
        cr.Score__c = rand1;
        cr.CodeReviewDate__c = System.now();
        crs.add(cr);
    }
}

Database.insertImmediate(crs);