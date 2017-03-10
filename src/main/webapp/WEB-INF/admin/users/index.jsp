<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String baseUrl = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GCY管理系统</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<c:import url="../shared/_stylesheet.jsp"></c:import>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div id="user-id" data-user-id="${userId}"
		class="hidden"></div>
	<div class="wrapper">
		<jsp:include page="../shared/_header.jsp"></jsp:include>
		<jsp:include page="../shared/_aside.jsp"></jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>用户管理</h1>
				<ol class="breadcrumb">
					<li><a href="<%=baseUrl%>/admin/dashborad"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active"><a href="<%=baseUrl%>/admin/users">团队列表</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Your Page Content Here -->
				<div class="box">
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<form action="${pageContext.request.contextPath}/admin/users"
									method="get" class="form-horizontal" id="form">

									<a href="<%=baseUrl%>/admin/users" class="btn btn-info btn-lg">
										<span class="glyphicon glyphicon-search" aria-hidden="true"></span>所有用户
									</a>
									<c:forEach var="role" items="${roles}">
										<a href="<%=baseUrl%>/admin/users?role_id=${role.id}"
											class="btn btn-info btn-lg"> <span
											class="glyphicon glyphicon-search" aria-hidden="true"></span>${role.roles}
										</a>
									</c:forEach>

									<a href="<%=baseUrl%>/admin/users/new"
										class="btn btn-info btn-lg"> <span class="glyphicon"
										aria-hidden="true"></span>新增用户
									</a>
								</form>



							</div>
							<div class="col-md-12">
								<table class="table table-striped table-hover">
									<tr>
										<td>id</td>
										<td>用户名</td>
										<td>角色</td>
										<td>操作</td>
									</tr>
									<c:forEach var="user" items="${pages.list}">
										<tr>
											<td>${user.id}</td>
											<td>${user.name}</td>
											<td>${user.roleId}</td>
											<td><a class="btn btn-default"
												href="${pageContext.request.contextPath}/admin/users/${user.id}/edit">编辑</a>
												<a class="btn btn-danger deletebutton"
												href="${pageContext.request.contextPath}/admin/users/${user.id}/delete">删除</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>

							<div class="row">
								<div class="col-xs-6 col-xs-offset-5">
									<c:import url="../shared/_page.jsp">
										<c:param name="pageUrl"
											value="${pageContext.request.contextPath}/admin/users"></c:param>
									</c:import>
								</div>

							</div>

						</div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="../shared/_footer.jsp"></jsp:include>
		<jsp:include page="../shared/_left_aside.jsp"></jsp:include>
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<!-- REQUIRED JS SCRIPTS -->
	<c:import url="../shared/_javascript.jsp"></c:import>
</body>
</html>