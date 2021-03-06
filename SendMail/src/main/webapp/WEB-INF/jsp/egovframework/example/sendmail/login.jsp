<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Send Mail</title>

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.css" rel="stylesheet">
	<script type="text/javaScript" language="javascript" defer="defer">

			 function check(){
			        if( $("#user_id").val() ==""){
			        alert("아이디를 입력하세요");
			        return false;
			        }
			        if( $("#password").val() ==""){
			        alert("비밀번호를 입력하세요");
			        return false;
			        }
			        return true;
			        }
	</script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 style="font-size:30px" class="h4 text-gray-900 mb-4">SendMail Login</h1>
                                    </div>
                                    
                                    <c:if test = "${sessionScope.userId == null || sessionScope.userId == '' }"> 
                                    <form id="form" name="form" method="post" action="/SendMail/loginAction.do">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 " style="width:328px">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" style="width:328px">
                                        </div>

                                        <button type="submit" class="btn btn-primary btn-user btn-block" onclick="return check();">
                                           		로그인
                                        </button>
                                    </form>
                                    </c:if>
                                    <br>
                                   <!-- <button class="btn btn-primary btn-user btn-block" onclick="location.href='/SendMail/main.do'">메인으로</button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath()%>/resources/js/sb-admin-2.js"></script>

</body>

</html>