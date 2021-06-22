<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page  import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";	// Data Source의 URL
	String DB_id = "c##user";								// ID
	String DB_passwd = "madang";							// PW
	String DB_Driver = "oracle.jdbc.driver.OracleDriver";	// Data Source의 드라이버
	
	/*         객체선언            */
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String new_id = request.getParameter("id");
	String sql = "select id from member WHERE id='"+new_id+"'";
	
	try{
		/*         드라이버 설정 & 커넥션 만들기            */
		Class.forName(DB_Driver);
		conn = DriverManager.getConnection(DB_URL, DB_id, DB_passwd);
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			out.println("이미 존재하는 아이디 입니다.");	
		} else {
			out.println("사용 가능한 아이디 입니다.");	
		}
		
		rs.close();
		ps.close();
		conn.close();
	}catch(Exception e){
		System.out.print(e);
	}
%>
</body>
</html>
