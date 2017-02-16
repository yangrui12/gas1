<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt " %> --%>
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
      <h1>新闻动态</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="<%=baseUrl%>/admin/newsCategories">分类列表</a></li>
        <li class="active">新闻列表</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Your Page Content Here -->
      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
              <a href="<%= baseUrl%>/admin/newsCategories/${newsCategory.id}/news/new" class="btn btn-info col-md-offset-10">发布新闻</a>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <table class="table table-striped table-hover">
                <tr>
                  <td>#</td>
                  <td>标题</td>
                  <!-- <td>发布日期</td> -->
                  <td>操作</td>
                </tr>
                <c:forEach var="newItem" items="${pages.list}">
                  <tr>
                    <td>${newItem.id}</td>
                    <td>${newItem.title}</td>
                    <!-- <td><fmt:formatDate value="${newItem.publishAt}" type="both" /></td>  -->
                    <!-- <td>${newItem.publishAt}</td> -->
                    <td>
                      <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/newsCategories/${newItem.navmenueId}/news/${newItem.id}/edit">编辑</a>
                      <form action="${pageContext.request.contextPath}/admin/newsCategories/${newItem.navmenueId}/news/${newItem.id}" method="post" style="display: inline-block;">
                        <input type="hidden" name="_method" value="DELETE">
                        <button type="submit" class="btn btn-danger">删除</button>
                      </form>
                  </tr>
                </c:forEach>
              </table>
            </div>
            <div class="col-md-12">
              <c:import url="../shared/_page.jsp">
                <c:param name="pageUrl" value="${pageContext.request.contextPath}/admin/newsCategories/${newsCategory.id}/news"></c:param>
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