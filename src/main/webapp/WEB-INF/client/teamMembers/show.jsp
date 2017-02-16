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
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/designer-detail.css">
<title>设计团队</title>
</head>
<body>
    <jsp:include page="../shared/_header.jsp"></jsp:include>
    <div class="main container">
        <section class="part-one">
            <div class="row">
                <div class="col-sm-12 col-lg-8 designer-desc">
                    <div class="col-sm-7">
                        <img src="${pageContext.request.contextPath}/${teamMember.imgUrl}" alt="pic" class="img-responsive">
                    </div>
                    <div class="col-sm-5 designer-detail">
                        <h3>${teamMember.name}</h3>
                        <h4>${teamMember.honor}</h4>
                        <p>${teamMember.position}</p>
                        <p>${teamMember.zhAddress}</p>
                        <p>${teamMember.phoneNumber}</p>
                        <p><a href="${pageContext.request.contextPath}/${teamMember.card}">download vCard</a></p>
                    </div>
                    <div class="content col-sm-12">
                        <p>${teamMember.brief}</p>
                    </div>
                </div>

                <div class="col-sm-12 col-lg-4">
                    <ul class="nav more-case">
                        <li><a href="${pageContext.request.contextPath}/client/teams/${teamMember.navMenuId}/teamMembers">更多</a></li>
                        <c:forEach var="teamMember" items="${teamMembers}">
                          <li class="clearfix">
                            <div class="col-xs-5 case-pic">
                              <a href="${pageContext.request.contextPath}/client/teams/${teamMember.navMenuId}/teamMembers/${teamMember.id}"><img src="${pageContext.request.contextPath}/${teamMember.imgUrl}" alt="pic" class="img-responsive"></a>
                            </div>
                            <div class="col-xs-7 case-text">
                              <a href="${pageContext.request.contextPath}/client/teams/${teamMember.navMenuId}/teamMembers/${teamMember.id}"><p>${teamMember.name}</p><p>${teamMember.goodAt}</p></a>
                            </div>
                          </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </section>
        <section class="part-two">
            <div class="row all-case">
                <div class="col-sm-12"><span>参与设计案例</span></div>
                <c:forEach var="project" items="${projects}">
                  <div class="col-sm-3">
                    <a href="${pageContext.request.contextPath}/client/projects/${project.project.id}">
                      <img src="${pageContext.request.contextPath}/${project.project.imgUrls}" alt="pic" class="img-responsive">
                      <p>${project.project.zhName}</p>
                    </a>
                  </div>
                </c:forEach>
            </div>
        </section>
    </div>
    <jsp:include page="../shared/_footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=baseUrl%>/static/common/client/js/sites_show.js"></script>
</html>