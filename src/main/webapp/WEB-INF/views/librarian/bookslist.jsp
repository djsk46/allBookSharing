<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>

<!-- 데이터 테이블 체크박스 -->
<link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
<script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

<!-- 데이터 테이블 select -->
<link type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
<link type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" rel="stylesheet" />
<script
	src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
</head>
<body>
<div class="container p-3 my-3 border">
	<table id="example" class="display" style="width:100%">
	<thead>
		<tr>
					<th></th>
					<th>대분류</th>
					<th>소분류</th>
					<th>ISBN 코드</th>
					<th>책 제목</th>
					<th>저자</th>
					<th>소유 권수</th>
					<th>대출 권수</th>

		</tr>
	</thead>
	
</table>
</div>
<script type="text/javascript" src="js/ajaxCsrf.js"></script>
<script type="text/javascript">
	

	// select style 종류: `none`, `single`, `multi` or `os`
	var example_tbl = null
	$(function() {
		example_tbl = $('#example').DataTable({
			ajax: {
				url: "libraybooklist",
				dataSrc: ""
			},
			'columnDefs': [
		        {
		        	orderable: false,
		           'targets': 0,
		            className: 'select-checkbox',
		            "defaultContent": ""
		        	
		        },
		        { 'data': 'bk_bg_num' , 'targets': 1}, //대분류
		        { 'data': 'bk_sg_num', 'targets': 2}, //소분류
		        { 'data': 'bk_code', 'targets': 3  }, // ISBN 코드
		        { 'data': 'bk_name', 'targets': 4  }, //책 제목 
		        { 'data': 'bk_writer', 'targets': 5}, //저자
		        { 'data': 'bk_Quantity', 'targets': 6}, //소유 권수
		        { 'data': 'bk_booklend', 'targets': 7} //대출중인 권수
		     ],
		     'select': {
		        'style': 'multi'
		     },
		     'order': [[1, 'asc']],
		     dom: 'Bfrtip',

		     buttons: [
		         {
		             text: '삭제',
		             action: function ( e, dt, node, config ) {
		            	 
		            	 var conf=confirm("삭제 하시겠습니까?");
		            	 if(conf){
		            		 
		            	 
		            	 var rowData=$('#example').DataTable().rows('.selected').data();
		            	 var bookList=new Array;
		            	 
		            	 
		            	 for(var i=0;i<rowData.length;i++){
		            		 let books={};
		            		 books.bk_code=rowData[i].bk_code;
		            		 books.bk_lcode=rowData[i].bk_lcode;
		            		 bookList.push(books);
		            	 }
		            	 var json=JSON.stringify(bookList); //선택한 책의 ISBN 코드와 도서관 코드 JSON화
		            			            	 
		            	  $.ajax({ 
		            			url : "libraybookdelete",
		            			type : "post",
		            			contentType: 'application/json',
		            			data : json,
		            			dataType:'text',
		            	}).done((result) => {
		            		console.log("result=",result);
		            		location.reload();
		            	}).fail((xhr) => {
		            		console.log("xhr=",xhr);
		            	}); //ajax End  
		            	
		            	 }// confirm End
		            
		             }
		         }
		     ],

		});

	});

</script>
</body>

</html>