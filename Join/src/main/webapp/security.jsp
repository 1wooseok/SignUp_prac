<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection dbconn = DriverManager.getConnection(url, "c##user", "madang");
    Statement stmt = dbconn.createStatement();
    
    String login_id = (String)session.getAttribute("id");
    session.setAttribute("id", login_id);
    if(login_id == null){
    	out.println("no Session");
    }
    String sql = "SELECT password FROM member WHERE id='" + login_id + "'";
    ResultSet myResultSet = stmt.executeQuery(sql);      
    
    if(myResultSet != null) {
        while(myResultSet.next()){
            String user_pswd= myResultSet.getString("password");
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
	        <a>ACCOUNT</a> 
	        <a href="logout.jsp">logout</a>
	        
    	</div>
	</div>
    
    
    <div id="sub_menu">
    	<ul class='sub_list'>
           <li><a href="user_info.jsp">Account Info</a></li>
           <li style="border-bottom:solid 2px black;"><a href="security.jsp">Security</a></li>
        </ul>
    </div>
    <div id="content_section">
    	<div class="column">
    		<div class="profile">
    			<div class="profile_header">
    				<h2>Security</h2>
    			</div>
    			
    			<form id="change_form" method="post" action="change.jsp">
	    			<dl class="profile_content">
	    				<dt>password</dt>
	    				<dd><a class="change_pswd" style="text-decoration: underline">change</a></dd>
	    				<dt>leave account</dt>
	    				<dd><a class="leave_account" style="text-decoration: underline">confirm</a></dd>			
	    			</dl>
	    			
	    			<div class="change_feild none">
	    				<div><span>Current Password</span><input style="margin-left:7px"  type="password" name="current_pswd"></div>
	    				<span>New Password</span><input style="margin-left:20px" type="password" name="new_pswd">
	    				<div style="display:flex">
	    					<p>
		    				<a class="cancle_btn edit_btn"><b class="btn_2">Cancle</b></a>
		    				<input class="confirm_btn" type="submit" value="Confirm">
		    				
		    				</p>				
	    				</div>
	    			</div>
    			</form>	
    			
    			<form id="delete_form" method="post" action="delete_account.jsp">
    				<div class="delete_feild none">
	    				<div><span>Current id</span><input type="text" name="curr_id"></div>
	    				<span>Current Password</span><input type="password" name="curr_pswd">
	    				<div style="display:flex">
	    					<p>
		    				<a class="cancle_btn2 edit_btn"><b class="btn_2">Cancle</b></a>
		    				<input class="confirm_btn" type="submit" value="Confirm">
		    				</p>				
	    				</div>
	    			</div>
    			</form>
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
	<script src="edit.js"></script>
    <!-- <script src="nav.js"></script> -->
</body>
</html>