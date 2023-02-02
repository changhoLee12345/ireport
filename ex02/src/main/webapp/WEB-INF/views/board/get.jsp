<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Get</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Get</div>
			<div class="panel-body">
				<button data-oper="modify" class="btn btn-default">Modify</button>
				<button data-oper="list" class="btn btn-info">List</button>
				<form id="openForm" action="../board/modify" role="form" method="get">
					<input type="hidden" name="bno" id="bno" value='<c:out value="${board.board_No}" />'>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function () {
		var openForm = $('#openForm');
		$('button[data-oper="modify"]').on('click', function (e) {
			openForm.attr('action', '../board/modify').submit();
		})

		$('button[data-oper="list"]').on('click', function (e) {
			openForm.find('#bno').remove();
			openForm.attr('action', '../board/list');
			openForm.submit();
		})
	})
</script>
<%@ include file="../includes/footer.jsp" %>