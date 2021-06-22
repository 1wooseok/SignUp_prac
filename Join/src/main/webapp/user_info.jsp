<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection dbconn = DriverManager.getConnection(url, "c##user", "madang");
    Statement stmt = dbconn.createStatement();
    
    String login_id = (String)session.getAttribute("id");
    if(login_id == null){
    	out.println("no Session");
    } 
    session.setAttribute("id", login_id);
    String sql = "SELECT * FROM member WHERE id='" + login_id + "'";
    ResultSet myResultSet = stmt.executeQuery(sql);      
    
    if(myResultSet != null) {
        while(myResultSet.next()){
        	String user_id = myResultSet.getString("id");
            String user_name= myResultSet.getString("username");
            String user_bod = myResultSet.getString("birthday");
            String user_gender = myResultSet.getString("gender");
            String user_email = myResultSet.getString("email");
            String user_phone = myResultSet.getString("phone");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="nav.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <title>User Info</title>
</head>


<body>
	<div id="top_menu">
		<div id="menu">
	        <a href="#">ACCOUNT</a> 
	        <a href="logout.jsp">logout</a>
	        
    	</div>
	</div>
    
    
    <div id="sub_menu">
    	<ul class='sub_list'>
           <li style="border-bottom:solid 2px black;"><a href="user_info.jsp">Account Info</a></li>
           <li><a href="security.jsp">Security</a></li>
        </ul>
    </div>
    <div id="content_section">
    	<div class="column">
    		<div class="profile">
    			<div class="profile_header">
    				<h2>Profile</h2>
    			</div>
    			<dl class="profile_content">
    				<dt>Name</dt>
    				<dd><%=user_name%></dd>
    				<dt>BirthDay</dt>
    				<dd><%=user_bod%></dd>   
    				<dt>Gender</dt>
    				<dd><%=user_gender%></dd> 				
    			</dl>
    			<p>
    				<a class="edit_btn" href="edit.jsp"><b class="btn_2">Edit</b></a>
    			</p>
    		</div>
    	</div>
    	
    	<div class="column">
    		<div class="profile">
    			<div class="profile_header">
    				<h2>Contact</h2>
    			</div>
	    			<div class="profile_content">
	    				<dl class="profile_content">
	    				<dt>Email</dt>
	    				<dd><%=user_email%></dd>
	    				<dt>Phone</dt>
	    				<dd><%=user_phone%></dd>    				
	    			</dl>
    				<p>
    					<a class="edit_btn" href="edit.jsp"><b class="btn_2">Edit</b></a>
    				</p>
    			</div>
    		</div>
    	</div>
    </div>
    <%
        }
    } 
   		myResultSet.close();
		stmt.close();
	    dbconn.close();
	%>
    <!-- <script src="nav.js"></script> -->
</body>
</html>