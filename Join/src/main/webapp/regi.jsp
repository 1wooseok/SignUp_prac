<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Registration</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pswd = request.getParameter("pswd");
	String name = request.getParameter("name");
	String bod = request.getParameter("bod");
	String gender = request.getParameter("gender");
	String email  = request.getParameter("email");
	String phone  = request.getParameter("phone");

	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";	// Data Source의 URL
	String DB_id = "c##user";								// ID
	String DB_passwd = "madang";									// PW
	String DB_Driver = "oracle.jdbc.driver.OracleDriver";		// Data Source의 드라이버

	/*         객체선언            */
	Connection conn = null;
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	ResultSet rs = null;
	
	String query = "INSERT INTO member (id, password, username, birthday, gender, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
 	String sql = "SELECT id FROM member WHERE id='"+id+"'";
	
	try{
		/*         SELECT를 하기 위한 드라이버 설정 & 커넥션 만들기            */
		Class.forName(DB_Driver);
		conn = DriverManager.getConnection(DB_URL, DB_id, DB_passwd);
		ps2 = conn.prepareStatement(sql);
		rs = ps2.executeQuery(sql);
		
		// 중복 아이디 검사.
		if(!rs.next()){
			ps = conn.prepareStatement(query);
			
			ps.setString(1, id);
			ps.setString(2, pswd);
			ps.setString(3, name);
			ps.setString(4, bod);
			ps.setString(5, gender);
			ps.setString(6, email);
			ps.setString(7, phone);

			ps.executeUpdate();

			/*        자원 반납          */
			rs.close();
			ps.close();
			conn.close();
			%>
			<script>
				alert("WELCOME");
				location.href='index.html';
			</script>
			<%
		} else {
			%>
			<script>
				alert("이미 사용중인 아이디 입니다.");
				location.href='join.jsp';
			</script>
			<%
		}
	}catch(Exception e){
		System.out.print(e);
		out.println(e);
	}
%>

</body>
</html>