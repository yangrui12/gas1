<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <h1>导航菜单</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active"><a href="<%=baseUrl%>/admin/projectCases">导航菜单</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-12 text-right">
              <a class="btn btn-info" href="<%=baseUrl%>/admin/navMenus/new">新增</a>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <table class="table table-striped table-hover">
                <tr>
                  <td>#</td>
                  <td>一级导航</td>
                  <td>二级导航</td>
                  <td></td>
                  <td>操作</td>
                </tr>
                <c:forEach items="${navMenus}" varStatus="i" var="menu" >
                  <tr>
                    <td>${i.index+1}</td>
                    <td>
                      <c:if test="${menu.parentNav=='1'}">项目案例</c:if>
                      <c:if test="${menu.parentNav=='2'}">团队管理</c:if>
                      <c:if test="${menu.parentNav=='3'}">新闻动态</c:if>
                    </td>
                    <td>${menu.name}<td>
                    <td>
                      <a href="<%=baseUrl%>/admin/navMenus/${menu.id}/edit" class="btn btn-info">编辑</a>
                      <form style="display: inline-block;" method="POST" action="<%=baseUrl%>/admin/navMenus/${menu.id}">
                        <input type="hidden" name="_name" method="DELETE">
                        <button class="btn btn-danger">删除</button>
                      </form>
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
