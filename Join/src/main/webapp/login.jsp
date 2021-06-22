<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login_processing_page</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String login_id = request.getParameter("login_id");     // 입력받은 id
	String login_pswd = request.getParameter("login_pswd"); // 입력받은 암호
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";	// Data Source의 URL
	String DB_id = "c##user";								// ID
	String DB_passwd = "madang";							// PW
	String DB_Driver = "oracle.jdbc.driver.OracleDriver";	// Data Source의 드라이버
	
	/*         객체선언            */
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql = "SELECT id,password FROM member WHERE id='" + login_id + "' AND password='" + login_pswd + "'";
	 
	try{
		/*         드라이버 설정 & 커넥션 만들기            */
		Class.forName(DB_Driver);
		conn = DriverManager.getConnection(DB_URL, DB_id, DB_passwd);
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		if(rs.next()){
			out.println(login_id+"님 환영합니다!");	
			
			session.setAttribute("id", login_id);
			response.sendRedirect("user_info.jsp");

		} else {
			out.println("id 또는 비밀번호를 확인해 주세요.");
		}
		/*        자원 반납          */
		rs.close();
		ps.close();
		conn.close();
	}catch(Exception e){
		System.out.print(e);
		out.println(e);
	}
%>
</body>
</html>		

