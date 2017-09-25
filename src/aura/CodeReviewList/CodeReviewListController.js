({
	handleGetCodeReviewsEvent : function(component, event, helper) {
       
        // Call the server controller
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
	}
})