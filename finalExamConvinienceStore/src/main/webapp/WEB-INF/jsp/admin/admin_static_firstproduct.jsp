<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지-매출통계</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <link href="${path}/resources/css/admin/admin_static_firstproduct.css" rel="stylesheet"/>
    <style>
        
    </style>
</head>
<body>
    <div id="logobox"><div id="logo"><a href="#"></a></div></div>
    
    <div id="main_body">
        <div id="subnavigation">
            <ul>
                <li class="menu"> 
                    <a><span>하루</span><span class="rightarrow"></span></a>
                    <ul class="hide">
                        <li class="normalcolor"><a href="${path}/admin_dailycount">판매량</a></li>
                        <li class="normalcolor"><a href="${path}/admin_dailycost">매출액</a></li>
                    </ul>
                </li>
                
                <%-- <li class="menu"> 
                    <a><span>한달</span><span class="rightarrow"></span></a>
                    <ul class="hide">
                        <li class="normalcolor"><a href="${path}/admin_monthlycount">판매량</a></li>
                        <li class="normalcolor"><a href="${path}/admin_monthlycost">매출액</a></li>
                        
                    </ul>
                </li> --%>
                
                <li class="menu"> 
                    <a href="${path}/admin_firstproduct"><span>최다 판매제품</span><span class="rightarrow"></span></a>
                    <ul class="hide">
                        
                        
                    </ul>
                </li>
                
                <li class="menu"> 
                    <a href="${path}/admin_stockproduct"><span>제품 입고</span><span class="rightarrow"></span></a>
                    <ul class="hide">
                        
                        
                    </ul>
                </li>
                
            </ul>
        </div>
        <div id="subnavigation_result">
            <div id="subnavigation_result_header">
                <div id="subnavigation_result_title">
                    <h2>최다판매제품</h2>
                    <span>undefined는 상품을 구매하지 않아 해당 순위가 없는것이다.</span>
                </div>
                <!-- <div id="subnavigation_how_array">
                    <div class="subnavigation_how">
                        <div class="subnavigation_how_title">카테고리</div>
                        <div class="subnavigation_how_main">
                            <select class="selectnormalcolor">
                                <option>생활</option>
                                <option>업무 및 회사생활</option>
                                <option>채용</option>
                                <option>자기계발</option>
                                <option>제테크</option>
                                <option>창업</option>
                                <option>기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="subnavigation_how">
                        <div class="subnavigation_how_title">정렬방식</div>
                        <div class="subnavigation_how_main">
                            <select class="selectnormalcolor">
                                <option>작성일 오름차순</option>
                                <option>작성일 내림차순</option>
                                <option>공지사항번호 오름차순</option>
                                <option>공지사항번호 내림차순</option>
                            </select>
                        </div>
                    </div>
                    <div id="inquire"><button>조회</button></div>
                </div>
 -->
            </div>

            <div id="subnavigation_result_body">

                
                <!-- <div id="subnavigation_search_and_delete">
                    <div id="subnavigation_search">
                        <span id="glass"></span>
                        <input id="keyword" type="text" name="search_member" placeholder="검색"/>
                    </div>
                    
                </div> -->

                <!--차트가 그려질 부분-->
	            <canvas id="myChart"></canvas>

                
                

            </div>
            
           
            <!-- <div id="page_action">
              
                <div id="page_arrow">
                    <span></span>
                    <span></span>
                </div>
            
            
            </div>   -->
            
            
        </div>
    </div>
</body>
<script>
    let flag=0;
    let prev;
    let flag2=0;
    let prev2;
