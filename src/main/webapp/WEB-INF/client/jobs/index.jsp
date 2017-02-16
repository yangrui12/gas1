<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String baseUrl = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/shared_show.css">
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/job-info.css">
<title>招聘信息</title>
</head>
<body>
<jsp:include page="../shared/_header.jsp"></jsp:include>
<div class="main container">
        <section class="part-one text-center">
          <c:if test="${job.imgUrl!=null}">
            <img src="${pageContext.request.contextPath}/${job.imgUrl}" alt="pic" class="img-responsive">
          </c:if>
        </section>
        <section class="part-two">
            <div class="job-info-content">
                <h3>招聘信息</h3>
                <c:if test="${job!=null}">
                  <p>${job.content}</p>
                </c:if>
                <c:if test="${job==null}">
                  <p>暂无招聘信息</p>
                </c:if>
            </div>
        </section>
    </div>
 <jsp:include page="../shared/_footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/common/client/js/sites_show.js"></script>
</html>