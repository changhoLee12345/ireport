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
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
			</div>

			<div class="panel-body">
				<button data-oper="modify" class="btn btn-default">Modify</button>
				<button data-oper="list" class="btn btn-info">List</button>
				<form id="openForm" action="../board/modify" role="form" method="get">
					<input type="hidden" name="bno" id="bno" value='<c:out value="${board.bno}" />'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
					<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
				</form>
			</div>

			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2018-01-01 13:13</small>
							</div>
							<p>Good job!</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">ReplyModal</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="">Reply</label>
					<input type="text" class="form-control" name="reply" value="New Reply!!!">
				</div>
				<div class="form-group">
					<label for="">Replyer</label>
					<input type="text" class="form-control" name="replyer" value="user01">
				</div>
				<div class="form-group">
					<label for="">Reply Date</label>
					<input type="text" class="form-control" name="replyDate" value="New Reply!!!">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" class="btn btn-warning">Modify</button>
				<button id="modalRemoveBtn" class="btn btn-danger">Remove</button>
				<button id="modalCloseBtn" class="btn btn-default" data-dismiss="modal">Close</button>
				<button id="modalClassBtn" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="../resources/js/reply.js"></script>
<script>
	console.log("==================")
	var bnoValue = '<c:out value="${board.bno}" />';
	// 추가기능 테스트.
	// replyService.add({reply:"JS Test", replyer: "tester", bno: bnoValue}, 
	// 		function (result) { alert("RESULT: " + result); });

	// 댓글조회 테스트.
	// replyService.getList({
	// 	bno: bnoValue,
	// 	page: 1
	// }, function (list) {
	// 	for (var i = 0, len = list.length || 0; i < len; i++) {
	// 		console.log(list[i])
	// 	}
	// })

	// replyService.remove(23, function (count) {
	// 	console.log(count)

	// 	if (count == 'success') {
	// 		alert('REMOVED')
	// 	}
	// }, function (err) {
	// 	alert('ERROR')
	// })

	// replyService.update({
	// 	rno: 22,
	// 	bno: bnoValue,
	// 	reply: 'Modify reply',
	// }, function (result) {
	// 	alert('modfi done')
	// })

	// replyService.get(22, function (data) {
	// 	console.log(data)
	// })

	$(document).ready(function () {

		var replyUL = $('.chat');
		showList(1);

		function showList(page) {
			replyService.getList({
				bno: bnoValue,
				page: page || 1
			}, function (list) {
				var str = '';
				if (list == null || list.length == 0) {
					replyUL.html('')
					return;
				}
				for (var i = 0, len = list.length || 0; i < len; i++) {
					str += '<li class="left clearfix" data-rno="' + list[i].rno + '">';
					str += ' <div><div class="header"><strong class="primary-font">' + list[i].replyer +
						'</strong>';
					str += ' <small class="pull-right text-muted">' + replyService.displayTime(list[i]
						.replyDate) + '</small></div>';
					str += '  <p>' + list[i].reply + '</p></div></li>';
				}
				replyUL.html(str);
			})
		}

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