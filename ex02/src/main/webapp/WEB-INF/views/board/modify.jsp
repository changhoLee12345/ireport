<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../includes/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Modify Page</div>
			<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'>
					<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
					<div class="form-group">
						<label>Bno</label><input class="form-control" name="bno" value="${board.bno }" readonly>
					</div>
					<div class="form-group">
						<label>Title</label><input class="form-control" name="title" value="${board.title }">
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="3" name="content"><c:out value="${board.content }" /></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label><input class="form-control" name="writer" value="${board.writer }" readonly>
					</div>
<!-- 
					<div class="form-group">
						<label>RegDate</label>
						<input type="hidden" class="form-control" name="regdate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" />' readonly>
					</div>
					<div class="form-group">
						<label>updateDate</label>
						<input type="hidden" class="form-control" name="updatedate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }" />' readonly>
					</div>
 -->
					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-default">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function () {
		var formObj = $('form');
		$('button').on('click', function (e) {
			e.preventDefault();
			var operation = $(this).data('oper');

			if (operation == 'remove') {
				formObj.attr('action', '/board/remove');

			} else if (operation == 'list') {
				// self.location = '/board/list';
				// return;
				formObj.attr('action', '/board/list/').attr('method', 'get');
				var pageNum = $('input[name="pageNum"]').clone();
				var amount = $('input[name="amount"]').clone();
				var type = $('input[name="type"]').clone();
				var keyword = $('input[name="keyword"]').clone();

				formObj.empty();
				formObj.append(pageNum);
				formObj.append(amount);
				formObj.append(type);
				formObj.append(keyword);
			}
			formObj.submit();
		})
	})
</script>
<jsp:include page="../includes/footer.jsp"></jsp:include>