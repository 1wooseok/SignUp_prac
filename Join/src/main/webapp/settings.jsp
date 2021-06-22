<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Setting page</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id"); // Session
	String new_name = request.getParameter("new_name");    // 새 이름
	String new_email = request.getParameter("new_email");  // 새 메일
	String new_phone = request.getParameter("new_phone");  // 새 연락처

	// JDBC 참조 변수 준비
	/*         객체선언            */
	Connection conn = null;
	PreparedStatement ps = null;
			
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";	// Data Source의 URL
	String DB_id = "c##user";								// ID
	String DB_passwd = "madang";									// PW
	String DB_Driver = "oracle.jdbc.driver.OracleDriver";		// Data Source의 드라이버
	
	// SQL문 준비
	String sql_n = "UPDATE member SET username = ? WHERE id='"+id+"'";
	String sql_e = "UPDATE member SET email = ? WHERE id='"+id+"'";
	String sql_p = "UPDATE member SET phone = ? WHERE id='"+id+"'";
	
	if(id != null){
		try{			
			/*         드라이버 설정 & 커넥션 만들기            */
			Class.forName(DB_Driver);  // 1) JDBC 드라이버 로딩
			conn = DriverManager.getConnection(DB_URL, DB_id, DB_passwd); // 2) DB연결(DB url, DB id, DB pw)
	
			if(new_name != null){
				ps = conn.prepareStatement(sql_n);
				ps.setString(1, new_name); 
				int result = ps.executeUpdate();

				ps.close();
			    conn.close();
			    
			} else if(new_email != null){
				ps = conn.prepareStatement(sql_e);
				ps.setString(1, new_email); 
				int result = ps.executeUpdate();

				ps.close();
			    conn.close();
			    
			} else if(new_phone != null){
				ps = conn.prepareStatement(sql_p);
				ps.setString(1, new_phone); 
				int result = ps.executeUpdate();

				ps.close();
			    conn.close();
			}
		    out.println("수정되었습니다.");
		    response.sendRedirect("user_info.jsp");
		} catch(Exception e){
			System.out.print(e);
			out.println(e);
		}
	}    		
%>
</body>
</html>