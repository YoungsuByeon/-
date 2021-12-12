package student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

public class DataManagerDAO {
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/myschool";
	String user = "root";
	String pass = "mysql";
	
	private Connection openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection)DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	private void closeConnection() {
		try {
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertStudent(StudentInfo student) {
		
		PreparedStatement pstm = null;
		String query = "insert into student values (?,?,?,?,?,?,?,?);";
		int res = 0;
		
		openConnection();
		
		try {
			pstm = (PreparedStatement) conn.prepareStatement(query);
				pstm.setString(1, student.getCode());
				pstm.setString(2, student.getDept());
				pstm.setString(3, student.getName());
				pstm.setString(4, student.getGrade());
				pstm.setString(5, student.getGender());
				pstm.setString(6, student.getAge());
				pstm.setString(7, student.getPhone());
				pstm.setString(8, student.getAddress());
			
				res = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	public int removeStudent(String code) {
		PreparedStatement pstm = null;
		String query = "delete from student where code=?;";
		int res = 0;
		
		openConnection();
		try {
			pstm = (PreparedStatement) conn.prepareStatement(query);
				pstm.setString(1, code);
				res = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	public int updateStudent(StudentInfo student) {
		PreparedStatement pstm = null;
		String query = "update student set dept=?, name=?, grade=?, gender=?, age=?, phone=?, address=? where code=?;";
		int res = 0;
		
		openConnection();
		
		try {
			pstm = (PreparedStatement) conn.prepareStatement(query);
				pstm.setString(1, student.getDept());
				pstm.setString(2, student.getName());
				pstm.setString(3, student.getGrade());
				pstm.setString(4, student.getGender());
				pstm.setString(5, student.getAge());
				pstm.setString(6, student.getPhone());
				pstm.setString(7, student.getAddress());
				pstm.setString(8, student.getCode());
				
				res = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	public boolean isStudent(String code) {
		PreparedStatement pstm = null;
		boolean res = false;
		String query = "select * from student where code=?;";
		
		openConnection();
		
		try {
			pstm = (PreparedStatement) conn.prepareStatement(query);
				pstm.setString(1, code);
				
			ResultSet rs = pstm.executeQuery();
			res = rs.next();
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	public StudentInfo getStudent(String code) {
		StudentInfo student = new StudentInfo();
		PreparedStatement pstm = null;
		String query = "select * from student where code=?;";
		
		openConnection();
		try {
			pstm = (PreparedStatement) conn.prepareStatement(query);
			pstm.setString(1, code);
			
			ResultSet rs = pstm.executeQuery();
			if(rs.next()) {
				student.setCode(rs.getString("code"));
				student.setDept(rs.getString("dept"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getString("grade"));
				student.setGender(rs.getString("gender"));
				student.setAge(rs.getString("age"));
				student.setPhone(rs.getString("phone"));
				student.setAddress(rs.getString("address"));
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return student; 
	}
	
	public ArrayList<StudentInfo> getDBList(){
		ArrayList<StudentInfo> datas = new ArrayList<>();
		String query = "select * from student order by code asc;"; /*score*/
		Statement stmt;
		ResultSet rs;
		
		openConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				StudentInfo student = new StudentInfo();
				student.setCode(rs.getString("code"));
				student.setDept(rs.getString("dept"));
				student.setName(rs.getString("name"));
				student.setGrade(rs.getString("grade"));
				student.setGender(rs.getString("gender"));
				student.setAge(rs.getString("age"));
				student.setPhone(rs.getString("phone"));
				student.setAddress(rs.getString("address"));
				
				datas.add(student);
			}
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return datas;
	}
	
}
