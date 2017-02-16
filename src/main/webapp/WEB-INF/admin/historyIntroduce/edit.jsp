<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <h1>公司基本信息</h1>
      <ol class="breadcrumb">
        <li><a href="<%=baseUrl%>/admin/dashborad"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">公司基本信息</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Your Page Content Here -->
      <div class="box">
        <div class="box-body">
          <div class="row text-right">
            <div class="col-md-12">
              <button class="btn btn-success" data-toggle="modal" data-target="#myModal">合作伙伴</button>
              <button class="btn btn-success" data-toggle="modal" data-target="#addCooperationCompany">新增合作伙伴</button>
            </div>
          </div>
          <div class="row">
            <div class="col-md-8">
              <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/aboutUs/historyIntroduce/update" enctype="multipart/form-data">
				<div class="form-group">
				  <label class="col-md-3 control-label">宣传视频</label>
				  <div class="col-md-9">
				    <input name="video" type="text" class="form-control" value="${historyIntroduce.video}">
				    <p class="help-block">请上传优酷视频链接</p>
				  </div>
				</div>
				<c:if test="${historyIntroduce.headImg != null}">
				  <div class="form-group">
				    <label class="col-md-3 control-label">公司图片</label>
				    <div class="col-md-9">
				      <img class="img-responsive" src="${pageContext.request.contextPath}/${historyIntroduce.headImg}">
				    </div>
				  </div>
				</c:if>
		        <div class="form-group">
				  <label class="col-md-3 control-label">公司图片</label>
				  <div id="uploadFileDiv" class="col-md-9">
				    <input id="pdFile" name="file" type="file">
				    <div id="fileError" class="help-block"></div>
				    <p class="help-block"></p>
				  </div>
				</div>
				<c:if test="${historyIntroduce.serviceHeadImg != null}">
				  <div class="form-group">
				    <label class="col-md-3 control-label">服务范围图片</label>
				    <div class="col-md-9">
				      <img class="img-responsive" src="${pageContext.request.contextPath}/${historyIntroduce.serviceHeadImg}">
				    </div>
				  </div>
				</c:if>
				<div class="form-group">
				  <label class="col-md-3 control-label">服务范围图片</label>
				  <div id="uploadFileDiv" class="col-md-9">
				    <input id="serviceFile" name="serviceFile" type="file">
				    <div id="fileError" class="help-block"></div>
				    <p class="help-block"></p>
				  </div>
				</div>
				<div class="form-group">
				  <label class="col-md-3 control-label">公司历程</label>
				  <div class="col-md-9">
				    <script id="container" name="companyHistory" type="text/plain" name="content">${historyIntroduce.companyHistory}</script>
				  </div>
				</div>
				<div class="form-group">
				  <label class="col-md-3 control-label">服务范围</label>
				  <div class="col-md-9">
				    <script id="serviceContainer" name="serviceContent" type="text/plain" name="serviceContent">${historyIntroduce.serviceContent}</script>
				  </div>
				</div>
				<div class="form-group">
				  <div class="row">
				    <div class="col-md-6 col-md-offset-4">
				      <button class="btn btn-success" type="submit">提交</button>
				    </div>
				  </div>
				</div>
              </form>
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

<div class="modal fade" id="addCooperationCompany" tabindex="-1" role="dialog" aria-labelledby="addCooperationCompanyLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addCooperationCompanyLabel">新增合作伙伴</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
            <form action="${pageContext.request.contextPath}/admin/aboutUs/historyIntroduce/cooperations" class="form-horizontal" method="post" enctype="multipart/form-data" id="form">
              <div class="form-group">
                <label class="control-label col-md-3">合作伙伴名称</label>
                <div class="col-md-9">
                  <input class="form-control" name="name" type="text">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">合作伙伴链接</label>
                <div class="col-md-9">
                  <input class="form-control" name="link" type="text">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-3 control-label">合作伙伴logo</label>
                <div id="uploadFileDiv" class="col-md-9">
                  <input id="pdFileLogo" name="file" type="file">
                  <div id="fileError" class="help-block"></div>
                  <p class="help-block"></p>
                 </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="document.getElementById('form').submit();">保存</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">合作伙伴列表</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
            <table class="table table-hover table-bordered">
              <tr>
                <td>id</td>
                <td>合作伙伴</td>
                <td>操作</td>
              </tr>
              <c:forEach var="cooperation" items="${cooperations}">
	            <tr>
	              <td>${cooperation.id}</td>
	              <td>${cooperation.name}</td>
	              <td>
	                <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/aboutUs/historyIntroduce/cooperations/${cooperation.id}/delete">删除</a>
	                <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/aboutUs/historyIntroduce/cooperations/${cooperation.id}/edit">编辑</a>
	              </td>
	            </tr>
              </c:forEach>
            </table>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<!-- ./wrapper -->
<!-- REQUIRED JS SCRIPTS -->
<c:import url="../shared/_javascript.jsp"></c:import>
<script src="<%=baseUrl%>/static/common/admin/js/image_upload.js" type="text/javascript"></script>
<script type="text/javascript">
   UE.getEditor('container');
   UE.getEditor('serviceContainer');
   $(function(){
	   $("#pdFileLogo").fileinput({
	     showPreview : true,
	     showUpload : false,
	     showRemove : false,
	     allowedFileExtensions : [ "jpg", "png", "gif"],
	     elErrorContainer : "#fileError",
	     browseClass : "btn btn-success",
	     browseLabel : "浏览文件",
	     browseIcon : '<i class="glyphicon glyphicon-search"></i>',
	     removeClass : "btn btn-danger",
	     removeLabel : "删除",
	     removeIcon : '<i class="glyphicon glyphicon-trash"></i>'
	   });
	   $("#serviceFile").fileinput({
	     showPreview : true,
	     showUpload : false,
	     showRemove : false,
	     allowedFileExtensions : [ "jpg", "png", "gif"],
	     elErrorContainer : "#fileError",
	     browseClass : "btn btn-success",
	     browseLabel : "浏览文件",
	     browseIcon : '<i class="glyphicon glyphicon-search"></i>',
	     removeClass : "btn btn-danger",
	     removeLabel : "删除",
	     removeIcon : '<i class="glyphicon glyphicon-trash"></i>'
	   });
	 });
</script>
</body>
</html>