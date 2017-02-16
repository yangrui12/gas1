<!-- blog.csdn.net/Java_chaozi/article/details/53311483 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String baseUrl = request.getContextPath(); %>
<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=baseUrl%>/static/lib/bower_components/AdminLTE/dist/js/app.min.js"></script>
<script src="<%=baseUrl%>/static/lib/bower_components/bootstrap-fileinput/js/fileinput.min.js" type="text/javascript"></script>
<script src="<%=baseUrl%>/static/lib/bower_components/bootstrap-fileinput/js/locales/zh.js"  type="text/javascript"></script>

<!-- canvas-to-blob.min.js is only needed if you wish to resize images before upload.
     This must be loaded before fileinput.min.js -->
<script src="<%=baseUrl%>/static/lib/bower_components/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
<!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview.
     This must be loaded before fileinput.min.js -->
<script src="<%=baseUrl%>/static/lib/bower_components/bootstrap-fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>
<!-- purify.min.js is only needed if you wish to purify HTML content in your preview for HTML files.
     This must be loaded before fileinput.min.js -->
<script src="<%=baseUrl%>/static/lib/bower_components/bootstrap-fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
<!-- the main fileinput plugin file -->
<script src="<%=baseUrl%>/static/lib/bower_components/bootstrap-fileinput/js/fileinput.min.js"></script>
<!-- optionally if you need a theme like font awesome theme you can include 
    it as mentioned below -->
<!-- optionally if you need translation for your language then include 
    locale file as mentioned below -->
<script src="<%=baseUrl%>/static/lib/bower_components/bootstrap-fileinput/js/locales/zh.js"></script>

<script src="<%=baseUrl%>/ueditor/ueditor.config.js"></script>
<script src="<%=baseUrl%>/ueditor/ueditor.all.min.js"></script>
<script src="<%=baseUrl%>/ueditor/lang/zh-cn/zh-cn.js"></script>