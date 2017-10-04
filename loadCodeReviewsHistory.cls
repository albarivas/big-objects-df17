List<Employee__c> employees = new List<Employee__c>();
List<Story__c> stories = new List<Story__c>();

Employee__c employee = new Employee__c();
employee.EmployeeName__c = 'Ana';
employee.EmployeeSurname__c = 'Rivas';
employee.JobPosition__c = 'Developer';
employees.add(employee);

employee = new Employee__c();
employee.EmployeeName__c = 'Francisco';
employee.EmployeeSurname__c = 'Santos';
employee.JobPosition__c = 'Developer';
employees.add(employee);

employee = new Employee__c();
employee.EmployeeName__c = 'Pablo';
employee.EmployeeSurname__c = 'Mendez';
employee.JobPosition__c = 'Developer';
employees.add(employee);

employee = new Employee__c();
employee.EmployeeName__c = 'Markel';
employee.EmployeeSurname__c = 'Garcia';
employee.JobPosition__c = 'Developer';
employees.add(employee);

employee = new Employee__c();
employee.EmployeeName__c = 'Estibaliz';
employee.EmployeeSurname__c = 'Solano';
employee.JobPosition__c = 'Developer';
employees.add(employee);

employee = new Employee__c();
employee.EmployeeName__c = 'Alba';
employee.EmployeeSurname__c = 'Azcona';
employee.JobPosition__c = 'Developer';
employees.add(employee);

employee = new Employee__c();
employee.EmployeeName__c = 'Agustina';
employee.EmployeeSurname__c = 'Garcia';
employee.JobPosition__c = 'Developer';
employees.add(employee);

Story__c story = new Story__c();
story.StoryName__c = 'Create big object for Dreamforce 17 demo';
story.Description__c = 'Blah, blah, blah ... ';
story.Status__c = 'Completed';
stories.add(story);

story = new Story__c();
story.StoryName__c = 'Populate our super big object';
story.Description__c = 'Blah, blah, blah ... ';
story.Status__c = 'Completed';
stories.add(story);

story = new Story__c();
story.StoryName__c = 'Create Lightning Component to show how to query and populate Big Objects';
story.Description__c = 'Blah, blah, blah ... ';
story.Status__c = 'Completed';
stories.add(story);

story = new Story__c();
story.StoryName__c = 'From custom to big with Async SOQL';
story.Description__c = 'Blah, blah, blah ... ';
story.Status__c = 'Completed';
stories.add(story);

story = new Story__c();
story.StoryName__c = 'From big to custom with Async SOQL';
story.Description__c = 'Blah, blah, blah ... ';
story.Status__c = 'Completed';
stories.add(story);

story = new Story__c();
story.StoryName__c = 'Create dashboard for predictive analysis';
story.Description__c = 'Blah, blah, blah ... ';
story.Status__c = 'Completed';
stories.add(story);

insert employees;
insert stories;

// Execute in different transaction
List<Employee__c> employees = [SELECT Id FROM Employee__c];
List<Story__c> stories = [SELECT Id FROM Story__c];
List<CodeReviewHistory__b> crs = new List<CodeReviewHistory__b>();

for (Employee__c employee : employees) {
    for (Story__c story : stories) {
        Integer rand1 = Math.round(Math.random()*9);
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

List<Database.SaveResult> srs = Database.insertImmediate(crs);

for (Database.SaveResult sr : srs) {
	if (!sr.isSuccess())
		System.assert(false, 'Error:' + sr.getErrors());
}
