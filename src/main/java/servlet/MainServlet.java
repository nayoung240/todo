package servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import Todo.dao.TodoDao;
import Todo.dto.TodoDto;
/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		TodoDao dao=new TodoDao();
		List<TodoDto> list=dao.getTodos();
		
		for(int i=0; i<list.size(); i++) {
			request.setAttribute("id", list.get(i).getId());
			request.setAttribute("title", list.get(i).getTitle());
			request.setAttribute("name", list.get(i).getName());
			request.setAttribute("sequence", list.get(i).getSequence());
			request.setAttribute("type", list.get(i).getType());
			request.setAttribute("regdate", list.get(i).getRegdate());
		}
		
		//TodoDao를 이용해 결과를 조회해서 main.jsp 에 전달
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

}
