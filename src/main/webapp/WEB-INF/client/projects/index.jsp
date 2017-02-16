<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String baseUrl = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/shared_show.css">
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/all-case.css">
<title>城市设计全部案例</title>
</head>
<body>
    <jsp:include page="../shared/_header.jsp"></jsp:include>
    <div class="main container">
        <section class="part-one">
            <div class="row all-case">
                <div class="col-sm-12">全部案例</div>
                <c:forEach var="item" items="${collection}">
                  <c:set var="project" value="${item.project}"></c:set>
                  <c:set var="imageUrl" value="${item.images[0].imgUrl}"></c:set>
                  <div class="col-sm-3">
                    <a href="<%=baseUrl%>/client/projects/${project.id}">
                      <img src="${pageContext.request.contextPath }/${imageUrl}" alt="pic" class="img-responsive">
                      <p>${project.zhName}</p>
                    </a>
                  </div>                
                </c:forEach>
                <div class="col-sm-12">
                  <c:import url="../shared/_page.jsp">
                    <c:param name="pageUrl" value="${pageContext.request.contextPath}/client/projects"></c:param>
                  </c:import>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../shared/_footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/common/client/js/sites_show.js"></script>
</html>