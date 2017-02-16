<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String baseUrl = request.getContextPath(); %>

<form action="${param.actionUrl}" method="POST" class="form-horizontal" id="uploadForm" enctype="multipart/form-data">
  <c:if test="${param.method=='PATCH'}">
    <!-- <input type="hidden" name="_method" value="PATCH"> -->
    <input type="hidden" name="id" value="${teamMember.id}">
  </c:if>
  <div class="form-group">
    <label class="control-label col-md-4">姓名</label>
    <div class="col-md-8">
      <input type="text" class="form-control" name="name" value="${teamMember.name}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-4">职位</label>
    <div class="col-md-8">
      <input type="text" class="form-control" name="position" value="${teamMember.position}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-4">地址</label>
    <div class="col-md-8">
      <input type="text" class="form-control" name="zhAddress" value="${teamMember.zhAddress}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-4">联系电话</label>
    <div class="col-md-8">
      <input type="text" class="form-control" name="phoneNumber" value="${teamMember.phoneNumber}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-4">荣誉</label>
    <div class="col-md-8">
      <input type="text" class="form-control" name="honor" value="${teamMember.honor}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-4">擅长领域</label>
    <div class="col-md-8">
      <input type="text" class="form-control" name="goodAt" value="${teamMember.goodAt}">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-4">参与的项目</label>
    <div class="col-md-8">
      <c:set var="hasFind" value="false"></c:set>
      <c:forEach var="project" items="${projects}">
        <c:forEach var="teamMemberProject" items="${teamMemberProjects}">
          <c:if test="${teamMemberProject.projectId==project.id}">
            <c:set var="hasFind" value="true"></c:set>
          </c:if>
        </c:forEach>
        <c:if test="${hasFind==true}">
          <div><input type="checkbox" name="projectIds" value="${project.id}" checked="checked">${project.zhName}</div>
        </c:if>
        <c:if test="${hasFind==false}">
          <div><input type="checkbox" name="projectIds" value="${project.id}">${project.zhName}</div>
        </c:if>
      </c:forEach>
    </div>
  </div>
  <c:if test="${teamMember.imgUrl != null}">
    <div class="form-group">
      <label class="col-md-4 control-label">头像</label>
      <div class="col-md-8">
        <img alt="banner图片" class="img-responsive" src="${pageContext.request.contextPath}/${teamMember.imgUrl}">
      </div>
    </div>
  </c:if>
  <div class="form-group">
    <label class="col-md-4 control-label">头像</label>
    <div id="uploadFileDiv" class="col-md-8">
      <input id="pdFile" name="file" type="file">
      <div id="fileError" class="help-block"></div>
      <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M，宽x高:215x117</p>
    </div>
  </div>
  <c:if test="${teamMember.card!=null}">
    <div class="form-group">
      <label class="col-md-4 control-label">个人名片</label>
      <div class="col-md-8">
        <a href="${pageContext.request.contextPath}/${teamMember.card}">点击查看</a>
      </div>
    </div>
  </c:if>
  <div class="form-group">
    <label class="col-md-4 control-label">个人名片</label>
    <div id="docFileDiv" class="col-md-8">
      <input id="docFile" name="personFile" type="file">
      <div id="docFileError" class="help-block"></div>
      <p class="help-block">支持jpg, png, gif, doc, docx, ppt</p>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-md-4">简介</label>
    <div class="col-md-8">
      <script id="container" name="brief" type="text/plain" name="brief">${teamMember.brief}</script>
      <!-- <textarea rows="10" class="form-control" name="brief">${teamMember.brief}</textarea> -->
    </div>
  </div>
  <div class="form-group">
    <div class="row">
      <div class="col-md-12">
        <button type="submit" class="btn btn-info col-md-offset-8">提交</button>
      </div>
    </div>
  </div>
</form> 
