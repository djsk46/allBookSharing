<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
 
<style>

.table_box {
	padding: 10px;
	margin: 10px;
	width: 100px;
}

#myProfile {
	float: left;
	margin-right: 250px;
}

#myProfile_rest {
	margin-bottom: 300px;
	
}

#topDiv {

	margin-bottom: 100px;
}

#wishList{
all:unset;
font-weight: bold;
color: #007bff;
}

#readingRoom{
all:unset;
font-weight: bold;
color: #007bff;
}
#btn{
 padding-bottom: 5px;
 padding-top: 5px;
 font-size: 16px;
}
#btn2{
 padding-bottom: 5px;
 padding-top: 5px;
 font-size: 16px;
}
#table_rest{
width: 400px;
}
.container{
	margin-top: 50px;
}
</style>




</head>


<body>
 <jsp:include page="header.jsp" />

	<div class="container">
		<div id='topDiv'>

			<div id="myProfile">
			<form action="modifyprofile" method="post">
				<table class="table table-striped" >
					<tr>
						<td>아이디 : </td>
						<td>${mb.mb_id}</td>
						<td rowspan="6">
						<img src="/img/profile/${mb.us_image}" width="150" height="220" alt="프로필 사진" />						
						</td>
					</tr>
					<tr>
						<td>이름 : </td>
						<td>${mb.mb_name }</td>
					</tr>
					<tr>
						<td>핸드폰 : </td>
						<td>${mb.us_phone }</td>
					</tr>
					<tr>
						<td>이메일 : </td>
						<td>${mb.us_email }</td>
					</tr>
					<tr>
						<td>내지역 : </td>
						<td>${mb.mb_area }</td>
					</tr>
					<tr>
						<td>내등급 : </td>
						<td>${mb.us_grade }</td>
					</tr>
					<tr>
						<td>포인트 : </td>
						<td><a href=pointlist>${mb.us_point} point</a></td>
						<td><a href=./insertpoint >포인트 충전 바로가기</a></td>
					</tr>
					
					
					
				</table>
				<input id='btn' type="submit" value="개인정보 변경"/>
				<input id='btn2' type="submit" value="회원탈퇴" formaction="./memberdrop?${_csrf.parameterName}=${_csrf.token}"/>
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			</form>
			</div>

			<div id="myProfile_rest" style="height:300px;">
				<table id="table_rest" class="table table-striped" style="width:446px;">
					<tr>
						<td class="table_box">대출건수 <span id="borrowCnt"></span>회</td>
						<td class="table_box">연체건수 <span id="arrearsCnt"></span>회</td>
					</tr>
					<tr>
						<td class="table_box">독서횟수 <span id="reviewCnt"></span>회</td>
						<td class="table_box">누적연체일수 <span id="arrearsDay"></span>일</td>
					</tr>
					<tr>
						<td class="table_box" style="cursor: pointer;"><a id="wishList" href="showwishlist">찜목록</a></td>
						<td class="table_box" style="cursor: pointer;"><a id="readingRoom" href="">열람실 예약좌석보기</a></td>
					</tr>
				</table>
				
        
                <div class="card">
                
                    <canvas id="myChart1"></canvas> 
                    
                    <div class="card-footer text-center text-dark">
                        <h3>대출차트</h3>
                    </div>
                </div>
           
    
			</div>
		</div>
  <!-- 부트스트랩 -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> <!-- 차트 -->

		<div class="container">
			<h3>대출현황</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 200px;">대출일</td>
					<td style="width: 200px;">반납예정일</td>
					<td style="width: 50px;">연장</td>
				</tr>
				</thead>
				
				<tbody id="borrow">
				</tbody>
			</table>
		</div>
		
		<div class="container">
			<h3>연체목록</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 200px;">대출일</td>
					<td style="width: 200px;">반납예정일</td>
					<td style="width: 200px;">반납일</td>
					<td style="width: 50px;">연체일수</td>
				</tr>
				</thead>
				
				<tbody id='arrears'>
				
				</tbody>
			</table>
		</div>
		
		<div class="container">
			<h3>현재 예약 목록</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 80px;">예약번호</td>
					<td style="width: 180px;">도서관 이름</td>
					<td style="width: 180px;">자료명</td>
					<td style="width: 150px;">예약일자</td>
					<td style="width: 100px;">상태</td>
					<td style="width: 50px;">장바구니</td>
					<td style="width: 50px;">순위</td>
					<td style="width: 50px;">취소</td>
				</tr>
				</thead>
				
				<tbody id="reservation">
				</tbody>
			</table>
		</div>
	</div>

<script>



//회원탈퇴 버튼 클릭시 컨펌창
$("#btn2").on("click",function(){
	
	confirm("정말 회원 탈퇴를 하시겠습니까?");
	
});

//대출차트
var dataCnt=new Array();
var dataName=new Array();
$.ajax({
	type : 'get',
	url :"borrowchart",
	async: false,	//true:동기, false:비동기 
	success : function(result) {
       // $('#borrowCnt').html(data).css('color', 'black').css('font-weight','bold');
       console.log("데이타는?",result);
       console.log("데이타는?",result[0].bg_cate);
       for(var i=0;i<result.length;i++){
       console.log("데이타는i?",result[i].cnt);
       dataName[i]=result[i].bg_cate;
       dataCnt[i]=result[i].cnt;
       }
       console.log(dataCnt);
       console.log(dataName);

     },
	error : function(xhr, status) {
     }
   
	
}); //end ajax 


