package score;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

public class ScoreManagerDAO {
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
	
	public int insertScore(scoreInfo score) {
		
		PreparedStatement pstm = null;
		String query = "insert into 성적 values(?,?,?,?)";
		int res = 0;
		
		openConnection();
		try {
			pstm = (PreparedStatement) conn.prepareStatement(query);
				pstm.setString(1, score.getCode());
				pstm.setInt(2, score.get컴파일러());
				pstm.setInt(3, score.get한국어의미의이해());
				pstm.setInt(4, score.get마케팅원론());
				
				res = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	public int removeScore(String 학생번호) {
		PreparedStatement pstm = null;
		String query = "delete from 성적 where code=?;";
		int res = 0;
		
		openConnection();
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, 학생번호);
			res = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	public int updateScore(scoreInfo score) {
		PreparedStatement pstm = null;
		String query = "update 성적 set 컴파일러=?, 한국어의미의이해=?, 마케팅원론=? where code=?;";
		int res = 0;
		
		openConnection();
		try {
			pstm = (PreparedStatement) conn.prepareStatement(query);
				pstm.setInt(1, score.get컴파일러());
				pstm.setInt(2, score.get한국어의미의이해());
				pstm.setInt(3, score.get마케팅원론());
				pstm.setString(4, score.getCode());
			res=pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	public boolean isScore(String code) {
		PreparedStatement pstm = null;
		boolean res = false;
		String query = "select * from 학생정보와성적 where code=?;";
		
		openConnection();
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
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
	
	public scoreInfo getScore(String code) {
		scoreInfo score = new scoreInfo();
		PreparedStatement pstm = null;
		String query = "select * from 성적정보 where code=?;";
		
		openConnection();
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, code);
			
			ResultSet rs = pstm.executeQuery();
			if(rs.next()) {
				score.setCode(rs.getString("code"));
				score.setName(rs.getString("name"));
				score.setGrade(rs.getString("grade"));
				score.set석차(rs.getInt("석차"));
				score.set강의번호(rs.getString("강의번호"));
				score.set교수번호(rs.getString("교수번호"));
				score.set교수이름(rs.getString("교수이름"));
				score.set컴파일러(rs.getInt("컴파일러"));
				score.set한국어의미의이해(rs.getInt("한국어의미의이해"));
				score.set마케팅원론(rs.getInt("마케팅원론"));
				score.set총점(rs.getInt("총점"));
				score.set평균(rs.getDouble("평균"));
				
			}
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return score;
	}
		
	public ArrayList<scoreInfo> getDBList(){
		ArrayList<scoreInfo> datas = new ArrayList<>();
		String query = "select * from 학생정보와성적 order by code asc;";
		Statement stmt;
		ResultSet rs;
		
		openConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				scoreInfo score = new scoreInfo();
				score.setCode(rs.getString("code"));
				score.setDept(rs.getString("dept"));
				score.setName(rs.getString("name"));
				score.setGrade(rs.getString("grade"));
				score.setGender(rs.getString("gender"));
				score.setAge(rs.getString("age"));
				score.setPhone(rs.getString("phone"));
				score.setAddress(rs.getString("address"));
				score.set컴파일러(rs.getInt("컴파일러"));
				score.set한국어의미의이해(rs.getInt("한국어의미의이해"));
				score.set마케팅원론(rs.getInt("마케팅원론"));
				score.set총점(rs.getInt("총점"));
				score.set평균(rs.getDouble("평균"));
				score.set석차(rs.getInt("석차"));
				
				datas.add(score);
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






















