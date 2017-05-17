<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String baseUrl = request.getContextPath();
%>

<form action="${param.actionUrl}" method="POST" class="form-horizontal">
	<c:if test="${param.method=='PATCH'}">
		<!-- <input name="_method" value="PATCH" type="hidden"> -->
		<input type="hidden" name="id" value="${dashborad.id}">
		<input type="hidden" name="backUrl" value="${param.backUrl }">
	</c:if>

	<div class="form-group">
		<label class="control-label col-md-3">气瓶类型</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="type"
				value="${dashborad.type}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">充装介质</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="media"
				value="${dashborad.media}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">容积</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="volume"
				value="${dashborad.volume}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">压力</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="workingpressure"
				value="${dashborad.workingpressure}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">充装温度</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="tempeature"
				value="${dashborad.tempeature}">
		</div>
	</div>

    <div class="form-group">
		<label class="control-label col-md-3">检验人</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="examiner"
				value="${dashborad.examiner}">
		</div>
	</div>

	<div class="form-group">
		<label for="exampleInputEmail1" class="col-md-3 text-right">时间</label>
		<div class="col-md-3">
			<div class='input-group date' id='datetimepicker9'>
				<input type='text' class="form-control"
					style="height: 35px; width: 490px" name="date"
					value="${dashborad.date}" /> <span class="input-group-addon">
					<span class="glyphicon glyphicon-calendar"></span>
				</span>
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">GPS监控</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="GPS"
				value="${dashborad.GPS}">
		</div>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-md-4 col-md-offset-5">
				<button type="submit" class="btn btn-info">提交</button>
			</div>
		</div>
	</div>
</form>
