<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String baseUrl = request.getContextPath(); %>

<form action="${param.actionUrl}" method="POST" class="form-horizontal">
  <c:if test="${param.method=='PATCH'}">
    <!-- <input name="_method" value="PATCH" type="hidden"> -->
    <input type="hidden" name="id" value="${user.id}">
  </c:if>
  <div class="form-group">
    <label class="control-label col-md-3">用户名</label>
    <div class="col-md-6">
      <input type="text" class="form-control" name="name" value="${user.name}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-3">密码</label>
    <div class="col-md-6">
      <input type="text" class="form-control" name="password" value="${user.password}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-3">是否为超级用户</label>
    <div class="col-md-6">
      <select class="form-control" name="root">
        <option value="Y" ${user.root == 'Y'? 'selected' : ''}>是</option>
        <option value="N" ${user.root == 'N'? 'selected' : ''}>否</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <div class="row">
      <div class="col-md-4 col-md-offset-5">
        <button type="submit" class="btn btn-info">提交</button>
      </div>
    </div>
  </div>
</form> 
