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
				<form action="../board/register" role="form" method="post">
					<div class="form-group">
						<label>Title</label><input type="text" name="title" class="form-control" value="test">
					</div>
					<div class="form-group">
						<label>TextArea</label>
						<textarea class="form-control" name="content" id="" cols="30" rows="3">testtest</textarea>
					</div>
					<div class="form-group">
						<label>Writer</label><input type="text" class="form-control" name="writer" value="user1">
					</div>
					<button type="submit" class="btn btn-primary">Submit Button</button>
					<button type="reset" class="btn btn-warning">Reset Button</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>