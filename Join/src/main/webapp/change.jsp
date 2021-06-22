<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Change pswd</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id"); // Session
	String current_pswd = request.getParameter("current_pswd"); // 확인을 위해 입력한 기존 비밀번호
	String new_pswd = request.getParameter("new_pswd");  // 새 비밀번호

	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";	// Data Source의 URL
	String DB_id = "c##user";								// ID
	String DB_passwd = "madang";									// PW
	String DB_Driver = "oracle.jdbc.driver.OracleDriver";		// Data Source의 드라이버
	
	/*         객체선언            */
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String query = "SELECT password FROM member WHERE id='"+id+"'";  
	String sql = "UPDATE member SET password = ? WHERE id='"+id+"'";      
        		
	try{
		/*         드라이버 설정 & 커넥션 만들기            */
		Class.forName(DB_Driver);
		conn = DriverManager.getConnection(DB_URL, DB_id, DB_passwd);
		ps = conn.prepareStatement(query);
		rs = ps.executeQuery(); 

		if(rs != null) {
			while(rs.next()){
				String user_pswd = rs.getString("password"); // 질의문 결과로부터 받은 비밀번호. 
				if (user_pswd.equals(current_pswd)) {
					Connection conn2 = null;
					PreparedStatement ps2 = null;
					ResultSet rs2 = null;
					
					Class.forName(DB_Driver);
					conn2 = DriverManager.getConnection(DB_URL, DB_id, DB_passwd);
					ps2 = conn.prepareStatement(sql);
					ps2.setString(1, new_pswd);
					int result = ps2.executeUpdate(); 
					
					out.println(result+"(Success)");
					
					ps2.close();
					conn2.close();
					
					rs.close();
					ps.close();
					conn.close();
					
					session.invalidate();		
					%>
						<script>
							alert("비밀번호가 변경 되었습니다. \n 다시 로그인 해주세요");
							location.href="index.html";
						</script>
					<% 
					
				} else {
					out.println("비밀번호가 일치하지 않습니다.");	
				}
	        }
		} else {
			out.println("변경 실패");
		}
		/*        자원 반납          */
		
	}catch(Exception e){
		System.out.print(e);
		out.println(e);
	}
%>



</body>
</html>