<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="form-horizontal" method="POST" action="${param.actionUrl}" id="uploadForm" enctype="multipart/form-data">
  <c:if test="${param.method=='PATCH'}">
    <!-- <input type="hidden" name="_method" value="PATCH"> -->
    <input type="hidden" name="id" value="${job.id}">
  </c:if>
  <c:if test="${job.imgUrl != null}">
    <div class="form-group">
      <label class="col-md-3 control-label">图片</label>
      <div class="col-md-9">
        <img alt="图片" class="img-responsive" src="${pageContext.request.contextPath}/${job.imgUrl}">
      </div>
    </div>
  </c:if>
  <div class="form-group">
    <label class="col-md-3 control-label">图片文件</label>
    <div id="uploadFileDiv" class="col-md-9">
      <input id="pdFile" name="file" type="file">
      <div id="fileError" class="help-block"></div>
      <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M，宽x高:980x524</p>
    </div>
  </div>
  <div class="form-group">
    <div class="col-md-12">
      <script id="container" type="text/plain" name="content">${job.content}</script>
    </div>
  </div>
  <div class="form-group">
    <div class="col-md-8">
      <button class="btn btn-default col-md-offset-3" type="submit">提交</button>
    </div>
  </div>
</form>