// html dom 이 다 로딩된 후 실행된다
$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
        var submenu = $(this).next("ul");
        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기            
        if( submenu.is(":visible") ){
            submenu.slideUp();
            $(this).css('backgroundColor','#293a50');
        }else{
            //클릭하고나서 화면상에 안보일시 무조건 펼친다.
            submenu.slideDown();
          
            $(this).css('backgroundColor','#3a495e');
        }

        var arrow=$(this).children().eq(1);
        if(arrow.hasClass('rightarrow')){
            arrow.removeClass('rightarrow');
            arrow.addClass('downarrow');
        }
        else if(arrow.hasClass('downarrow')){
            arrow.removeClass('downarrow');
            arrow.addClass('rightarrow');
        }
        
    });
    
  
    
   $(".hide>li").click(function(){
    if($(this).hasClass('normalcolor')){
            $(this).removeClass('normalcolor');
            $(this).addClass('clickcolor');
            console.log($(this).hasClass('clickcolor'));
            if(flag!=0){
                $(prev).removeClass('clickcolor');
                $(prev).addClass('normalcolor');
            }
            

            prev=$(this);
            flag++;
            console.log("변경됨");
        }
        else if($(this).hasClass('clickcolor')){
            $(this).removeClass('clickcolor');
            $(this).addClass('normalcolor');
            prev=$(this);
            console.log($(this).attr('backgroundColor'));
        }
   });

   $(".subnavigation_how_main>select").click(function(){
    if($(this).hasClass('selectnormalcolor')){
            $(this).removeClass('selectnormalcolor');
            $(this).addClass('selectclickcolor');
            console.log($(this).hasClass('selectclickcolor'));
            if(flag2!=0){
                $(prev2).removeClass('selectclickcolor');
                $(prev2).addClass('selectnormalcolor');
            }
            

            prev2=$(this);
            flag2++;
            console.log("변경됨");
        }
        else if($(this).hasClass('selectclickcolor')){
            $(this).removeClass('selectclickcolor');
            $(this).addClass('selectnormalcolor');
            prev2=$(this);
            console.log($(this).attr('backgroundColor'));
        }
   });
    
});
</script>
    
<!-- 외부 자바스크립트 포함할때  하나 열고닫는 거 각각 써주지 않고 하나로 합치면 인식을 잘 못한다... -->
<script src="${path}/resources/javascript/staticQueryAjax.js" ></script>    
<script>
	let firstProduct;
	let firstProductName;
	let secondProduct;
	let secondProductName;
	let thirdProduct;
	let thirdProductName;
	function classify (datas){
		if(datas[0]!=null){
			firstProduct=datas[0].count;
			firstProductName=datas[0].productCategory;
		}
		if(datas[1]!=null){
			secondProduct=datas[1].count;
			secondProductName=datas[1].productCategory;
		}
		if(datas[2]!=null){
			thirdProduct=datas[2].count;
			thirdProductName=datas[2].productCategory;
		}
		/*이 라이브러리 데이터에 변수를 넣고 싶으면 이렇게 해야한다*/
		
		myChart.data.datasets[0].data[0]=firstProduct;
		myChart.data.datasets[0].data[1]=secondProduct;
		myChart.data.datasets[0].data[2]=thirdProduct;
		
		myChart.data.labels[0]=firstProductName;
		myChart.data.labels[1]=secondProductName;
		myChart.data.labels[2]=thirdProductName;
	
		myChart.update();
	
	}
	

	
	function error(error){
		console.log(error);
	}
	
	staticAjax.firstProduct(classify,error);
	
	/* $(document).ready(function(){
		
		$("#glass").click(function(e){
			console.log("돋보기버튼누름");
			 이상하게 이건 인식이 안됨. 
			let searchDay=$("#keyword").attr('value'); 
			let searchDay=$("#keyword").val();
			
			console.log($("#keyword").val());
			
			
			
		});
	});
	*/
		 var context = document
	        .getElementById('myChart')
	        .getContext('2d');
	    var myChart = new Chart(context, {
	        type: 'bar', // 차트의 형태
	        data: { // 차트에 들어갈 데이터
	            labels: [
	                //x 축
	                '라면','밥','과자'
	            ],
	            datasets: [
	                { //데이터
	                    label: '가장 많이 팔린 최다품목 상위 3개', //차트 제목
	                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                    data: [
	                        //여기에 데이터들을 넣어주자
	                        firstProduct,secondProduct,thirdProduct//x축 label에 대응되는 데이터 값
	                    ],
	                    backgroundColor: [
	                        //색상
	                        'rgba(255, 99, 132, 0.2)',
	                        'rgba(54, 162, 235, 0.2)',
	                        'rgba(255, 206, 86, 0.2)',
	                        'rgba(75, 192, 192, 0.2)',
	                        'rgba(153, 102, 255, 0.2)',
	                        'rgba(255, 159, 64, 0.2)'
	                    ],
	                    borderColor: [
	                        //경계선 색상
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)'
	                    ],
	                    borderWidth: 1 //경계선 굵기
	                }/* ,
	                {
	                    label: 'test2',
	                    fill: false,
	                    data: [
	                        8, 34, 12, 24
	                    ],
	                    backgroundColor: 'rgb(157, 109, 12)',
	                    borderColor: 'rgb(157, 109, 12)'
	                } */
	            ]
	        },
	        options: {
	            scales: {
	                yAxes: [
	                    {
	                        ticks: {
	                            beginAtZero: true
	                        }
	                    }
	                ]
	            }
	        }
	    });	
	
		
    
</script>

</html>