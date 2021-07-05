<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Write</title>

    <!-- Custom fonts for this template-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sb-admin-2.css">
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/sb-admin-2.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
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

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.do">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Send Mail</div>
            </a>

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>


            <li class="nav-item">
                <a class="nav-link" href="write.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>메일쓰기</span></a>
            </li>


              <li class="nav-item">
                <a class="nav-link" href="sent.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>보낸메일함</span></a>
            </li>


              <li class="nav-item">
                <a class="nav-link" href="received.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>받은메일함</span></a>
         	   </li>


            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="trashCan.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>휴지통</span>
                </a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>



                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">999</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">999</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">김남덕</span>
                                <img src="<%=request.getContextPath()%>/resources/img/undraw_profile.svg">
                                
                            </a>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

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

                
            </div>
            <!-- End of Main Content -->


            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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
    <script src="<%=request.getContextPath()%>/resources/js/sb-admin-2.min.js"></script>


</body>

</html>