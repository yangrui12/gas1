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
      <h1>${navMenu.name}详情</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="<%=baseUrl%>/admin/projectCases">分类列表</a></li>
        <li class="active">分类详情</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-2">名称：</div>
            <div class="col-md-8">${navMenu.name}</div>
            <div class="col-md-12"><hr></div>
            <div class="col-md-2">简介：</div>
            <div class="col-md-8">${navMenu.navMenuDesc}</div>
            <div class="col-md-12"><hr></div>
            <div class="col-md-2">内容：</div>
            <div class="col-md-8">${navMenu.content}</div>
            <div class="col-md-12"><hr></div>
            <div class="col-md-2">图片：</div>
            <div class="col-md-8"><img alt="图片" class="img-responsive" src="${pageContext.request.contextPath}/${navMenu.imgUrl}"></div>
          </div>
          <div class="row">
            <div class="col-md-12 text-right">
              <a class="btn btn-info" href="${pageContext.request.contextPath}/admin/projectCases/${navMenu.id}/projects/new">新增案例</a>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <table class="table table-striped table-hover">
                <tr>
                  <td>#</td>
                  <td>项目名称</td>
                  <td>操作</td>
                </tr>
                <c:forEach var="project" items="${pages.list}">
                  <tr>
                    <td>${project.id}</td>
                    <td>${project.zhName}</td>
                    <td>
                      <a class="btn btn-default" href="<%=baseUrl%>/admin/projectCases/${project.navMenuId}/projects/${project.id}/edit">编辑</a>
                      <form style="display: inline-block;" action="${pageContext.request.contextPath}/admin/projectCases/${navMenu.id}/projects/${project.id}/delete" method="post">
                        <!-- <input type="hidden" name="_method" value="DELETE"> -->
                        <button class="btn btn-danger" type="submit">删除</button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </table>
            </div>
            <div class="col-md-12">
              <c:import url="../shared/_page.jsp">
                <c:param name="pageUrl" value="${pageContext.request.contextPath}/admin/projectCases/${navMenu.id}"></c:param>
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

</body>
</html>
