<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%String baseUrl = request.getContextPath(); %>

<form action="${param.actionUrl }" method="POST" class="form-horizontal">
  <c:if test="${param.method=='PATCH' }">
    <input type="hidden" name="_method" value="PATCH">
    <input type="hidden" name="id" value="${navMenu.id}">
  </c:if>
  <div class="form-group">
    <label class="col-md-4 control-label">一级导航</label>
    <div class="col-md-8">
      <select class="form-control" name="parentnav">
        <option value="1" <c:if test="${navMenu.parentnav=='1' }">selected</c:if>>项目案例</option>
        <option value="2" <c:if test="${navMenu.parentnav=='2' }">selected</c:if>>团队管理</option>
        <option value="3" <c:if test="${navMenu.parentnav=='3' }">selected</c:if>>新闻动态</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-4 control-label">导航名称</label>
    <div class="col-md-8">
      <input type="text" name="name" class="form-control" value="${navMenu.name}" >
    </div>
  </div>
  <div class="row">
    <div class="col-md-5 col-md-offset-5">
      <button type="submit" class="btn btn-info">提交</button>
    </div>
  </div>
</form>