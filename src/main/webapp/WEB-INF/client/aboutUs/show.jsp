<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String baseUrl = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=baseUrl%>/static/lib/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/shared_show.css">
<link rel="stylesheet" href="<%=baseUrl%>/static/common/client/css/company-introduce.css">
<title>公司介绍</title>
</head>
<body>
<jsp:include page="../shared/_header.jsp"></jsp:include>
<div class="main container">
        <section class="part-one">
            <img src="${pageContext.request.contextPath}/${historyIntroduce.headImg}" alt="pic" class="img-responsive">
        </section>
        <section class="part-two">
            <div class="comany-introduce-content">
                <h3>公司历程</h3>
                <p>${historyIntroduce.companyHistory}</p>
            </div>
            <div class="vedio">
                <h3>宣传视频</h3>
                <embed src='${historyIntroduce.video}' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>
            </div>
            <div class="row">
                <h3 class="col-sm-12">合作伙伴</h3>
                <c:forEach var="cooperation" items="${cooperations}">
                  <div class="col-sm-3 icon">
                    <a href="${cooperation.link}">
                      <img src="${pageContext.request.contextPath}/${cooperation.logoUrl}" alt="合作伙伴logo" class="img-responsive">
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