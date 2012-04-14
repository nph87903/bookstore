<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>BookStore</title>
<link rel="stylesheet" type="text/css" href="style.css" />




<%-- JSP  --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			
           
            String loginUser=null;
            String count="0";
            String price="0.00";
            
            if (!session.isNew()) loginUser=(String)session.getAttribute("username");
            if (session.getAttribute("count")!=null) count=(String)session.getAttribute("count");
            if (session.getAttribute("price")!=null) price=(String)session.getAttribute("price");
            
            
       
              
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
   	
	<!-- left content start -->
    <div class="left_content">
	    <div class="navigation">
        Navigation: <span class="current">Home/contact_us</span>  
        </div> 
   
        <div class="title_box">Categories</div>    
          <ul class="left_menu">
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Arts & Photography"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Audiobooks"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Biographies & Memoirs"/></li>
          </form>
          <form method=post action="search.jsp">
		  <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Business & Investing"/></li>
		  </form>
		  <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Children Books"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Comics & Graphic Novels"/></li>
          </form>
          <form method=post action="search.jsp">
		  <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Computers & Technology"/></li>
		  </form>
		  <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Cookbooks"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Health & Dieting"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Humor & Entertainment"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Politics & Social Sciences"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Travel"/></li>
          </form>
          <form method=post action="search.jsp">
          <li class="odd"><input class="btn4" name="textbox" type="submit" style="width:180px;" value="Sports & Outdoors"/></li>
          </form>
          </ul> 
                
		  
       
	</div>
	<!-- end of left content --> 

    <!-- center content start -->
	<div class="center_content">  
    	
		<!-- contact us start -->
   	<div class="center_title_bar">Contact Us</div> 
   	<form method="post" action="sendmessage.jsp">  
    	<div class="book_box_big">    
            <div class="center_book_box_big">                            
              	<div class="contact_form">
                           
                    <div class="form_row">
                    <label class="contact"><strong>Name:</strong></label>
                    <input type="text" class="contact_input" name="name"/>
                    </div>  

                    <div class="form_row">
                    <label class="contact"><strong>Email:</strong></label>
                    <input type="text" class="contact_input" name="email"/>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>Phone:</strong></label>
                    <input type="text" class="contact_input" name="phone"/>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Company:</strong></label>
                    <input type="text" class="contact_input" name="company"/>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>Message:</strong></label>
                    <textarea class="contact_textarea" name="message"></textarea>
                    </div>

                    
                    <div class="form_row">
		            <input class="btn2" type="submit" name="submit" value="Send"/>
                    </div>                         
                </div>                                                     
            </div>                                
        </div>
        </form>
		<!-- end of contact us -->

    	 
      
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