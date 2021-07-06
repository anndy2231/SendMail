<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../sendmail/layout/header.jsp"%>

 <script type="text/javaScript" language="javascript" defer="defer">
	    function add(){
		   	if( $("#title").val()==''){
	    		alert("제목을 입력해주세요.");
            	$("#title").focus();
            	return;
	    	}
		   	if( $("#contents").val()==''){
	    		alert("내용을 입력해주세요.");
            	$("#contents").focus();
            	return;
	    	}
		   	if( $("#receiver").val()==''){
	    		alert("받는 사람을 입력해주세요.");
            	$("#receiver").focus();
            	return;
	    	}
		   	if( $("sender").val()==''){
	    		alert("보내는 사람을 입력해주세요.");
            	$("#sender").focus();
            	return;
	    	}
		   	if( $("#password").val()==''){
	    		alert("비밀번호를 입력해주세요.");
            	$("#password").focus();
            	return;
	    	}
        	if (!confirm("이메일을 보내시겠습니까?")){
            	return;
            	}
 	    	document.boardRegForm.action = "<c:url value='write_action.do'/>";
	    	document.boardRegForm.submit();
	    	}
	</script>

    <title>Write</title>
    
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <form class="form-horizontal" id="boardRegForm" name="boardRegForm" method="post" action="">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4" >
                        <h1 class="h3 mb-0 text-gray-800">메일쓰기</h1>
                    </div>
    				<div >
						받는 사람 <input type="text" class="form-control" id="receiver" name="receiver" placeholder="받는 사람">
					</div>
					<br>
					<div>
						보내는 사람 <input type="text" class="form-control" id="sender" name="sender" placeholder="보내는 사람">
					</div>
					<br>
					<div>
						구글 계정 비밀번호 <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
					</div>
					<br>
					<div>
						메일 제목 <input type="text" class="form-control" id="title" name="title" placeholder="제목">
					</div>
					<br>
					<div>
						메일 내용 <br>
					<textarea cols="30" rows="10" class="form-control" id="contents" name="contents" placeholder="내용"></textarea>					
   					</div>
					<!-- <input type="submit" id="" value="전송"></input> -->
					<br>
					<button class="btn btn-primary btn-user btn-block" type="button" id="" onclick="add();">보내기</button>
					</form>
					<br>
					<button class="btn btn-primary btn-user btn-block" onclick="location.href='/SendMail/main.do'">메인으로</button>
                </div>


<%@ include file="../sendmail/layout/footer.jsp"%>