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
 * Servlet implementation class TodoTypeServlet
 */
@WebServlet("/type")
public class TodoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		//todo의 id와 type값 받기
	    String type=request.getParameter("type");
		int id=Integer.parseInt(request.getParameter("id"));
		
		System.out.println("타입: "+type+" 아이디"+id);
		//update todo
		//다음 상태로 (현재 상태가 TODO라면 DOING으로 DOING 이라면 DONE로) TodoDao를 이용해서 변경
		TodoDto dto=new TodoDto();
		if(type.equals("TODO")) {
			dto.setType("DOING");
			dto.setId(id);	
		}
		else if(type.equals("DOING")) {
			dto.setType("DONE");
			dto.setId(id);		
		}
		TodoDao dao=new TodoDao();
		dao.updateTodo(dto);
		System.out.println(dao.updateTodo(dto));
		//response.sendRedirect("main");
	}

}
