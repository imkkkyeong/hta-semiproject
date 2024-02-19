<%@page import="utils.DateUtils"%>
<%@page import="dto.admin.CalendarDto"%>
<%@page import="vo.SellerEstimate"%>
<%@page import="dao.admin.BookStatusDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initail-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<title>달력::예약현황</title>
	<link rel='stylesheet' href='../../resources/CSS/bos/calendar.css' />
    <script src='../../resources/JS/bos/calendar.js'></script>
     <script src='../../resources/JS/bos/calendar.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
</head>
<body>
<%
	int sellerNo = Integer.parseInt(request.getParameter("no"));

	BookStatusDao bookStatusDao = new BookStatusDao();
	
	List<CalendarDto> bookList = bookStatusDao.getBooksByNo(sellerNo);
%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div id='calendar'></div>
		</div>
	</div>
</div>
	
<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
      	},
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectMirror: true,
		select: function(arg) {
			console.log(arg);
		},
		eventClick: function(arg) {
			console.log("#등록된 일정 클릭#");
			console.log(arg.event);
		},
		editable: true,
		locale: 'ko',
		dayMaxEvents: true, // allow "more" link when too many events
		events: [
<%
	for (CalendarDto book : bookList) {
%>
		{
			title: '<%=book.getName()%> - <%=book.getStatus()%>',
			id:    '<%=book.getEstimateNo()%>',
			start: '<%=DateUtils.toText(book.getMovingDate(), "yyyy-MM-dd") %>T<%=DateUtils.toText(book.getMovingDate(), "HH:mm:ss") %>'
		},
<%
	}
%>
				]
	})
	calendar.render();
});
</script>
</body>
</html>