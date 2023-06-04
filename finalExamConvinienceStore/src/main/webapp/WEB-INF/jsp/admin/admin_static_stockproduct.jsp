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
    <link href="${path}/resources/css/admin/admin_static_stockproduct.css" rel="stylesheet"/>
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
                    <h2>제품입고</h2>
                    <span>제품을 고르고 수량을 입력해주세요</span>
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

                <div id="select_count">

                    <select id="stock_list">
                        <option value="1001">오뚜기)진라면매운컵</option>
                        <option value="1002">농심)신라면큰사발컵</option>
                        <option value="1003">오뚜기)열라면컵</option>
                        <option value="1004">삼양)삼양라면소컵</option>
                        <option value="1005">농심)라면왕김통깨</option>
                        <option value="1006">농심)무파마큰사발컵</option>
                        <option value="1007">오뚜기)열려라참깨라면컵</option>
                        <option value="1008">팔도)틈새라면매운김치컵</option>
                        <option value="2001">도)백종원백반한판</option>
                        <option value="2002">도)동원리챔앤참치김치</option>
                        <option value="2003">주)3XL크랩참치마요삼각</option>
                        <option value="2004">도)백종원우삼겹비빔밥</option>
                        <option value="2005">도)고깃집맛소금구이정식</option>
                        <option value="2006">도)백종원바싹불고기한판</option>
                        <option value="2007">김)백종원비빔밥한줄</option>
                        <option value="2008">김)자이언트삼색유부초밥</option>
                        <option value="3001">롯데)치토스바베큐맛164g</option>
                        <option value="3002">롯데)도리토스나쵸치즈</option>
                        <option value="3003">롯데)초코파이</option>
                        <option value="3004">오리온)포카칩어니언66g</option>
                        <option value="3005">농심)포스틱84g</option>
                        <option value="3006">롯데)꼬깔콘고소한맛134g</option>
                        <option value="3007">농심)바나나킥딸기60g</option>
                        <option value="3008">롯데)빼빼로녹차</option>
                        <option value="4001">코카)스프라이트P500ml</option>
                        <option value="4002">코카)파워에이드캔240ml</option>
                        <option value="4003">코카)코카제로레몬캔355ml</option>
                        <option value="4004">롯데)펩시콜라제로캔355ml</option>
                        <option value="4005">코카)조지아카페라떼캔</option>
                        <option value="4006">농심)웰치제로포도P500</option>
                        <option value="4007">동아)데미소다피치캔250ml</option>
                        <option value="4008">HK)티로그복숭아홍차P500</option>
                        <option value="5001">하겐)블루베리타르트미니</option>
                        <option value="5002">해태)부라보콘바닐라</option>
                        <option value="5003">빙그레)메로나</option>
                        <option value="5004">롯데푸드)빠삐코</option>
                        <option value="5005">초코)초코비파인트</option>
                        <option value="5006">하겐)초코마카롱파인트</option>
                        <option value="5007">롯데)수박바</option>
                        <option value="5008">롯데)찰떡아이스</option>
                    </select>
                    
                    <div>상품수량</div>
                    <div><img src="${path}/resources/images/btn_count_down.png"/><input id="count" type="text" value="1"/><img src="${path}/resources/images/btn_count_up.png"/></div>
                    <div id="input_product"><button>입고완료</button></div>
                </div>

                
                

            </div>
            
           
            
            
            
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
    
<script>
let stockChoose;
let stockCount;
    $(window).on("load",function(){
            //10진법 숫자로
            let count=parseInt($("#count").attr('value'),10);
            //버튼 하나도 안건드렸을때 초기값
            stockChoose= $("#stock_list option:selected").val();
            stockCount=$("#count").attr('value');
            $("#select_count>div:nth-child(3)>img:nth-child(1)").on('click',function(e){
                //무조건 최소 숫자가 1이 나오게
                if(count>=2){
                    count=count-1;
                    $("#count").attr('value',count);
                    
                    //눌러서 바뀔때마다 재고 값도 바꿔져야하므로
                    stockChoose= $("#stock_list option:selected").val();
                    stockCount=$("#count").attr('value');
                }
               
            });

            $("#select_count>div:nth-child(3)>img:nth-child(3)").on('click',function(e){
                count=count+1;
                $("#count").attr('value',count);
                
              	//눌러서 바뀔때마다 재고 값도 바꿔져야하므로
                stockChoose= $("#stock_list option:selected").val();
                stockCount=$("#count").attr('value');
            });
            
          
            $("#input_product>button").on('click',function(e){
            	/*변수를 인식해야하므로 ""안에 다 넣지 말자*/
            	location.href="/admin_stockproductOk?inventoryCode="+stockChoose+"&count="+stockCount;
            	
            });

        });
</script>

</html>