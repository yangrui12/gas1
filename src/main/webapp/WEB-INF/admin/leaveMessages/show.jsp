<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String baseUrl = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AUD管理系统</title>
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
      <h1>查看详情</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">查看详情</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Your Page Content Here -->
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-12" style="margin:15px;">
              <div class="col-md-3" style="text-align:right;font-weight:bold;font-size:16px;">名字:</div>
              <div class="col-md-8">${leaveMessage.name}</div>
            </div>
            <div class="col-md-12" style="margin:15px;">
              <div class="col-md-3" style="text-align:right;font-size:18px;font-weight:bold;">email:</div>
              <div class="col-md-8">${leaveMessage.email}</div>
            </div>
            <div class="col-md-12" style="margin:15px;">
              <div class="col-md-3" style="text-align:right;font-weight:bold;font-size:16px;">留言时间:</div>
              <div class="col-md-8">${leaveMessage.createdAt}</div>
            </div>
            <div class="col-md-12" style="margin:15px;">
              <div class="col-md-3" style="text-align:right;font-weight:bold;font-size:16px;">电话号码:</div>
              <div class="col-md-8">${leaveMessage.phoneNumber}</div>
            </div>
            <div class="col-md-12" style="margin:15px;">
              <div class="col-md-3" style="text-align:right;font-weight:bold;font-size:16px;">留言:</div>
              <div class="col-md-8" style="word-wrap:break-word;word-break:break-all;">${leaveMessage.message}</div>
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