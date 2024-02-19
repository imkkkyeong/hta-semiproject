/* 
	작성자: 지민주
	
	FullCalendar API(달력)를 사용하기 위해 서블릿 페이지 작성하였습니다.
	( 더 간편한 방법이 있으면 알려주세요:) )
*/

package fullcalendar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class calendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public calendarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 요청받을 변수 선언
		String command = request.getParameter("command");
		
		if(command.equals("calender")) {
			response.sendRedirect("calendar.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
