<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String baseUrl = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="prePage" value="${pages.prePage==0?1:pages.prePage}"/>
<c:set var="nextPage" value="${pages.nextPage==0? pages.lastPage:pages.nextPage }"/>
<c:set var="pageUrl" value="${param.pageUrl}" />
<c:if test="${pages.total!=0}">
  <nav aria-label="Page navigation">
    <ul class="pagination">
	    <li>
		  <a href="${pageUrl}?pageNo=${prePage}"><span aria-hidden="true">&laquo;</span></a>
		</li>
		<c:forEach var="page" items="${pages.navigatepageNums}">
		  <li <c:if test="${param.pageNo==page||(param.pageNo==null&&page==1)}">class="active"</c:if>>
			<a href="${pageUrl}?pageNo=${page}">${page}</a>
		  </li>
		</c:forEach>
          <li>
            <a href="${pageUrl}?pageNo=${nextPage}"><span aria-hidden="true">&raquo;</span></a>
          </li>
		</ul>
	</nav>
</c:if>