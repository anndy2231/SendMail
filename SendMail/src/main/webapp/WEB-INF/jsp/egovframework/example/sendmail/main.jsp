<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../sendmail/layout/header.jsp"%>

<title>Main</title>

<script type="text/javaScript" language="javascript" defer="defer">
	function out() {
		location.href = "<c:url value='/logout.do'/>";
	}
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1>메인화면</h1>
	</div>
	
	<div> 콘텐츠 </div>

	<div>
		<button class="btn btn-primary btn-user btn-block"
			style="width: 100px" onclick="location.href='/SendMail/register.do'">회원가입</button>
		<button class="btn btn-primary btn-user btn-block"
			style="width: 100px" onclick="location.href='/SendMail/main.do'">메인으로</button>
	</div>

</div>
<!-- /.container-fluid -->


<%@ include file="../sendmail/layout/footer.jsp"%>
