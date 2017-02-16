<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String baseUrl = request.getContextPath(); %>

<form action="${param.actionUrl}" method="POST" class="form-horizontal">
  <c:if test="${param._method=='PATCH'}">
    <input class="form-control" type="hidden" name="id" value="${team.id}">
  </c:if>
  <div class="form-group">
    <label class="control-label col-md-4">团队名称</label>
    <div class="col-md-8">
      <input class="form-control" type="text" name="name" value="${team.name}">
    </div>
  </div>
  <div class="form-group">
    <div class="row">
      <div class="col-md-12">
        <button class="btn btn-info col-md-offset-5" type="submit" >提交</button>
      </div>
    </div>
  </div>
</form>