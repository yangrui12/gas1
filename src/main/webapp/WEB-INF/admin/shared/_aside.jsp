<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<%
	String baseUrl = request.getContextPath();
%>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<div class="user-panel">
			<div class="pull-left image">
				<img
					src="<%=baseUrl%>/static/lib/bower_components/AdminLTE/dist/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>${sessionScope.name}</p>
				<!-- Status -->
				<c:choose>
					<c:when test="${pageContext.response.locale=='zh_CN'}">
						<a
							href="${pageContext.request.contextPath}/admin/dashborad?lang=en_US">
							切换为${pageContext.response.locale=='zh_CN'?'英语版':'中文版本'} </a>
					</c:when>
					<c:when test="${pageContext.response.locale=='en_US'}">
						<a
							href="${pageContext.request.contextPath}/admin/dashborad?lang=zh_CN">
							切换为${pageContext.response.locale=='zh_CN'?'英语版':'中文版本'} </a>
					</c:when>
				</c:choose>
				<i class="fa fa-circle text-success"></i>

			</div>
		</div>

		<!-- search form (Optional) -->
		<form action="#" method="get" class="sidebar-form hidden">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<c:set var="currentUrl" value="${pageContext.request.requestURL }" />
		<!-- Sidebar Menu -->
		<ul class="sidebar-menu">
			<li
				<c:if test="${fn:contains(currentUrl, 'homepage')}">class="active"</c:if>>
				<a href="<%=baseUrl%>/admin/homepage"> <i class="fa fa-bars"
					aria-hidden="true"></i> <span>首页</span>
			</a>
			</li>

			<%-- <li
				<c:if test="${fn:contains(currentUrl, 'banners')}">class="active"</c:if>>
				<a href="<%=baseUrl%>/admin/banners"> <i class="fa fa-bars"
					aria-hidden="true"></i> <span>生产</span>
			</a>
			</li>
			<li class="hidden"><a href="<%=baseUrl%>/admin/navMenus"><i
					class="fa fa-bars" aria-hidden="true"></i><span>二级导航</span></a></li>
			<li
				<c:if test="${fn:contains(currentUrl, 'projectCases')||fn:contains(currentUrl, 'projects')}">class="active"</c:if>>
				<a href="<%=baseUrl%>/admin/projectCases"> <i
					class="fa fa-line-chart" aria-hidden="true"></i> <span>检验</span>
			</a>
			</li>
			<li
				<c:if test="${fn:contains(currentUrl, 'teams')||fn:contains(currentUrl, 'teamMembers')}">class="active"</c:if>>
				<a href="<%=baseUrl%>/admin/teams"><i class="fa fa-users"
					aria-hidden="true"></i> <span>加气</span> </a>
			</li>
			<li
				<c:if test="${fn:contains(currentUrl, 'news')}">class="active"</c:if>>
				<a href="<%=baseUrl%>/admin/newsCategories"> <i
					class="fa fa-newspaper-o" aria-hidden="true"></i> <span>监管</span>
			</a>
			</li>

			<li
				<c:if test="${fn:contains(currentUrl, 'distribution')}">class="active"</c:if>>
				<a href="<%=baseUrl%>/admin/distribution"> <i
					class="fa fa-newspaper-o" aria-hidden="true"></i> <span>配送管理</span>
			</a>
			</li> --%>


			<c:if test="${fn:contains(currentUrl, 'banners')==true}">
				<li class="treeview active">
			</c:if>
			<c:if test="${fn:contains(currentUrl, 'banners') == false}">
				<li class="treeview">
			</c:if>
			<a href="#"><i class="fa fa-folder"></i><span>常用功能</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span> </a>
			<ul class="treeview-menu">
				<li
					<c:if test="${fn:contains(currentUrl, 'banners')}">class="active"</c:if>><a
					href="<%=baseUrl%>/admin/gastype"><span>气种管理</span></a></li>
				<li><a href="<%=baseUrl%>/admin/statistics"><span>生产统计</span></a></li>
				<li><a href="<%=baseUrl%>/admin/filling"><span>充装管理</span></a></li>
				<li><a href="<%=baseUrl%>/admin/storage"><span>仓储管理</span></a></li>
				<li><a href="<%=baseUrl%>/admin/distribution"><span>配送管理</span></a></li>
				<li><a href="<%=baseUrl%>/admin/alarm"><span>报警气瓶</span></a></li>
			</ul>



			<li
				<c:if test="${fn:contains(currentUrl, 'customers')}">class="active"</c:if>>
				<a href="<%=baseUrl%>/admin/customers"> <i class="fa fa-user"
					aria-hidden="true"></i> <span>客户管理</span>
			</a>
			</li>

			<shiro:hasAnyRoles name="管理员,监管人员">
				<!-- Optionally, you can add icons to the links -->
				<li
					<c:if test="${fn:contains(currentUrl, 'users')}">class="active"</c:if>>
					<a href="<%=baseUrl%>/admin/users"> <i class="fa fa-male"
						aria-hidden="true"></i> <span>员工管理</span>
				</a>
				</li>
			</shiro:hasAnyRoles>


			<c:if test="${fn:contains(currentUrl, 'banners')==true}">
				<li class="treeview active">
			</c:if>
			<c:if test="${fn:contains(currentUrl, 'banners') == false}">
				<li class="treeview">
			</c:if>
			<a href="#"><i class="fa fa-bars"></i><span>气瓶管理</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span> </a>
			<ul class="treeview-menu">
				<li
					<c:if test="${fn:contains(currentUrl, 'banners')}">class="active"</c:if>><a
					href="<%=baseUrl%>/admin/banners"><span>气瓶生产</span></a></li>
				<li><a href="<%=baseUrl%>/admin/dashborad"><span>气瓶检验</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>气瓶出入库</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>订单管理</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>报废处理</span></a></li>
			</ul>



			<c:if test="${fn:contains(currentUrl, 'historyIntroduce')==true}">
				<li class="treeview active">
			</c:if>
			<c:if test="${fn:contains(currentUrl, 'historyIntroduce') == false}">
				<li class="treeview">
			</c:if>
			<a href="#"><i class="fa fa-bar-chart"></i><span>报表管理</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span> </a>
			<ul class="treeview-menu">
				<li
					<c:if test="${fn:contains(currentUrl, 'historyIntroduce')}">class="active"</c:if>><a
					href="<%=baseUrl%>/admin/aboutUs/historyIntroduce"><span>生产汇总表</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>销售汇总表</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>占用瓶明细表</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>进出记录表</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>气瓶处理记录</span></a></li>
			</ul>


			<c:if test="${fn:contains(currentUrl, 'historyIntroduce')==true}">
				<li class="treeview active">
			</c:if>
			<c:if test="${fn:contains(currentUrl, 'historyIntroduce') == false}">
				<li class="treeview">
			</c:if>
			<a href="#"><i class="fa fa-tags"></i><span>系统管理</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span> </a>
			<ul class="treeview-menu">
				<li
					<c:if test="${fn:contains(currentUrl, 'historyIntroduce')}">class="active"</c:if>><a
					href="<%=baseUrl%>/admin/aboutUs/historyIntroduce"><span>系统设置</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>权限设置</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>气种权限设置</span></a></li>
				<li><a href="<%=baseUrl%>/admin/projects"><span>修改密码</span></a></li>
			</ul>

			<%-- <li
				<c:if test="${fn:contains(currentUrl, 'jobs')}">class="active"</c:if>><a
				href="<%=baseUrl%>/admin/jobs"><i class="fa fa-search"
					aria-hidden="true"></i><span>招聘信息</span></a></li>
			<li
				<c:if test="${fn:contains(currentUrl, 'historyIntroduce')||fn:contains(currentUrl, 'cooperations')}">class="active"</c:if>><a
				href="<%=baseUrl%>/admin/aboutUs/historyIntroduce"><i
					class="fa fa-link"></i><span>公司基本信息</span></a></li> --%>





			<!-- <c:if test="${fn:contains(currentUrl, 'historyIntroduce')==true}">
        <li class="treeview active">
      </c:if>
      <c:if test="${fn:contains(currentUrl, 'historyIntroduce') == false}">
        <li class="treeview">
      </c:if>
        <a href="#"><i class="fa fa-link"></i><span>关于AUD</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li <c:if test="${fn:contains(currentUrl, 'historyIntroduce')}">class="active"</c:if>><a href="<%=baseUrl%>/admin/aboutUs/historyIntroduce"><span>公司历史介绍</span></a></li>
          <li><a href="<%=baseUrl%>/admin/projects"><span>公司服务范围</span></a></li>
          <li><a href="<%=baseUrl%>/admin/projects"><span>留言管理</span></a></li>
        </ul>
      </li> -->
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>