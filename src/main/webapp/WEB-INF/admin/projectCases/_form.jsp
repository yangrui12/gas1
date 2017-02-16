<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="form-horizontal" method="POST" action="${param.actionUrl}" id="uploadForm" enctype="multipart/form-data">
  <c:if test="${param.method=='PATCH'}">
    <input name="_method" value="PATCH" type="hidden">
    <input type="hidden" name="id" value="${navMenu.id}">
  </c:if>
  <div class="form-group">
    <label class="col-md-3 control-label">案例分类名称</label>
    <div class="col-md-9">
      <input class="form-control" type="text" name="name" value="${navMenu.name}">
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-3 control-label">案例简介</label>
    <div class="col-md-9">
      <textarea class="form-control" rows="3" name="navMenuDesc">${navMenu.navMenuDesc}</textarea>
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-3 control-label">案例分类描述</label>
    <div class="col-md-9">
      <script id="container" name="content" type="text/plain" name="content">${navMenu.content}</script>
    </div>
  </div>
  <c:if test="${navMenu.imgUrl != null}">
    <div class="form-group">
      <label class="col-md-3 control-label">图片</label>
      <div class="col-md-9">
        <img alt="banner图片" class="img-responsive" src="${pageContext.request.contextPath}/${navMenu.imgUrl}">
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
    <div class="row">
      <div class="col-md-12">
        <button type="submit" class="btn btn-info col-md-offset-6">提交</button>
      </div>
    </div>
  </div>
</form>