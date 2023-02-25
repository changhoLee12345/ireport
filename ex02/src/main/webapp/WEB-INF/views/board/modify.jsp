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
						<textarea class="form-control" rows="3"
							name="content"><c:out value="${board.content }" /></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label><input class="form-control" name="writer" value="${board.writer }"
							readonly>
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

<!-- 첨부파일. -->
<div class="bigPictureWrapper">
	<div class="bigPicture">

	</div>
</div>

<style>
	.uploadResult {
		width: 100%;
		background-color: gray;
	}

	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}

	.uploadResult ul li {
		list-style: none;
		padding: 10px;

	}

	.uploadResult ul li img {
		width: 100px;
	}

	.uploadResult ul li span {
		color: white;
	}

	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255, 255, 255, 0.5)
	}

	.bigPicture {
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.bigPicture img {
		width: 600px;
	}
</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Files</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple="multiple">
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function () {

		(function () {
			var bno = '<c:out value="${board.bno}" />';

			$.getJSON('/board/getAttachList', {
				bno: bno
			}, function (arr) {
				console.log(arr);
				var str = '';
				$(arr).each(function (i, attach) {
					if (attach.fileType) {
						var fileCallPath = encodeURIComponent(attach.uploadPath + '/s_' +
							attach.uuid + '_' + attach.fileName);

						str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + //
							attach.uuid + "' data-filename='" + attach.fileName + //
							"' data-type='" + attach.fileType + "'><div>";
						str += "<button type='button' data-file='" + fileCallPath +
							"' data-type='image' class='btn btn-warning btn-circle' ><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName=" + fileCallPath + "'>";
						str += "</div>";
						str += "</li>";

					} else {

						str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + //
							attach.uuid + "' data-filename='" + attach.fileName + //
							"' data-type='" + attach.fileType + "'><div>";
						str += "<span>" + attach.fileName + "</span><br>";
						str += "<button type='button' data-file='" + fileCallPath +
							"' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<a><img src='/resources/img/attach.png'></a>";
						str += "</div></li>";

					}
				})
				$('.uploadResult ul').html(str);
			})
		})();

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
			} else if (operation == 'modify') {
				var str = '';
				$('.uploadResult ul li').each(function (i, obj) {
					var jobj = $(obj);

					str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data('filename') + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data('uuid') + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data('path') + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data('type') + "'>";
				})
			}
			formObj.submit();
		})

		$('.uploadResult').on('click', 'button', function (e) {
			if (confirm('remove this file?')) {
				var targetLi = $(this).closest('li');
				targetLi.remove();
			}
		})
	})
</script>
<jsp:include page="../includes/footer.jsp"></jsp:include>