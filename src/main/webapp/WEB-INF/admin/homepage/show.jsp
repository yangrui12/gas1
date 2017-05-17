<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
				<h1>主页信息</h1>
				<ol class="breadcrumb">
					<li><a href="<%=baseUrl%>/admin/dashborad"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<!-- <li class="active">Here</li> -->
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Your Page Content Here -->
				<div class="box">
					<div class="box-body">
						<div class="row">
							<div class="col-xs-9" style="text-align: center">
								<div class="col-xs-4 bg-info">

									<table class="table">
										<caption style="text-align: center">作业统计</caption>
										<thead>
											<tr>
												<th style="text-align: center">类型</th>
												<th style="text-align: center">次数</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>注册</td>
												<td>15</td>
											</tr>
											<tr>
												<td>预检</td>
												<td>23</td>
											</tr>
											<tr>
												<td>充装</td>
												<td>45</td>
											</tr>
											<tr>
												<td>配送</td>
												<td>43</td>
											</tr>
											<!-- <tr>
												<td>回收</td>
												<td>23</td>
											</tr>
											<tr>
												<td>检验</td>
												<td>67</td>
											</tr> -->
										</tbody>
									</table>

								</div>
								<div class="col-xs-4 bg-warning">

									<table class="table">
										<caption style="text-align: center">报警气瓶</caption>
										<thead>
											<tr>
												<th style="text-align: center">编号</th>
												<th style="text-align: center">气瓶类型</th>
												<th style="text-align: center">原因</th>
											</tr>
										</thead>
										<tbody>
											<tr class="active">
												<td>242141</td>
												<td>氧气</td>
												<td>到期</td>
											</tr>
											<tr class="success">
												<td>745652</td>
												<td>氮气</td>
												<td>到期</td>
											</tr>
											<tr class="danger">
												<td>743543</td>
												<td>天然气</td>
												<td>损坏</td>
											</tr>
											<tr class="success">
												<td>564324</td>
												<td>混合气体</td>
												<td>到期</td>
											</tr>
										</tbody>
									</table>

								</div>
								<div class="col-xs-4 bg-info">
									<div class="form-group">
										<label for="exampleInputEmail1"
											style="background: blue; color: #00ff00">最新客户订单</label><br>
										<div class="col-xs-6">
											<div class="form-group">
												<label for="exampleInputEmail1">种类</label> <br> <label
													for="exampleInputEmail1">1 氧气</label> <br> <label
													for="exampleInputEmail1">2 氮气</label> <br> <label
													for="exampleInputEmail1">3 氯气</label> <br> <label
													for="exampleInputEmail1">4 医用氧</label> <br> <label
													for="exampleInputEmail1">5 天然气</label> <br> <label
													for="exampleInputEmail1">6 混合气体</label> <br>
											</div>
										</div>
										<div class="col-xs-6">
											<div class="form-group">
												<label for="exampleInputEmail1">数量</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-8">
									<table class="table">
										<caption style="text-align: center">本月计件排行</caption>
										<thead>
											<tr>
												<th style="text-align: center">姓名</th>
												<th style="text-align: center">时间</th>
												<th style="text-align: center">状态</th>
											</tr>
										</thead>
										<tbody>
											<tr class="active">
												<td>产品1</td>
												<td>23/11/2013</td>
												<td>待发货</td>
											</tr>
											<tr class="success">
												<td>产品2</td>
												<td>10/11/2013</td>
												<td>发货中</td>
											</tr>
											<tr class="warning">
												<td>产品3</td>
												<td>20/10/2013</td>
												<td>待确认</td>
											</tr>
											<tr class="danger">
												<td>产品4</td>
												<td>20/10/2013</td>
												<td>已退货</td>
											</tr>
										</tbody>
									</table>

								</div>
								<div class="col-xs-4 bg-danger">
									<div class="form-group">
										<label for="exampleInputEmail1"
											style="background: blue; color: #00ff00">报废气瓶</label> <br>
										<div class="col-xs-6">
											<div class="form-group">
												<label for="exampleInputEmail1"
													style="background: blue; color: #00ff00">种类</label> <br>
												<label for="exampleInputEmail1">1 氧气</label> <br> <label
													for="exampleInputEmail1">2 氮气</label> <br> <label
													for="exampleInputEmail1">3 氯气</label> <br> <label
													for="exampleInputEmail1">4 医用氧</label> <br> <label
													for="exampleInputEmail1">5 天然气</label> <br> <label
													for="exampleInputEmail1">6 混合气体</label> <br>
											</div>
										</div>
										<div class="col-xs-6">
											<div class="form-group">
												<label for="exampleInputEmail1"
													style="background: blue; color: #00ff00">数量</label> <br>
												<label for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br> <label
													for="exampleInputEmail1">145</label> <br>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-3 bg-primary">
								<div class="form-group" style="text-align: center">
									<label for="exampleInputEmail1"
										style="background: blue; color: #00ff00">气瓶统计</label> <br>
									<div class="col-xs-6">
										<div class="form-group">
											<label for="exampleInputEmail1"
												style="background: blue; color: #00ff00">种类</label> <br>
											<label for="exampleInputEmail1">1 氧气</label> <br> <label
												for="exampleInputEmail1">2 氮气</label> <br> <label
												for="exampleInputEmail1">3 氯气</label> <br> <label
												for="exampleInputEmail1">4 医用氧</label> <br> <label
												for="exampleInputEmail1">5 天然气</label> <br> <label
												for="exampleInputEmail1">6 混合气体</label> <br> <label
												for="exampleInputEmail1">1 氧气</label> <br> <label
												for="exampleInputEmail1">2 氮气</label> <br> <label
												for="exampleInputEmail1">3 氯气</label> <br> <label
												for="exampleInputEmail1">4 医用氧</label> <br> <label
												for="exampleInputEmail1">5 天然气</label> <br> <label
												for="exampleInputEmail1">6 混合气体</label> <br> <label
												for="exampleInputEmail1">4 医用氧</label> <br> <label
												for="exampleInputEmail1">5 天然气</label> <br> <label
												for="exampleInputEmail1">6 混合气体</label> <br>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="form-group">
											<label for="exampleInputEmail1"
												style="background: blue; color: #00ff00">数量</label> <br>
											<label for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br> <label
												for="exampleInputEmail1">145</label> <br>
										</div>
									</div>
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
