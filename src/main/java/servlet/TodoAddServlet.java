package servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Todo.dao.TodoDao;
import Todo.dto.TodoDto;

/**
 * Servlet implementation class TodoAddServlet
 */
@WebServlet("/add")
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		// 값가져오기
	    String what = request.getParameter("what");
	    String who = request.getParameter("who");
	    int seq = Integer.parseInt(request.getParameter("sequence"));
	    
		//TodoDao를 이용해서 테이블에 저장		
		TodoDto dto=new TodoDto();
		dto.setTitle(what);
		dto.setName(who);
		dto.setSequence(seq);
		TodoDao dao=new TodoDao();
		dao.addTodo(dto);
		
		//메인화면으로 리다이렉트
		response.sendRedirect("main");
	}

}
