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
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/case-details.css">
<title>案例详情</title>
</head>
<body>
    <jsp:include page="../shared/_header.jsp"></jsp:include>
    <div class="main container">
        <section>
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <c:forEach var="image" items="${images}" varStatus="status">
                  <c:if test="${status.index==0}">
                    <div class="item active">
                  </c:if>
                  <c:if test="${status.index!=0}">
                    <div class="item">
                  </c:if>
                    <img src="${pageContext.request.contextPath}/${image.imgUrl}" alt="pic" class="img-responsive">
                  </div>
                </c:forEach>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        </section>
        <section class="part_two">
            <div class="row">
                <div class="col-sm-12 col-lg-8">
                    <div class="title">
                        <h2>${project.zhName}</h2>
                        <h3>${project.cnName}</h3>
                        <h4>${project.address}</h4>
                    </div>
                    <div class="content">
                        <p>${project.content}</p>
                    </div>
                    <div class="design">
                        <h4>设计师</h4>
                        <c:forEach var="teamMembera" items="${teamMembercollection}">
                          <c:set var="teamMember" value="${teamMembera.teamMember}"></c:set>
                          <div class="col-sm-4 design-pic">
                            <a href="${pageContext.request.contextPath }/client/teams/${teamMember.navMenuId}/teamMembers/${teamMember.id}">
                            <img src="${pageContext.request.contextPath }/${teamMember.imgUrl}" alt="pic" class="img-responsive">
                            <p>${teamMember.name}</p><p>${teamMember.goodAt}</p></a>
                          </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-sm-12 col-lg-4">
                   <ul class="nav more-case">
                       <li><a href="<%=baseUrl%>/client/projects">更多案例</a></li>
                       <c:forEach var="item" items="${collection}">
                         <c:set var="project" value="${item.project}"></c:set>
                         <c:set var="imageUrl" value="${item.images[0].imgUrl}"></c:set>
                         <li class="clearfix">
                           <div class="col-xs-5 case-pic">
                             <a href="<%=baseUrl%>/client/projects/${project.id}">
                               <img src="${pageContext.request.contextPath }/${imageUrl}" alt="pic" class="img-responsive">
                             </div>
                             <div class="col-xs-7 case-text" style="font-size: 12px;"><a href="<%=baseUrl%>/client/projects/${project.id}">${project.zhName}</a></div>
                         </li>
                       </c:forEach>
                   </ul>
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