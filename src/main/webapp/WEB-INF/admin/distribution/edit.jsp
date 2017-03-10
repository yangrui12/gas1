<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String baseUrl = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>GCY管理系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
      <h1>修改配送订单</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="<%=baseUrl%>/admin/distribution">分类列表</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
              <c:import url="_form.jsp">
                <c:param name="actionUrl" value="${pageContext.request.contextPath}/admin/distribution/${distribution.id}/update"></c:param>
                <c:param name="method" value="PATCH"></c:param>
              </c:import>
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
<script src="<%=baseUrl%>/static/common/admin/js/image_upload.js" type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=baseUrl%>/static/lib/bower_components/bootstrap-datetimepicker-master/moment_with_local.js"></script>
	<script type="text/javascript"
		src="<%=baseUrl%>/static/lib/bower_components/bootstrap-datetimepicker-master/Moment.js"></script>
	<script type="text/javascript"
		src="<%=baseUrl%>/static/lib/bower_components/bootstrap-datetimepicker-master/build/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=baseUrl%>/static/lib/bower_components/bootstrap-datetimepicker-master/zh_cn.js"></script>
	<script type="text/javascript"
		src="<%=baseUrl%>/static/common/admin/js/distribution_index.js"></script>

</body>
</html>
