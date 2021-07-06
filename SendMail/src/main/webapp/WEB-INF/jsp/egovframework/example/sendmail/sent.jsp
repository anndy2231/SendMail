<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../sendmail/layout/header.jsp"%>

<title>Sent Mail Box</title>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">보낸메일함</h1>
	<p class="mb-4"></p>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">메일 리스트</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>받는 사람</th>
							<th>보낸 사람</th>
							<th>보낸 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><c:out value="${result.idx}" /></td>
								<td><c:out value="${result.title}" /></td>
								<td><c:out value="${result.contents}" /></td>
								<td><c:out value="${result.sender}" /></td>
								<td><c:out value="${result.receiver}" /></td>
								<td><fmt:formatDate value="${result.indate}"
										pattern="yyyy-MM-dd hh:mm:ss" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../sendmail/layout/footer.jsp"%>