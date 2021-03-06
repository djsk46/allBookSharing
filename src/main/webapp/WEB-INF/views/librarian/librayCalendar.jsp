<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<link href='./plugins/fullcalendar-4.4.0/packages/core/main.css'
	rel='stylesheet' />
<link href='./plugins/fullcalendar-4.4.0/packages/daygrid/main.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='./plugins/fullcalendar-4.4.0/packages/core/main.js'></script>
<script src='./plugins/fullcalendar-4.4.0/packages/interaction/main.js'></script>
<script src='./plugins/fullcalendar-4.4.0/packages/daygrid/main.js'></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{
	background-color: white;
	font-family: 'Jeju Gothic', sans-serif;
}

#wrap {
	
	width: 1100px;
	margin: 0 auto;

}

#external-events {
	
	float: left;
	width: 140px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	margin-right: 30px;
	float: right;
	width: 900px;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>
<title>Insert title here</title>

</head>
<body>
	<div class="container-fluid" style="margin-top: 50px;"> 
		<div id='wrap'>

			<div id='external-events'>
				<h4>Draggable Events</h4>

				<div id='external-events-list'>
					<div class='fc-event'>휴관일</div>
				</div>

				<p>
					<input type='checkbox' id='drop-remove' /> <label
						for='drop-remove'>remove after drop</label>
				</p>
			</div>

			<div id='calendar'></div>

			<div style='clear: both'></div>

		</div>
	</div>
</body>
<script type="text/javascript" src="js/ajaxCsrf.js"></script>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var Calendar = FullCalendar.Calendar;
						var Draggable = FullCalendarInteraction.Draggable

						/* initialize the external events
						-----------------------------------------------------------------*/

						var containerEl = document
								.getElementById('external-events-list');
						new Draggable(containerEl, {
							itemSelector : '.fc-event',
							eventData : function(eventEl) {

								return {
									title : eventEl.innerText.trim()
								}

							}
						});

						var calendarEl = document.getElementById('calendar');
						var calendar = new Calendar(
								calendarEl,
								{
									plugins : [ 'interaction', 'dayGrid' ],
									header : {
										left : 'prev,next today',
										center : 'title',
										right : 'dayGridMonth'
									},
									selectable : true,
									select : function(info) { //날짜 클릭시 작동하는 메소드

										var title = prompt('Enter a title');
										
										if (title == "") {
											alert('내용을 입력해 주세요');
										} else if (title != null) { // valid?
											calendar.addEvent({
												title : title,
												start : info.startStr,
												end : info.endStr,
												allDay : true
											});
											
											setLibraySchedule(info.startStr, info.endStr, title) 
											
										}

									},
									editable : true,
									droppable : true, 
									drop : function(arg) {//여기서 드랍 이벤트 발생, 에이작스 사용하여 저장하자
										
										
										setLibraySchedule(arg.dateStr,arg.dateStr,arg.draggedEl.innerText);
										
										if (document.getElementById('drop-remove').checked) { 
											arg.draggedEl.parentNode.removeChild(arg.draggedEl);
										}
									},
									eventDrop: function(info) { //이벤트 드래그해서 수정하는 부분, DB 등록 후 이전 데이터는 삭제
									   
										let end;
										let start=moment(info.event.start).format('YYYY-MM-DD');
										
										if(info.event.end == null){
											end=moment(info.event.start).format('YYYY-MM-DD');
										}else{
											end=moment(info.event.end).format('YYYY-MM-DD');
										}
										
										
									    if (!confirm("일정을 변경하시겠습니까?")) {
									    	
									    	info.revert();
									    }else{
									    	setLibraySchedule(start, end, info.event.title);
											deleteLibraySchedule(info.oldEvent);
									    }
									  },
									eventLimit : true,
									eventSources : [ { //도서관 일정 가져오고 달력에 뿌려주는 부분
										events : function(info,
												successCallback,
												failureCallback) {

											$.ajax({
												url : 'libraycalendarinfo',
												type : 'get',
												dataType : 'json',
												success : function(data) {
													successCallback(data);
												}
											}); //ajax End

										}
									} ],
									eventClick : function(info) { //이벤트 클릭시 삭제하는 부분
	
										var result = confirm("삭제 하시겠습니까?");
										if(result){
											deleteLibraySchedule(info.event);
											info.event.remove();
										}
										}
								});

						calendar.render();
					}); //ready End

	function setLibraySchedule(start, end, title) { //일정을 DB에 저장하는 메소드				
		var schedule = {
			"title" : title,
			"start" : start,
			"end" : end
		};

		$.ajax({
			url : 'setlibrayschedule',
			type : 'post',
			dataType : 'json',
			data : schedule,
			success : function(data) {
				console.log("성공/실패:", data);
			}
		}); //ajax End
	} //function End
	
	function deleteLibraySchedule(info){ //일정을 DB에서 삭제하는 메소드
		
			var end;
			if(info.end == null){
				end=moment(info.start)
				 .format('YYYY-MM-DD');
			}else{
				end=moment(info.end)
				.format('YYYY-MM-DD');
			}

			let schedule = {
				"title" : info.title,
				"start" : moment(info.start)
						 .format('YYYY-MM-DD'),
				"end" : end
			};

			$.ajax({
				url : 'librayscheduledelete',
				type : 'post',
				dataType : 'json',
				data : schedule,
				success : function(data) {

				}
			}); //ajax End
	
	}//function End
</script>
</html>