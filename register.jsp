<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>BookStore</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script language="javascript"> 
      	function checkuname() {
      		var patrn = /^([A-Za-z0-9])(\w)+@(\w)+(\.)(com|com\.cn|net|cn|net\.cn|org|biz|info|gov|gov\.cn|edu|edu\.cn)/; 
      		 x=document.f1.username.value
      		 y=document.f1.password.value
      		 if(!patrn.exec(x)) 
      		 {
      		 	 alert("username is not valid (email form)");
      		 	 return false
      		 }
      		 else if(y.length<0){
      		 			alert("password is less than 8 digits and characters");
      		 			return false
      		 			}
      		 			else
      		 	 	  return true 
      	}
     </script>
<%-- JSP  --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			
           
            String loginUser=null;
            String count="0";
            String price="0.00";
            
            if (!session.isNew()) loginUser=(String)session.getAttribute("username");
            if (session.getAttribute("count")!=null) count=(String)session.getAttribute("count");
            if (session.getAttribute("price")!=null) price=(String)session.getAttribute("price");
            
            String items="";
            if (session.getAttribute("cart")!=null)  items=(String)session.getAttribute("cart");
            String[] item=items.split(";");
            int length=item.length;
       
           
%>
</head>
<body>

<!-- header start -->
<div class="header">
	<div class="headpanel">
    	<div class="logo"><h1>BookStore</h1></div>
        <div class="menu">
          <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><div class="gap"></div></li>
          
          <li><a href="contactus.jsp">Contact Us</a></li>
          </ul>
        </div>
	</div>
</div>
<!-- end of header -->

<!-- main content start -->
<div class="main_content">


  <!-- center content start -->
<div class="center_content">
	
	

	<form name="f1" method="post" action="addtouser.jsp"  onsubmit="return checkuname();" >
	<div class="center_title_bar">Register</div>

	<div class="insert_book_box">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;User Name:&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="username" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="password" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="email" VALUE="">
			</div>
		
     </div>

	
		   <input class="btn2" type="submit" name="submit" value="submit"/>&nbsp;&nbsp;&nbsp;
		  
	</form>
</div>
	<!-- end of center content -->

    <!-- right content start -->
    <div class="right_content">
 
		<!-- member start -->
		<div class="title_box">Member Login</div> 
		<%
		try{
		if(loginUser!=null){	
                	%>
                	<form method=post action="logoff.jsp">
					<div id="login" class="member" >
					<p><%out.println("Member:"+loginUser); %></p>
					
					</div>
					<input class="btn4" type="submit" name="submit"  value="Logoff"/>
					</form>
                	<% 
                
                }
                else{
                	%>
                	<form method=post action="login.jsp">
					<div id="login" class="member" >
					<p></p>
					<p>your name</p>
					<input type="text" name="textbox" value="" />
					<p>password</p>
					<input type="password" name="password" value="" />
					<p>Not yet a Member? <a href="register.jsp">Register Now</a></p>
					<p></p>
					<input class="btn4" type="submit" name="submit"  value="Login"/>
					</div>
					</form>
                	<%              
                }          
                }
                catch(Exception e){
                out.println("error");
                e.printStackTrace();
                }
                %> 	
		<!-- end of member -->
		
		<div class="title_box">Administer Login</div> 
		<form method=post action="admin.jsp">
					<div id="admin" class="member" >
					<p></p>
					<p>your name</p>
					<input type="text" name="textbox" value="" />
					<p>password</p>
					<input type="password" name="password" value="" />
					
					<p></p>
					<input class="btn4" type="submit" name="submit"  value="Login"/>
					</div>
					</form>
		
		
        <!-- search start -->
		<div class="title_box">Search</div>  
		<form method=post action="search.jsp">
        <div class="search">
		<p></p>
		<p>Search by author or title</p>
	    <input type="text" name="textbox" value=""/>
		<p></p>
		<input class="btn4" type="submit" name="submit" value="Search"/>
        </div>  
        </form>
        <!-- end of search -->
		
         <!-- shopping cart start -->    
		<div class="shopping_cart">
        	<div class="title_box">Shopping cart</div>           
            <div class="cart_details">
            <% out.print(count); %> items <br />
            <span class="border_cart"></span>
            Total: <span class="price">$<% out.print(price); %></span>
            </div>           
            <div class="cart_icon"><a href="#" title=""><img src="images/shoppingcart.png" alt="" title="" width="35" height="35" border="0" /></a></div>        
        </div>
        <!-- end of shopping cart -->
    
	</div>
	<!-- end of right content --> 


</div>
<!-- end of main content -->


</body>
</html>