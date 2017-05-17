<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="form-horizontal" method="post" action="${param.actionUrl}" id="uploadForm" enctype="multipart/form-data">
  <c:if test="${param.method=='PATCH'}">
    <input type="hidden" name="_method" value="PUT">
    <input type="hidden" name="id" value="${banner.id}">
  </c:if>
  <div class="form-group">
    <label class="col-md-4 control-label">名称</label>
    <div class="col-md-8">
      <input type="text" name="name" value="${banner.name}" class="form-control">
    </div>
  </div>
 <!--   <div class="form-group">
    <label class="col-md-4 control-label">链接</label>
    <div class="col-md-8">
      <input type="text" name="url" value="${banner.url }" class="form-control"> 
    </div>
  </div> -->
  <c:if test="${banner.imgUrl != null}">
  <div class="form-group">
    <label class="col-md-4 control-label">图片</label>
    <div class="col-md-8">
      <img alt="banner图片" class="img-responsive" src="${pageContext.request.contextPath}/${banner.imgUrl}">
    </div>
  </div>
  </c:if>
  <div class="form-group">
    <label class="col-md-4 control-label">图片文件</label>
    <div id="uploadFileDiv" class="col-md-8">
      <input id="pdFile" name="file" type="file">
      <div id="fileError" class="help-block"></div>
      <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M，宽x高:980x524</p>
      <br />
    </div>
  </div>
  <div class="row">
    <div class="col-md-4 col-md-offset-3">
      <button class="btn btn-info" type="submit">提交</button>
    </div>
  </div>
</form>