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
	<div id="dashboard-id" data-dashboard-id="${dashboardId}"
		class="hidden"></div>
	<div class="wrapper">
		<jsp:include page="../shared/_header.jsp"></jsp:include>
		<jsp:include page="../shared/_aside.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>出厂检验</h1>
				<ol class="breadcrumb">
					<li><a href="<%=baseUrl%>/admin/dashborad"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">生产管理</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Your Page Content Here -->
				<div class="box">
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">

								<form action="${pageContext.request.contextPath}/admin/ashborad"
									method="get" class="form-horizontal" id="form">

									<a type="button" class="btn btn-info btn-lg"
										href="${pageContext.request.contextPath}/admin/dashborad/new">
										<span class="fa fa-newspaper-o" aria-hidden="true"></span>新增
									</a>

									<button type="submit" class="btn btn-primary btn-lg">
										<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
									</button>

									<a type="button" class="btn btn-warning btn-lg"
										href="<%=baseUrl%>/admin/dashborad"> <span
										class="fa fa-newspaper-o" aria-hidden="true"></span>取消
									</a>

									<button type="button" class="btn btn-info btn-lg" id="print">
										<span class="glyphicon glyphicon-print" aria-hidden="true"></span>打印
									</button>

									<%-- <a class="btn btn-default" href="<%=baseUrl%>/admin/banners/new">新增</a> --%>


									<br> <br> <br>


									<div class="row">
										<div class="col-md-4">

											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">气瓶条码</label>
												<div class="col-md-8">
													<input type="text" class="form-control" name="id"
														value="${dashborad.id}" placeholder="气瓶条码">
												</div>
											</div>

										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">气瓶类型</label>
												<div class="col-md-8">
													<select class="form-control stationarea" name="type">
														<option value="">--所有--</option>
														<option value="">空瓶</option>
														<option value="">满瓶</option>
													</select>
												</div>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">充装介质</label>
												<div class="col-md-8">
													<select class="form-control stationarea" name="media">
														<option value="">--所有--</option>
														<option value="">天然气</option>
														<option value="">氧气</option>
														<option value="">氮气</option>
														<option value="">二氧化碳</option>
													</select>
												</div>
											</div>
										</div>





										<div class="col-md-4">

											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">容积</label>
												<div class="col-md-8">
													<input type="text" class="form-control" name="volume"
														value="${dashborad.volume}" placeholder="容积">
												</div>
											</div>

										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">压力</label>
												<div class="col-md-8">
													<select class="form-control stationarea"
														name="workingpressure">
														<option value="">--所有--</option>
														<option value="">工作压力</option>
														<option value="">水压试验压力</option>
														<option value="">爆破试验压力</option>
													</select>
												</div>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">充装温度</label>
												<div class="col-md-8">
													<input type="text" class="form-control" name="tempeature"
														value="${dashborad.tempeature}" placeholder="充装温度">
												</div>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">检验人</label>
												<div class="col-md-8">
													<input type="text" class="form-control" name="examiner"
														value="${dashborad.examiner}" placeholder="检验人">
												</div>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">时间</label>
												<div class="col-md-6">
													<div class='input-group date' id='datetimepicker9'>
														<input type='text' class="form-control"
															style="height: 35px; width: 165px" name="date"
															value="${dashborad.date}" /> <span
															class="input-group-addon"> <span
															class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
												</div>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1" class="col-md-4 text-right">GPS监控</label>
												<div class="col-md-8">
													<input type="text" class="form-control" name="GPS"
														value="${dashborad.GPS}" placeholder="GPS监控">
												</div>
											</div>
										</div>

									</div>

								</form>


								<br> <br>

								<div class="table-responsive">
									<div class="my_show">
										<div style="background: blue; color: #00ff00">明细信息</div>
										<table class="table table-bordered table-hover">

											<tbody>
												<tr role="row">
													<th class="sorting  success  text-center " tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending">气瓶条码</th>
													<th class="sorting  warning text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending">气瓶类型</th>
													<th class="sorting  danger text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="Engine version: activate to sort column ascending">充装介质</th>
													<th class="sorting  info text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="CSS grade: activate to sort column ascending">容积</th>
													<th class="sorting_asc  active  text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Rendering engine: activate to sort column descending">工作压力</th>
													<th class="sorting_asc  active  text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Rendering engine: activate to sort column descending">水压试验压力</th>
													<th class="sorting_asc  active  text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Rendering engine: activate to sort column descending">爆破试验压力</th>
													<th class="sorting  success  text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending">温度</th>
													<th class="sorting  info text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending">检验人</th>
													<th class="sorting  warning  text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending">时间</th>
													<th class="sorting  danger  text-center" tabindex="0"
														aria-controls="example2" rowspan="1" colspan="1"
														aria-label="Engine version: activate to sort column ascending">GPS监控</th>
													<th class="sorting_asc  active  text-center my_hidden"
														tabindex="0" aria-controls="example2" rowspan="1"
														colspan="1" aria-sort="ascending"
														aria-label="Rendering engine: activate to sort column descending">操作</th>
												</tr>


												<c:forEach var="dashborad" items="${pages.list}">
													<tr>
														<td>${dashborad.id}</td>
														<td>${dashborad.type}</td>
														<td>${dashborad.media}</td>
														<td>${dashborad.volume}</td>
														<td>${dashborad.workingpressure}</td>
														<td>${dashborad.waterpressure}</td>
														<td>${dashborad.blastingpressure}</td>
														<td>${dashborad.tempeature}</td>
														<td>${dashborad.examiner}</td>
														<td>${dashborad.date}</td>
														<td>${dashborad.GPS}</td>


														<td name="op_TD"><a
															class="btn btn-default col-xs-offset-1 "
															href="${pageContext.request.contextPath}/admin/dashborad/${dashborad.id}/edit?backUrl=/admin/dashborad?pageNo=<c:if test="${param.pageNo==null}">1</c:if>${param.pageNo}">编辑</a>
															<a class="btn btn-danger deletebutton  col-xs-offset-1"
															href="${pageContext.request.contextPath}/admin/dashborad/${dashborad.id}/delete">删除</a>
														</td>

													</tr>
												</c:forEach>

											</tbody>

										</table>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-6 col-xs-offset-5">
										<c:import url="../shared/_page.jsp">
											<c:param name="pageUrl"
												value="${pageContext.request.contextPath}/admin/dashborad"></c:param>
										</c:import>
									</div>

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
