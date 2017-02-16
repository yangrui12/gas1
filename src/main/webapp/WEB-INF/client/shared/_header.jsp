<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String baseUrl = request.getContextPath();
%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<header>
  <div class="container">
    <nav class="navbar navbar-default nav_one" role="navigation">
      <div class="navbar-header">
        <a class="navbar-brand" href="<%=baseUrl%>/sites"><img alt="Brand" src="<%=baseUrl%>/static/common/client/images/sites/pic1_02.png"></a>
      </div>
      <div class=" Main-me">
        <div class="dropdown-toggle" data-toggle="dropdown">Main-me</div>
        <ul class="dropdown-menu" role="menu">
          <li><spring:message code="projects" /></li>
          <c:forEach var="projectNavMenu" items="${projectNavMenus}">
            <li>--${projectNavMenu.secondNavMenu.name}</li>
            <c:forEach var="thridNavMenu" items="${projectNavMenu.thridNavMenu }">
              <li><a href="<%=baseUrl%>/client/projects/${thridNavMenu.id}">--${thridNavMenu.zhName}</a></li>
            </c:forEach>
          </c:forEach>

          <li><spring:message code="teams" /></li>
          <c:forEach var="team" items="${teams}">
            <li><a href="${pageContext.request.contextPath}/client/teams/${team.id}/teamMembers" class="second-nav">${team.name}</a></li>
          </c:forEach>
          <li><spring:message code="news" /></li>
          <c:forEach var="newsNavMenu" items="${newsNavMenus}">
        	<li><a href="<%=baseUrl%>/client/newsCategories/${newsNavMenu.id}" class="second-nav">${newsNavMenu.name}</a>
          </c:forEach>
          <li><spring:message code="aboutAud" /></li>
          <li><a href="<%=baseUrl%>/client/aboutUs">--<spring:message code="companyIntroduce" /></a></li>
          <li><a href="<%=baseUrl%>/client/aboutUs/service">--<spring:message code="companyService" /></a></li>
          <li><a href="<%=baseUrl%>/client/aboutUs/contactUs">--<spring:message code="contactUs" /></a></li>
          <li><a href="<%=baseUrl%>/client/jobs"><spring:message code="jobs" /></a></li>
        </ul>
      </div>
      <div id="topBar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav ul_one">
          <li><a href="<%=baseUrl%>/client/projects"><span data-tag="0"><spring:message code="projects" /></span></a></li>
          <li><a href="<%=baseUrl%>/client/teams"><span data-tag="1"><spring:message code="teams" /></span></a></li>
          <li><a href="<%=baseUrl%>/client/newsCategories/${newsNavMenus[0].id}"><span data-tag="2"><spring:message code="news" /></span></a></li>
          <li><a href="<%=baseUrl%>/client/aboutUs"><span data-tag="3"><spring:message code="aboutAud" /></span></a></li>
          <li><a href="<%=baseUrl%>/client/jobs"><span data-tag="4"><spring:message code="jobs" /></span></a></li>
        </ul>
      </div>
      <div class="btn-group change-language">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle btn-language" data-toggle="dropdown">
           ${pageContext.response.locale=='zh_CN'?'简体中文':'English'}
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
          <li><a href="${pageContext.request.contextPath}/sites?lang=zh_CN">简体中文</a></li>
          <li><a href="${pageContext.request.contextPath}/sites?lang=en_US">English</a></li>
        </ul>
      </div>
    </nav>

    <nav class="navbar navbar-default nav_two" role="navigation">
      <div class="navbar-header">
        <a class="navbar-brand" href="<%=baseUrl%>/client"> <img width="112px" alt="Brand" src="<%=baseUrl%>/static/common/client/images/sites/pic2_03.png">
        </a>
      </div>
      <ul class="nav navbar-nav ul_two" data-tag="1">
        <c:forEach var="projectNavMenu" items="${projectNavMenus}">
          <li><a href="<%=baseUrl%>/client/projectCases/${projectNavMenu.secondNavMenu.id}" class="second-nav">${projectNavMenu.secondNavMenu.name}</a>
            <ul class="nav ul-three">
              <c:forEach var="thridNavMenu" items="${projectNavMenu.thridNavMenu }">
                <li><a href="<%=baseUrl%>/client/projects/${thridNavMenu.id}">${thridNavMenu.zhName}</a></li>
              </c:forEach>
            </ul></li>
        </c:forEach>
      </ul>
      <ul class="nav navbar-nav ul_two" data-tag="2">
        <c:forEach var="teamsNavMenus" items="${teamsNavMenus}">
        	<li><a href="<%=baseUrl%>/client/teams/${teamsNavMenus.id}" class="second-nav">${teamsNavMenus.name}</a>
        </c:forEach>
      </ul>
      <ul class="nav navbar-nav ul_two" data-tag="3">
        <c:forEach var="newsNavMenu" items="${newsNavMenus}">
        	<li><a href="<%=baseUrl%>/client/newsCategories/${newsNavMenu.id}" class="second-nav">${newsNavMenu.name}</a>
        </c:forEach>
      </ul>
      <ul class="nav navbar-nav ul_two" data-tag="4">
        <li><a href="<%=baseUrl%>/client/aboutUs" class="second-nav"><spring:message code="companyIntroduce" /></a></li>
        <li><a href="<%=baseUrl%>/client/aboutUs/service" class="second-nav"><spring:message code="companyService" /></a></li>
        <li><a href="<%=baseUrl%>/client/aboutUs/contactUs" class="second-nav"><spring:message code="contactUs" /></a></li>
      </ul>
      <form class="search-form">
        <div class="search-input clearfix">
          <label class="pull-right"><span class="glyphicon glyphicon-search"></span></label> <input type="text" class="form-control pull-right" id="inputText">
        </div>
      </form>
    </nav>
  </div>
</header>