data = {
        datasets: [{
            backgroundColor: [
                'rgba(255,99,13,0.5)',
                'rgba(54,162,235,0.5)',
                'rgba(255,206,86,0.5)',
                'rgba(75,192,192,0.5)',
                'rgba(153,102,255,0.5)',
                'rgba(255,159,64,0.5)',
                'rgba(105,159,13,0.5)',
                'rgba(30,199,13,0.5)',
                'rgba(30,199,123,0.5)',
                'rgba(40,139,50,0.5)',
            ],
            data: dataCnt
        }], 
    labels: dataName //이름
    }; 




// 가운데 구멍이 없는 파이형 차트 
var ctx1 = document.getElementById("myChart1"); var myPieChart = new Chart(ctx1, { type: 'pie', data: data, options: {
    title:{
    display:true,
    text:'장르별 대출 추이'   //차트 제목
}
    
} });


	
//대출건수 조회
$.ajax({
	type : 'get',
	url :"borrowcnt",
	success : function(data) {
        $('#borrowCnt').html(data).css('color', 'black').css('font-weight','bold');

     },
	error : function(xhr, status) {
     }
	
}); //end ajax 



//연체건수 조회
$.ajax({
	type : 'get',
	url :"arrearscnt",
	success : function(data) {
        $('#arrearsCnt').html(data).css('color', 'red').css('font-weight','bold');

     },
	error : function(xhr, status) {
     }
	
}); //end ajax  



//독서횟수(리뷰 쓴 횟수) 조회
$.ajax({
	type : 'get',
	url :"reviewcnt",
	success : function(data) {
        $('#reviewCnt').html(data).css('color', 'black').css('font-weight','bold');

     },
	error : function(xhr, status) {
     }
	
}); //end ajax  

//누적 연체일수 조회
$.ajax({
	type : 'get',
	url :"arrearsday",
	success : function(data) {
        $('#arrearsDay').html(data).css('color', 'red').css('font-weight','bold');
     },
	error : function(xhr, status) {
     }
	
}); //end ajax  


//연체목록
$.ajax({
	type : 'get',
	url :"arrearslist",
	dataType:'json',
	success : function(data) {
        console.log("data=",data);
        for(var i=0;i<data.length;i++){   
        	console.log(data[i].bo_num);
        var $tr= $("<tr>").appendTo($("#arrears"));
        $tr.append("<td>"+(i+1)+"</td>");
        $tr.append("<td>"+data[i].bk_name+"</td>");
        $tr.append("<td>"+data[i].bd_date+"</td>");
        $tr.append("<td>"+data[i].bd_return_date+"</td>");
        $tr.append("<td>"+data[i].bd_real_return_date+"</td>");
        $tr.append("<td>"+data[i].arrearsday+"</td>");
        }
        
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
}); //end ajax



//현재 예약 목록
$.ajax({
	type : 'get',
	url :"reservationlist",
	dataType:'json',
	success : function(data) {
        console.log("현재 예약 목록=",data);
        for(var i=0;i<data.length;i++){   
        	//console.log(data[i].bo_num);
        var $tr= $("<tr>").appendTo($("#reservation"));
        $tr.append("<td>"+data[i].rv_num+"</td>");
        $tr.append("<td>"+data[i].lb_name+"</td>");
        $tr.append("<td>"+data[i].bk_name+"</td>");
        $tr.append("<td>"+data[i].rv_date+"</td>");
        if(data[i].bk_state==0)
        $tr.append("<td>대출불가</td>");
        if(data[i].bk_state==1)
        $tr.append("<td>대출가능</td>");
        $tr.append("<td><button>담기</button></td>");
        $tr.append("<td>순위</td>");
        $tr.append("<td><button onclick='reservationCancel("+data[i].rv_lcode+","+data[i].rv_code+")'>취소</button></td>");
        }
        
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
});  //end ajax



//예약 취소하기
function reservationCancel(rv_code,rv_lcode){
	
	console.log("rv_code",rv_code);
	console.log("rv_lcode",rv_lcode);
/* 	 $.ajax({
		type : 'get',
		url :"reservationcancel",
		data:{rv_code:rv_code,rv_lcode:rv_lcode},
		success : function(data) {
			console.log("예약취소ajax=",data);
				location.reload();
		},
		error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
		
	});  */	 //ajax End
	
}; //reservationCancel end



//대출현황
$.ajax({
	type : 'get',
	url :"loanlist",
	dataType:'json',
	success : function(data) {
        console.log("data2=",data);
	for(var i=0;i<data.length;i++){   
    	console.log(data[i].bo_num);
    var $tr= $("<tr>").appendTo($("#borrow"));
    $tr.append("<td>"+(i+1)+"</td>");
    $tr.append("<td>"+data[i].bk_name+"</td>");
    $tr.append("<td>"+data[i].bd_date+"</td>");
    $tr.append("<td>"+data[i].bd_return_date+"</td>");
    $tr.append("<td><button onclick='extend("+data[i].bo_num+")'>연장하기</button></td>");
    }
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
}); //end ajax



//반납일 연장하기
function extend(bd_bo_num){
	console.log(bd_bo_num);

	$.ajax({
		type : 'get',
		url :"loanextend",
		data:{bd_bo_num:bd_bo_num},
		success : function(data) {
			console.log("반납연장ajax=",data);
				location.reload();
			if(data==1){
				$("button").attr("disabled",true);
			}
			
		},
		error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
		
	}); 	//ajax End
}	//fct End


</script>



</body>
</html>