let staticAjax=(function(){
	function oneDaySaleCount(searchDay, callback,error){
        console.log("ajax에서 url넘기기전 들어옴"+searchDay);
        $.ajax({
            url: "/admin_dailycount_search/" + searchDay ,
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
    
    function oneDaySaleCost(searchDay, callback,error){
        console.log("ajax에서 url넘기기전 들어옴"+searchDay);
        $.ajax({
            url: "/admin_dailycost_search/" + searchDay ,
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
    
    function firstProduct( callback,error){
        console.log("ajax에서 url넘기기전 들어옴");
        $.ajax({
            url: "/admin_firstproduct_search" ,
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
    
	return {oneDaySaleCount:oneDaySaleCount,oneDaySaleCost:oneDaySaleCost,firstProduct:firstProduct}
})();