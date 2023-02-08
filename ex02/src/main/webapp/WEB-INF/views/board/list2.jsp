<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header2.jsp" %>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
            href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="panel-heading">BoardList page
                <button id="regBtn" type="button" class="btn btn-xs pull-right">Board Register</button>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>수정일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="board" items="${list }">
                            <tr>
                                <td>
                                    <c:out value="${board.board_No }" />
                                </td>
                                <td>
                                    <c:out value="${board.title }" />
                                </td>
                                <td>
                                    <c:out value="${board.writer }" />
                                </td>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${board.write_Date }" />
                                </td>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${board.write_Date }" />
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Modal 창. -->
                <div class="modal fade" id="myModal" tabIndex="-1" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">처리가 완료되었습니다.</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-warning">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<script>
    $(document).ready(function () {
        var result = '<c:out value="${result }"/>';
        console.log('result=> ', result);

        checkModal(result);

        function checkModal(result) {
            if (result == '')
                return;

            if (parseInt(result) > 0) {
                $('.modal-body').html('게시글 ' + parseInt(result) + ' 번이 등록되었습니다.')
            }
            $('#myModal').modal('show');
        }

        $('#regBtn').on('click', function () {
            self.location = '../board/register';
        })
    })
</script>
<%@include file="../includes/footer2.jsp" %>