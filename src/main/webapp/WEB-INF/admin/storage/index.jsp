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
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=baseUrl%>/static/lib/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="<%=baseUrl%>/static/lib/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=baseUrl%>/static/lib/bower_components/AdminLTE/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="<%=baseUrl%>/static/lib/bower_components/AdminLTE/dist/css/skins/skin-blue.min.css">
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="../shared/_header.jsp"></jsp:include>
		<jsp:include page="../shared/_aside.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>仓储管理</h1>
				<ol class="breadcrumb">
					<li><a href="<%=baseUrl%>/admin/dashborad"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">仓储管理</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Your Page Content Here -->
				<div class="box-body">
					<div class="row">
						<div class="col-md-12">
							<a type="button" class="btn btn-info btn-lg"
								href="${pageContext.request.contextPath}/admin/distribution/${distribution.id}/edit?backUrl=/admin/distribution">
								<span class="fa fa-newspaper-o" aria-hidden="true"></span>向前
							</a>

							<button type="button" class="btn btn-primary btn-lg">
								<span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>向后
							</button>

							<a type="button" class="btn btn-info btn-lg"
								href="${pageContext.request.contextPath}/admin/distribution/new">
								<span class="fa fa-newspaper-o" aria-hidden="true"></span>新增
							</a>

							<button type="button" class="btn btn-info btn-lg">
								<span class="fa fa-pencil-square-o" aria-hidden="true"></span>修改
							</button>

							<button type="button" class="btn btn-danger btn-lg">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
							</button>

							<button type="button" class="btn btn-success btn-lg">
								<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>保存
							</button>

							<a type="button" class="btn btn-warning btn-lg"
								href="<%=baseUrl%>/admin/distribution"> <span
								class="fa fa-newspaper-o" aria-hidden="true"></span>取消
							</a>

							<button type="submit" class="btn btn-info btn-lg">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
							</button>

							<button type="button" class="btn btn-info btn-lg" id="print">
								<span class="glyphicon glyphicon-print" aria-hidden="true"></span>打印
							</button>

							<%-- <a class="btn btn-default" href="<%=baseUrl%>/admin/banners/new">新增</a> --%>
						</div>

						<br> <br> <br>


						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">库区</label>
									<div class="col-md-8">
										<input type="text" class="form-control" name="name"
											value="${distribution.name}" placeholder="气瓶编号">
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">气瓶类型</label>
									<div class="col-md-8">
										<input type="text" class="form-control" name="name"
											value="${distribution.name}" placeholder="气体类型">
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">数量</label>
									<div class="col-md-8">
										<input type="text" class="form-control" name="driver"
											value="${distribution.driver}" placeholder="数量">
									</div>
								</div>
							</div>


							<div class="col-md-4">

								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">规格</label>
									<div class="col-md-8">
										<input type="text" class="form-control" name="transporter"
											value="${distribution.transporter}" placeholder="规格">
									</div>
								</div>

							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">所属单位</label>
									<div class="col-md-8">
										<input type="text" class="form-control" name="dispatcher"
											value="${distribution.dispatcher}" placeholder="所属单位">
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">检验标准</label>
									<div class="col-md-8">
										<input type="text" class="form-control" name="dispatcher"
											value="${distribution.dispatcher}" placeholder="检验标准">
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">日期</label>
									<div class="col-md-6">
										<div class='input-group date' id='datetimepicker9'>
											<input type='text' class="form-control"
												style="height: 35px; width: 165px" name="date"
												value="${distribution.date}" /> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-md-4 text-right">备注</label>
									<div class="col-md-8">
										<input type="text" class="form-control" name="note"
											value="${distribution.note}" placeholder="备注">
									</div>
								</div>
							</div>



						</div>
						<div class="row">
							<div class="col-md-12">
								<table class="table table-strip table-hover">
									<tr>
										<td>序号</td>
										<td>库区</td>
										<td>气瓶类型</td>
										<td>数量</td>
										<td>规格</td>
										<td>所属单位</td>
										<td>检验标准</td>
										<td>日期</td>
										<td>备注</td>
										<td>操作</td>
									</tr>
									<c:forEach var="banner" items="${banners }">
										<tr>
											<td>${banner.id}</td>
											<td>${banner.name}</td>
											<td><a class="btn btn-default"
												href="<%=baseUrl%>/admin/banners/${banner.id}/edit">编辑</a>
												<form
													action="<%=baseUrl%>/admin/banners/${banner.id}/delete"
													method="POST" style="display: inline;">
													<!-- <input type="hidden" name="_method" value="DELETE"> -->
													<button class="btn btn-danger" type="submit">删除</button>
												</form></td>
										</tr>
									</c:forEach>
								</table>
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

	<!-- jQuery 2.2.3 -->
	<script type="text/javascript"
		src="<%=baseUrl%>/static/lib/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script type="text/javascript"
		src="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=baseUrl%>/static/lib/bower_components/AdminLTE/dist/js/app.min.js"></script>

</body>
</html>
