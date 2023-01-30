<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Tables</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">BoardList page
                <button id="regBtn" type="button" class="btn btn-xs pull-right">Board Register</button>
            </div>
            <div class="panel-heading">
                DataTables Advanced Tables
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
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

                <!-- /.table-responsive -->
                <div class="well">
                    <h4>DataTables Usage Information</h4>
                    <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are
                        using a specialized version of DataTables built for Bootstrap 3. We have also
                        customized the table headings to use Font Awesome icons in place of images. For
                        complete documentation on DataTables, visit their website at <a target="_blank"
                            href="https://datatables.net/">https://datatables.net/</a>.</p>
                    <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View
                        DataTables Documentation</a>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
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
<%@ include file="../includes/footer.jsp" %>