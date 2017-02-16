<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String baseUrl = request.getContextPath(); %>

<form action="${param.actionUrl}" method="POST" class="form-horizontal">
  <c:if test="${param.method=='PATCH'}">
    <!-- <input type="hidden" name="_method" value="PUT"> -->
    <input type="hidden" name="id" value="${project.id}">
  </c:if>
  <input type="hidden" name="navMenuId" value="${menu.id}">
  <div class="form-group">
    <label class="control-label col-md-2">案例中文名称</label>
    <div class="col-md-10">
      <input type="text" class="form-control" name="zhName" value="${project.zhName}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-2">案例英文名称</label>
    <div class="col-md-10">
      <input type="text" class="form-control" name="cnName" value="${project.cnName}">
    </div>
  </div>
  <div class="form-group">
    <label for="" class="col-md-2 control-label">项目图片</label>
    <div class="col-md-10" id="imgUrls">
      <input id="imgUrl" type="file" multiple class="file-loading form-control">
      <c:forEach var="image" items="${images}">
        <input type='hidden' name='imgUrls' class="imagePaths" data-image-id="${image.id }" data-image-path="${pageContext.request.contextPath}/${image.imgUrl}" value="${image.imgUrl}">
      </c:forEach>
      <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M，图片宽x高:980x524</p>
    </div>
  </div>  
  <div class="form-group">
    <label class="control-label col-md-2">项目地址</label>
    <div class="col-md-10">
      <input type="text" class="form-control" name="address" value="${project.address}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-2">内容</label>
    <div class="col-md-10">
      <script id="container" name="content" type="text/plain" name="content">${project.content}</script>
      <!-- <textarea rows="10" class="form-control" name="content">${project.content}</textarea> -->
    </div>
  </div>
  <div class="form-group">
    <div class="row">
      <div class="col-md-4 col-md-offset-6">
        <button type="submit" class="btn btn-info">提交</button>
      </div>
    </div>
  </div>
</form> 