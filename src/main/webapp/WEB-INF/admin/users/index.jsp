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
      <h1>用户管理</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active"><a href="<%=baseUrl%>/admin/users">团队列表</a></li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Your Page Content Here -->
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="row">
            <div class="col-md-12">
              <a href="<%=baseUrl%>/admin/users/new" class="btn btn-info col-md-offset-10">新增用户</a>
            </div>
           </div>
            <div class="col-md-12">
              <table class="table table-striped table-hover">
                <tr>
                  <td>id</td>
                  <td>用户名</td>
                  <td>超级用户</td>
                  <td>操作</td>
                </tr>
                <c:forEach var="user" items="${users}">
                  <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.root=='Y'?'是':'否'}</td>
                    <td>
                      <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/users/${user.id}/edit">编辑</a>
                      <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/users/${user.id}/delete">删除</a>
                    </td>
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
<c:import url="../shared/_javascript.jsp"></c:import>
</body>
</html>