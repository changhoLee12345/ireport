<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Register</h1>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Board Register</div>
            <div class="panel-body">

                <form role="form" action="../board/modify" method="post">
                    <div class="form-group">
                        <label>Bno</label>
                        <input type="text" class="form-control" name="board_No"
                            value='<c:out value="${board.board_No}" />' readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" class="form-control" name="title" value='<c:out value="${board.title}" />'>
                    </div>
                    <div class="form-group">
                        <label>Text area</label>
                        <textarea class="form-control" name="content"
                            rows="3"><c:out value="${board.content}" /></textarea>
                    </div>
                    <div class="form-group">
                        <label>Writer</label>
                        <input type="text" class="form-control" name="writer" value='<c:out value="${board.writer}" />'
                            readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label>Regdate</label>
                        <input type="text" class="form-group" name="write_Date"
                            value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.write_Date}" />'
                            readonly="readonly">
                    </div>

                    <button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
                    <button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
                    <button type="submit" data-oper="list" class="btn btn-info">List</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var formObj = $('form');

        $('button').on('click', function (e) {
            e.preventDefault();
            var operation = $(this).data("oper");
            console.log(operation);

            if (operation == 'remove') {
                formObj.attr('action', '../board/remove')
            } else if (operation == 'list') {
                // self.location = '../board/list';
                // return;
                formObj.attr('action', '../board/list').attr('method', 'get');
                formObj.empty();
            }
            formObj.submit();
        })
    })
</script>
<%@ include file="../includes/footer.jsp" %>