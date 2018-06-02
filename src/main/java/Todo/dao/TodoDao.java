package Todo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Todo.dto.TodoDto;

public class TodoDao {
	private static String dburl = "jdbc:mysql://localhost:3306/tododb";
	private static String dbuser = "root";
	private static String dbpwd = "1234";
	//입력
	public int addTodo(TodoDto todo) {
		int insertCnt=0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql = "insert into todo(title, name, sequence) values(?, ?, ?)";
		try(Connection conn=DriverManager.getConnection(dburl,dbuser,dbpwd);
			PreparedStatement ps=conn.prepareStatement(sql);){ //자동 close()

			ps.setString(1, todo.getTitle());
			ps.setString(2, todo.getName());
			ps.setInt(3, todo.getSequence());
			
			insertCnt=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertCnt;
	}
	//조회
	public List<TodoDto> getTodos() {
		List<TodoDto> list=new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql="select id, title, name, sequence, type, regdate from todo order by regdate desc";
		
		try (Connection conn=DriverManager.getConnection(dburl,dbuser,dbpwd);
			PreparedStatement ps=conn.prepareStatement(sql);){ //자동 close
			
			try(ResultSet rs=ps.executeQuery()){ //자동 close
				while(rs.next()) {
					long id=rs.getLong(1);
					String title=rs.getString(2);
					String name=rs.getString(3);
					int sequence=rs.getInt(4);
					String type=rs.getString(5);
					String regdate=rs.getString(6);
					
					TodoDto todo=new TodoDto(id, title, name, sequence, type, regdate);
					list.add(todo);					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//수정
	public int updateTodo(TodoDto todo) {
		int updateCnt=0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql = "update todo set type = ? where id = ?";
		
		try(Connection conn=DriverManager.getConnection(dburl,dbuser,dbpwd);
			PreparedStatement ps=conn.prepareStatement(sql);){ 

			ps.setString(1, todo.getType());
			ps.setLong(2, todo.getId());
			
			updateCnt=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCnt;
	}
}
