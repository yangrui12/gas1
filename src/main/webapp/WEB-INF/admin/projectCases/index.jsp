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
<c:import url="../shared/_stylesheet.jsp"></c:import>
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="../shared/_header.jsp"></jsp:include>
		<jsp:include page="../shared/_aside.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>检验信息</h1>
				<ol class="breadcrumb">
					<li><a href="<%=baseUrl%>/admin/dashborad"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">检验信息</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Your Page Content Here -->
				<div class="box">
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<a href="<%=baseUrl%>/admin/projectCases/new"
									class="btn btn-info col-md-offset-11">新增检验信息</a> <a
									type="button" class="btn btn-info btn-lg"
									href="${pageContext.request.contextPath}/admin/distribution/${distribution.id}/edit?backUrl=/admin/distribution">
									<span class="fa fa-newspaper-o" aria-hidden="true"></span>向前
								</a>

								<button type="button" class="btn btn-primary btn-lg">
									<span class="glyphicon glyphicon-arrow-right"
										aria-hidden="true"></span>向后
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
									<span class="glyphicon glyphicon-floppy-save"
										aria-hidden="true"></span>保存
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


								<br> <br> <br>

								<div class="row">

									<div class="col-md-4">
										<div class="form-group">
											<label for="exampleInputEmail1" class="col-md-4 text-right">气瓶编号</label>
											<div class="col-md-8">
												<input type="text" class="form-control" name="name"
													value="${distribution.name}" placeholder="气瓶编号">
											</div>
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group">
											<label for="exampleInputEmail1" class="col-md-4 text-right">气瓶名称</label>
											<div class="col-md-8">
												<input type="text" class="form-control" name="carcode"
													value="${distribution.carcode}" placeholder="气瓶名称">
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="exampleInputEmail1" class="col-md-4 text-right">充装介质</label>
											<div class="col-md-8">
												<input type="text" class="form-control" name="driver"
													value="${distribution.driver}" placeholder="充装介质">
											</div>
										</div>
									</div>

									<div class="col-md-4">

										<div class="form-group">
											<label for="exampleInputEmail1" class="col-md-4 text-right">检验人</label>
											<div class="col-md-8">
												<input type="text" class="form-control" name="transporter"
													value="${distribution.transporter}" placeholder="检验人">
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="exampleInputEmail1" class="col-md-4 text-right">检验单位</label>
											<div class="col-md-8">
												<input type="text" class="form-control" name="dispatcher"
													value="${distribution.dispatcher}" placeholder="检验单位">
											</div>
										</div>
									</div>


									<div class="col-md-4">
										<div class="form-group">
											<label for="exampleInputEmail1" class="col-md-4 text-right">检验日期</label>
											<div class="col-md-6">
												<div class='input-group date' id='datetimepicker9'>
													<input type='text' class="form-control"
														style="height: 35px; width: 160px" name="date"
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

							</div>
						</div>

						<br>

						<div class="col-md-12">
							<table class="table table-striped table-hover">
								<tr>
									<td>#</td>
									<td>用户ID</td>
									<td>姓名</td>
									<td>电话</td>
									<td>家庭住址</td>
									<td>邮箱</td>
									<td>操作</td>
								</tr>
								<c:forEach var="navMenu" items="${pages.list}">
									<tr>
										<td>${navMenu.id}</td>
										<td>${navMenu.name}</td>
										<td><c:if test="${fn:length(navMenu.navMenuDesc)>12 }">  
                      ${fn:substring(navMenu.navMenuDesc, 0, 12)}......  
                    </c:if> <c:if test="${fn:length(navMenu.navMenuDesc)<=12 }">  
                      ${navMenu.navMenuDesc }  
                     </c:if></td>
										<td><a
											href="<%=baseUrl%>/admin/projectCases/${navMenu.id}/edit"
											class="btn btn-default">编辑</a> <a
											href="<%=baseUrl%>/admin/projectCases/${navMenu.id}"
											class="btn btn-info">配置详情</a>
											<form
												action="<%=baseUrl%>/admin/projectCases/${navMenu.id}/delete"
												style="display: inline-block;" method="post">
												<!-- <input type="hidden" name="_method" value="DELETE"> -->
												<button class="btn btn-danger" type="submit">删除</button>
											</form>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="col-md-12">
							<c:import url="../shared/_page.jsp">
								<c:param name="pageUrl"
									value="${pageContext.request.contextPath}/admin/projectCases"></c:param>
							</c:import>
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
