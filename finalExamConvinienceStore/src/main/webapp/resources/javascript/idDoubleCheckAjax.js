let idDoubleCheckAjax=(function(){
	function idDoubleCheck(inputId, callback,error){
        console.log("ajax에서 url넘기기전 들어옴"+inputId);
        $.ajax({
            url: "/idDoubleCheck/" + inputId ,
            success: function(comments){
                if (callback){
                    callback(comments);
                }
            },
            error: function(a, b, c){
                if(error){
                    error(a, b, c);
                }
            }


        });
    }
    
    
    
    
	return {idDoubleCheck:idDoubleCheck}
})();