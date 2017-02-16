<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
      <h1>案例分类列表</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">分类列表</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
              <a href="<%=baseUrl%>/admin/projectCases/new" class="btn btn-info col-md-offset-10">新增分类</a>
            </div>
          </div>
          <div class="col-md-12">
            <table class="table table-striped table-hover">
              <tr>
                <td>#</td>
                <td>分类名称</td>
                <td>分类简介</td>
                <td>操作</td>
              </tr>
              <c:forEach var="navMenu" items="${pages.list}">
                <tr>
                  <td>${navMenu.id}</td>
                  <td>${navMenu.name}</td>
                  <td>
                    <c:if test="${fn:length(navMenu.navMenuDesc)>12 }">  
                      ${fn:substring(navMenu.navMenuDesc, 0, 12)}......  
                    </c:if>  
                    <c:if test="${fn:length(navMenu.navMenuDesc)<=12 }">  
                      ${navMenu.navMenuDesc }  
                     </c:if>
                  </td>
                  <td>
                    <a href="<%=baseUrl%>/admin/projectCases/${navMenu.id}/edit" class="btn btn-default">编辑</a>
                    <a href="<%=baseUrl%>/admin/projectCases/${navMenu.id}" class="btn btn-info">配置详情</a>
                    <form action="<%=baseUrl%>/admin/projectCases/${navMenu.id}/delete" style="display: inline-block;" method="post">
                      <!-- <input type="hidden" name="_method" value="DELETE"> -->
                      <button class="btn btn-danger" type="submit">删除</button>
                    </form>
                </tr>
              </c:forEach>
            </table>
          </div>
          <div class="col-md-12">
	        <c:import url="../shared/_page.jsp">
	          <c:param name="pageUrl" value="${pageContext.request.contextPath}/admin/projectCases"></c:param>
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
