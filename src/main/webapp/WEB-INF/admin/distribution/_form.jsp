<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String baseUrl = request.getContextPath();
%>

<form action="${param.actionUrl}" method="POST" class="form-horizontal">
	<c:if test="${param.method=='PATCH'}">
		<!-- <input name="_method" value="PATCH" type="hidden"> -->
		<input type="hidden" name="id" value="${distribution.id}">
		<input type="hidden" name="backUrl" value="${param.backUrl }">
	</c:if>

	<div class="form-group">
		<label class="control-label col-md-3">客户名称</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="name"
				value="${distribution.name}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">车辆号码</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="carcode"
				value="${distribution.carcode}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">司机</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="driver"
				value="${distribution.driver}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">押运</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="dispatcher"
				value="${distribution.dispatcher}">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">调度员</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="transporter"
				value="${distribution.transporter}">
		</div>
	</div>


	<div class="form-group">
		<label for="exampleInputEmail1" class="col-md-3 text-right">配送日期</label>
		<div class="col-md-3">
			<div class='input-group date' id='datetimepicker9'>
				<input type='text' class="form-control"
					style="height: 35px; width: 490px" name="date"
					value="${distribution.date}" /> <span class="input-group-addon">
					<span class="glyphicon glyphicon-calendar"></span>
				</span>
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">备注</label>
		<div class="col-md-6">
			<input type="text" class="form-control" name="note"
				value="${distribution.note}">
		</div>
	</div>

	<div class="form-group">
		
			<label class="control-label col-md-3">二维码</label>
			<div id="code"></div>
		
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-md-4 col-md-offset-5">
				<button type="submit" class="btn btn-info">提交</button>
			</div>
		</div>
	</div>
</form>
