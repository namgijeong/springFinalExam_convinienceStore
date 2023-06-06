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
    <title>편의점-메인페이지</title>
    <link href="${path}/resources/css/mypage/mypage_update.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/css/header/main_header.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
    <!-- <div id="header">
    </div> -->
     <!-- 그냥 세션값도 이렇게 넘겨주어야 적용이 된다. -->	
    <jsp:include page="${path}/WEB-INF/jsp/header/main_header.jsp" >
    	 <jsp:param name="isLogin" value="${session.isLogin}" />
    	 <jsp:param name="memberType" value="${session.memberType}" />
    </jsp:include>
    <div id="body">
        <div id="login_box">
            <div id="login_title">내 계정정보 바꾸기</div>
            <div id="login_content">
                <div>
                    <span class="login_subtitle">아이디</span><input value="${currentMember.memberId}" class="login_input" type="text" placeholder="아이디"/>
                    <div>아이디가 중복됩니다.</div>
                </div>
                <div>
                    <span class="login_subtitle">비밀번호</span><input class="login_input" type="password" placeholder="비밀번호"/>
                </div>
                <button id="gologin" type="button" >수정완료</button>
            </div>
        </div>
    </div>
</body>
</html>
<script>

	//jquery 라이브러리를 사용하여 load()메서드를 호출
	//load()메서드는 ajax를 사용하여 지정된 파일을 비동기적으로 로드하고, 지정된 요소에 내용을 삽입
	/*$("#header").load("main_header.html");*/
	
	
	//window.onload는 DOM뿐만 아니라 리소스 호출도 완료되었을 때 실행
	//$(window).onload()는 jquery에서 틀린문법인지 인식안됨
	$(window).on("load",function(){
		// 실행할 내용
		let header_section1 = document.querySelector("#header_section1");
		let header_section2=document.querySelector("#header_section2");
		//viewport 즉 현재 보이는 화면을 기준으로 하는 좌표값을 반환.
		//이섹션의 맨아래 bottom이 넘어서는 길이의 조건
		let section1length = header_section1.getBoundingClientRect().bottom;
		window.addEventListener("scroll", () => {
		    //y축 방향으로 직접 스크롤한 거리
		    let windowlength = document.documentElement.scrollTop;
		    //console.log(windowlength);
		     //console.log("넘어서야할길이"+section1length);
		    //스크롤한 길이가 화면에서 보이는것보다 넘어서면
		    //class를 더해 css 속성을 더해라
		    if (section1length < windowlength) {
		        header_section2.classList.add("fixed_header_section2");
		   
		    } else {
		        header_section2.classList.remove("fixed_header_section2");
		    
		    }
		});
	});
</script>
<script src="${path}/resources/javascript/idDoubleCheckAjax.js"></script>
<script>
	let inputId;
    $(window).on("load",function(){
       
        $(".login_input:eq(0)").on('change',function(e){
        	inputId=$(this).val();
        	idDoubleCheckAjax.idDoubleCheck(inputId,currentCheck,error)
        });
        
        let currentCheck=function(datas){
        	console.log(datas);
        	/*원래 자기아이디는 기존에 자기가 쓰던거라서 db에서 중복됬다고 나오는데 그대로 써도 괜찮다.*/
        	if(datas==1 && inputId !="${currentMember.memberId}"){
        	
        		$("#login_content>div>div").css('visibility','visible');
        		/*이상하게 클래스로 같은 css 속성을 접근해서 변경하는건 충돌이 일어나는지 안된다.->직접접근 필요*/
        		 /* $("#login_content>div>div").addClass('show_warning_id'); */
        		 
        		/*버튼 기능 비활성화.*/
        		$("#gologin").attr("disabled", true);
        	}
        	else{
        		$("#login_content>div>div").css('visibility','hidden');
        		/*이상하게 클래스로 같은 css 속성을 접근해서 변경하는건 충돌이 일어나는지 안된다.->직접접근 필요*/
        		/* $("#login_content>div>div").removeClass('show_warning_id');  */
        		
        		/*버튼 기능 활성화.*/
        		$("#gologin").attr("disabled", false);
        	}
        };
        let error=function(datas){
        	console.log(datas);
        }
       	
        $("#gologin").on('click',function(e){
        	let memberId=$(".login_input:eq(0)").val();
        	let password=$(".login_input:eq(1)").val();
        	location.href="/mypage_updateOk?memberId="+memberId+"&password="+password;
        });
    });
</script>
            