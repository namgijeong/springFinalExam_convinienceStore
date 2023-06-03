<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 세부내역</title>
    <link href="${path}/resources/css/header/main_header.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/css/buy/product_detail.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
    <!-- <div id="header"></div> -->
  	<!-- 그냥 세션값도 이렇게 넘겨주어야 적용이 된다. -->	
    <jsp:include page="${path}/WEB-INF/jsp/header/main_header.jsp" >
    	 <jsp:param name="isLogin" value="${session.isLogin}" />
    	 <jsp:param name="memberType" value="${session.memberType}" />
    </jsp:include>
    <div id="body">
        <div id="image_box"><img src="${path}${Product.imageUrl}"/></div>
        <div id="product_content">
            <div id="product_title">${Product.inventoryName}</div>
            <table>
                <tbody id="product_detail">
                    <tr id="show_cost">
                        <td>판매가</td>
                        <td>${Product.price}</td>
                    </tr>
                    <tr id="select_count">
                        <td>상품수량</td>
                        <td><img src="${path}/resources/images/btn_count_down.png"/><input id="count" type="text" value="1"/><img src="${path}/resources/images/btn_count_up.png"/></td>
                    </tr>
                </tbody>
            </table>
            <div id="total">
                <span>총 상품금액</span>
                <span>1</span>
            </div>
            <div id="purchase">
                <button>바로구매</button>
            </div>
        </div>
    </div>
</body>
</html>

<script>
     //jquery 라이브러리를 사용하여 load()메서드를 호출
    //load()메서드는 ajax를 사용하여 지정된 파일을 비동기적으로 로드하고, 지정된 요소에 내용을 삽입
   /*  $("#header").load("main_header.html"); */
     
    //window.onload는 DOM뿐만 아니라 리소스 호출도 완료되었을 때 실행
        //$(window).onload()는 jquery에서 틀린문법인지 인식안됨
        
         var msg = "<c:out value='${msg}'/>";
         if(msg!==''){
        	 alert(msg);
         }
    	
        let sendCount;
        $(window).on("load",function(){
            //10진법 숫자로
            let count=parseInt($("#count").attr('value'),10);
            let cost=parseInt($("#show_cost>td:nth-child(2)").text());
            //버튼 하나도 안건드렸을때 초기값 가져옴
            sendCount=count;
            $("#select_count>td:nth-child(2)>img:nth-child(1)").on('click',function(e){
                //무조건 최소 숫자가 1이 나오게
                if(count>=2){
                    count=count-1;
                    $("#count").attr('value',count);
                    $("#total>span:nth-child(2)").text(count*cost);
                    //실시간으로 바뀌는 count를 보내기 위해서
                    sendCount=count;
                }
               
            });

            $("#select_count>td:nth-child(2)>img:nth-child(3)").on('click',function(e){
                count=count+1;
                $("#count").attr('value',count);
                $("#total>span:nth-child(2)").text(count*cost);
                //실시간으로 바뀌는 count를 보내기 위해서
                sendCount=count;
                
            });
            
            let inventoryCode="${Product.inventoryCode}";
			
            $("#purchase>button").on('click',function(e){
            	location.href="/buyOk?inventoryCode="+inventoryCode+"&count="+sendCount;
            });
        });
</script>