<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection dbconn = DriverManager.getConnection(url, "c##user", "madang");
    Statement stmt = dbconn.createStatement();
    
    String login_id = (String)session.getAttribute("id");  // 세션
    if(login_id == null){
    	out.println("no Session");
    }
    
    String sql = "SELECT * FROM member WHERE id='" + login_id + "'";  // id에 해당하는 튜플 
    
    ResultSet rs = stmt.executeQuery(sql);      
    
    if(rs != null) {
        while(rs.next()){
            String user_name= rs.getString("username");
            String user_bod = rs.getString("birthday");
            String user_gender = rs.getString("gender");
            String user_email = rs.getString("email");
            String user_phone = rs.getString("phone");
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
           <li style="border-bottom:solid 2px black;"><a href="user_info.jsp">Account Info</a></li>
           <li><a href="security.jsp">Security</a></li>
        </ul>
    </div>
    

    <div id="content_section" style="height:1151px;">
   		<div class="c_header">
	    	<h2> Settings</h2>
	    	<p class="contxt">
	    		It is the contact information of <strong><%=user_name %></strong>.
	    	</p>
	    </div>
	    
	    
<!-- 여기부터 테이블 -->     		
    	<div id="settings_table">
    		<fieldset>
    			<Table style="border:0" class="tbl_model">
    				<colgroup>
    					<col style="width:22%">
    					<col>
    				</colgroup>
    				<tbdoy>
    					<tr>
    						<th scope="row">
    							<div class="thecell">Name</div>
    						</th>
    						<td>
    							<div class="tdcell">
    								<p class="contxt_tit"><%=user_name %></p> 
    								<p class="contxt_desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque, nam!</p>
    								
    								<form class="name_setting_form none" method="post" action="settings.jsp" >
    									New Name
    									<br><input class="settings_text_box" type="text" name="new_name" required>
    									
    									<div class="btn_feild" style="display:flex; margin-top:5px;">
					    					<p>
						    				<a class="cancle_btn edit_btn"><b class="btn_2">Cancle</b></a>
						    				<input class="confirm_btn" type="submit" value="Confirm">
						    				</p>				
					    				</div>						
    								</form>
    								
    								<!-- Edit 버튼  -->
    								<p class=" name_edit_btn">
					    				<a class="edit_btn"><b class="btn_2">Edit</b></a>
					    			</p>
					    			<!-- Edit 버튼 -->
    							</div>
    						</td>
    					</tr>
    					
    					
    					
    					<tr>
    						<th scope="row">
    							<div class="thecell">Email</div>
    						</th>
    						<td>
    							<div class="tdcell">
    								<p class="contxt_tit"><%=user_email %></p> 
    								<p class="contxt_desc">Optio deserunt nemo minima exercitationem quam enim voluptates recusandae praesentium tempore corrupti illo </p>
    								
    								<form class="email_setting_form none" method="post" action="settings.jsp" >
    									New E-mail
    									<br><input class="settings_text_box" type="text" name="new_email">
    									
    									<div class="btn_feild" style="display:flex; margin-top:5px;">
					    					<p>
						    				<a class="cancle_btn2 edit_btn"><b class="btn_2">Cancle</b></a>
						    				<input class="confirm_btn" type="submit" value="Confirm">
						    				</p>				
					    				</div>						
    								</form>
    								
    								
    								<p class=" email_edit_btn">
					    				<a class="edit_btn"><b class="btn_2">Edit</b></a>
					    			</p>
    							</div>
    						</td>
    					</tr>
    					
    					
    					
    					<tr>
    						<th scope="row">
    							<div class="thecell">Phone</div>
    						</th>
    						<td>
    							<div class="tdcell">
    								<p class="contxt_tit"><%=user_phone %></p>
    								<p class="contxt_desc"> quia mollitia labore commodi! Blanditiis maiores deserunt, ea magnam quod quasi, placeat modi eos veritatis repudiandae!</p>
    								
    								<form class="phone_setting_form none" method="post" action="settings.jsp" >
    									New Phone Number
    									<br><input class="settings_text_box" type="text" name="new_phone">
    									
    									<div class="btn_feild" style="display:flex; margin-top:5px;">
					    					<p>
						    				<a class="cancle_btn3 edit_btn"><b class="btn_2">Cancle</b></a>
						    				<input class="confirm_btn" type="submit" value="Confirm">
						    				</p>				
					    				</div>						
    								</form>
    								
    								<p class="phone_edit_btn">
					    				<a class="edit_btn"><b class="btn_2">Edit</b></a>
					    			</p> 
    							</div>
    						</td>
    					</tr>
    				</tbdoy>
    			</Table>
    		</fieldset>
    	</div>
    </div>
    <%
        }
    } 
   		rs.close();
		stmt.close();
	    dbconn.close();
	%>
	<script src="settings.js"></script>
</body>
</html>
