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
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";	// Data Source�� URL
	String DB_id = "c##user";								// ID
	String DB_passwd = "madang";							// PW
	String DB_Driver = "oracle.jdbc.driver.OracleDriver";	// Data Source�� ����̹�
	
	/*         ��ü����            */
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String new_id = request.getParameter("id");
	String sql = "select id from member WHERE id='"+new_id+"'";
	
	try{
		/*         ����̹� ���� & Ŀ�ؼ� �����            */
		Class.forName(DB_Driver);
		conn = DriverManager.getConnection(DB_URL, DB_id, DB_passwd);
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			out.println("�̹� �����ϴ� ���̵� �Դϴ�.");	
		} else {
			out.println("��� ������ ���̵� �Դϴ�.");	
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
