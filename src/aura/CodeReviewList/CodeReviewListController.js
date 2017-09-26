({
	loadCodeReviews : function(component, event, helper) {
       
        var getCodeReviewsHistory = component.get("c.getCodeReviewsHistory");

        getCodeReviewsHistory.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var codeReviews = response.getReturnValue();
                component.set("v.codeReviews", codeReviews);
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });
        
        $A.enqueueAction(getCodeReviewsHistory);
	},
    
    addCodeReview : function(component, event, helper) {
    	var newCodeReview = component.get("v.newCodeReview");
    
    	var addCodeReviewHistory = component.get("c.addCodeReviewHistory");
    
	    addCodeReviewHistory.setParams({"newCodeReviewSerialized": JSON.stringify(newCodeReview)});

        addCodeReviewHistory.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
 				$A.get("e.force:refreshView").fire();
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });
        
        $A.enqueueAction(addCodeReviewHistory);
	}
})