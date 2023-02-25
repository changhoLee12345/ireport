/**
 * emp.js
 */


$(function () {
	userList();
	userSelect();
	userDelete();
	userInsert();
	userUpdate();
	init();
});

//초기화
function init() {
	//초기화 버튼 클릭
	$('#btnInit').on('click', function () {
		$('#form1').each(function () {
			this.reset();
		});
	});
} //init

//사용자 삭제 요청
function userDelete() {
	//삭제 버튼 클릭
	$('body').on('click', '#btnDelete', function () {
		var userId = $(this).closest('tr').find('#hidden_userId').val();
		var result = confirm(userId + " 사용자를 정말로 삭제하시겠습니까?");
		if (result) {
			$.ajax({
				url: 'users/' + userId,
				type: 'DELETE',
				contentType: 'application/json;charset=utf-8',
				dataType: 'json',
				error: function (xhr, status, msg) {
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success: function (xhr) {
					console.log(xhr.result);
					userList();
				}
			});
		} //if
	}); //삭제 버튼 클릭
} //userDelete

//사용자 조회 요청
function userSelect() {
	//조회 버튼 클릭
	$('body').on('click', '#btnSelect', function () {
		var userId = $(this).closest('tr').find('#hidden_employeeId').val();
		console.log(userId)
		//특정 사용자 조회
		$.ajax({
			url: '../userFind/' + userId,
			type: 'GET',
			dataType: 'json',
			error: function (xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success: userSelectResult
		});
	}); //조회 버튼 클릭
} //userSelect

//사용자 조회 응답
function userSelectResult(user) {
	console.log(user);
	$('input:text[name="employee_id"]').val(user.employee_id);
	$('input:text[name="name"]').val(user.name);
	$('input:text[name="password"]').val(user.password);
	$('select[name="role"]').val(user.role).attr("selected", "selected");
} //userSelectResult

//사용자 수정 요청
function userUpdate() {
	//수정 버튼 클릭
	$('#btnUpdate').on('click', function () {
		var id = $('input:text[name="id"]').val();
		var name = $('input:text[name="name"]').val();
		var password = $('input:text[name="password"]').val();
		var role = $('select[name="role"]').val();
		$.ajax({
			url: "users",
			type: 'PUT',
			dataType: 'json',
			data: JSON.stringify({
				id: id,
				name: name,
				password: password,
				role: role
			}),
			contentType: 'application/json',
			success: function (data) {
				userList();
			},
			error: function (xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			}
		});
	}); //수정 버튼 클릭
} //userUpdate

//사용자 등록 요청
function userInsert() {
	//등록 버튼 클릭
	$('#btnInsert').on('click', function () {

		var id = $('input:text[name="id"]').val();
		var name = $('input:text[name="name"]').val();
		var passsword = $('input:text[name="password"]').val();
		var role = $('select[name="role"]').val();
		$.ajax({
			url: "users",
			type: 'POST',
			dataType: 'json',
			data: {
				id: id,
				name: name,
				password: password,
				role: role
			},
			success: function (response) {
				if (response.result == true) {
					userList();
				}
			},
			error: function (xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			}
		});
	}); //등록 버튼 클릭
} //userInsert


function userInsert2() {
	//등록 버튼 클릭
	$('#btnInsert').on('click', function () {
		var id = $('input:text[name="id"]').val();
		var name = $('input:text[name="name"]').val();
		var passsword = $('input:text[name="password"]').val();
		var role = $('select[name="role"]').val();
		$.ajax({
			url: "users",
			type: 'POST',
			dataType: 'json',
			data: {
				id: id,
				name: name,
				password: password,
				role: role
			},
		}).done(function (response) {
			if (response.result == true) {
				userList();
			}
		}).fail(function (xhr, status, message) {
			alert(" status: " + status + " er:" + message);
		});
	}); //등록 버튼 클릭
} //userInsert

//사용자 목록 조회 요청
function userList() {
	$.ajax({
		url: '/ireport/empSelect',
		type: 'GET',
		dataType: 'json',
		error: function (xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success: userListResult
	});
} //userList

//사용자 목록 조회 응답
function userListResult(data) {
	$("tbody").empty();
	$.each(data, function (idx, item) {
		$('<tr>')
			.append($('<td>').html(item.employee_id))
			.append($('<td>').html(item.first_name + " " + item.last_name))
			.append($('<td>').html(item.job_id))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_employeeId\'>').val(item.employee_id))
			.appendTo('tbody');
	}); //each
} //userListResult