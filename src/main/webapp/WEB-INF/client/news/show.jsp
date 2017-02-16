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
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/news-detail.css">
<title>新闻详情</title>
</head>
<body>
<jsp:include page="../shared/_header.jsp"></jsp:include>
<div class="main container">
        <div class="row">
            <div class="col-sm-2">
                <img src="${pageContext.request.contextPath}/${newItem.headImg}" alt="pic" class="img-responsive">
            </div>
            <div class="col-sm-6">
                <h3>${newItem.title}</h3>
                <p>${newItem.content}</p>
            </div>
            <div class="col-sm-4">
                <ul class="nav more-case">
                    <li><a href="${pageContext.request.contextPath}/client/news">更多新闻</a></li>
                    <c:forEach var="newsItem" items="${news}">
                      <li class="clearfix">
                        <div class="col-xs-5 case-pic">
                          <a href="<%=baseUrl%>/client/newsCategories/${newsItem.navmenueId}/news/${newsItem.id}">
                            <img src="${pageContext.request.contextPath}/${newsItem.headImg}" alt="pic" class="img-responsive">
                          </a>
                        </div>
                        <div class="col-xs-7 case-text">
                          <a href="<%=baseUrl%>/client/newsCategories/${newsItem.navmenueId}/news/${newsItem.id}">${newsItem.title}</a>
                        </div>
                      </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
 <jsp:include page="../shared/_footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/common/client/js/sites_show.js"></script>
</html>