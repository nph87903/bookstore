<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>BookStore</title>
<link rel="stylesheet" type="text/css" href="style.css" />




<%-- JSP  --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            ResultSet    rs;
            String 		bookname=request.getParameter("textbox");
           
            String loginUser=null;
            if (!session.isNew()) loginUser=(String)session.getAttribute("username");
            out.print(session.getAttribute("username"));
            
            String       uname="ld548674";
            String       passwd="d3329774";
            String       query="select title,imagename,price from book where title='"+bookname+"'";
              
			
            
            //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                stmt = con.createStatement();

                //*** execute query and show result
                rs = stmt.executeQuery(query);
            
              
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
          
          <li><a href="contact_us.html">Contact Us</a></li>
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
        Navigation: <span class="current">Home</span>  
        </div> 
   
        <div class="title_box">Categories</div>    
          <ul class="left_menu">
          <li class="odd"><a href="details.html">Arts & Photography</a></li>
          <li class="even"><a href="details.html">Audiobooks</a></li>
          <li class="odd"><a href="details.html">Biographies & Memoirs</a></li>
		  <li class="even"><a href="details.html">Business & Investing</a></li>
          <li class="even"><a href="details.html">Children's Books</a></li>
          <li class="odd"><a href="details.html">Comics & Graphic Novels</a></li>
		  <li class="odd"><a href="details.html">Computers & Technology</a></li>
          <li class="even"><a href="details.html">Cookbooks</a></li>
          <li class="even"><a href="details.html">Health & Dieting</a></li>
          <li class="odd"><a href="details.html">Humor & Entertainment</a></li>
          <li class="even"><a href="details.html">Politics & Social Sciences</a></li>
          <li class="odd"><a href="details.html">Travel</a></li>
          <li class="even"><a href="details.html">Sports & Outdoors</a></li>
          </ul> 
                
		<div class="title_box">Special Products</div>  
        <div class="border_box">
        	<div class="book_title"><a href="details.html">Harry Potter Film Wizardry</a></div>
       		<div class="book_img"><a href="details.html"><img src="images/Harry Potter Film Wizardry.jpg" alt="" title="" width="100" height="110" border="0" /></a></div>
       		<div class="book_price"><span class="reduce">$35</span> <span class="price">$27</span></div>
        </div>  
       
	</div>
	<!-- end of left content --> 

    <!-- center content start -->
	<div class="center_content">  
    	<div class="recommended">
        <img src="images/Diary of a Wimpy Kid Cabin Fever.jpg" width="135" height="140" border="0" class="recommended_img" alt="" title="" />              	
        	<div class="recommended_details">
			    <div class="recommended_head">Recommended:<p></p></div>
       	    	<div class="recommended_title">Diary of a Wimpy Kid Cabin Fever</div>
          	    <div class="recommended_text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</div>
                <a href="details.html" class="book_buy">details</a>
            </div>
		</div>
		<div class="center_title_bar">Search Result</div>
     
    	
    	<% 
    	try{
     
            for(int i=0;i<6;i++){ 
              
               if(!rs.next())break;
                %>
         	<div class="book_box">
            <div class="center_book_box">            
                 <div class="book_title"><a href="details.html"><% out.println(rs.getString(1)); %></a></div>
                 <div class="book_img"><a href="details.html"><img src="<%out.print("images/"+rs.getString(2)); %>" alt="" title="" width="100" height="110" border="0" /></a></div>
                 <div class="book_price">$<% out.println(rs.getString(3)); %></div>                        
            </div>          
            <div class="book_details_tab">
            <a href="buy.html" class="book_buy">Add to Cart</a>          
            <a href="details.html" class="book_details">Details</a>            
            </div>                     
       		</div>
        <%
        
        }
    	
    	
    	}
    	catch (Exception e)
                {
                out.println("error");
                e.printStackTrace();
                }
    	
    	 %>

    	<div class="center_title_bar">Best Sellers</div>

  
    	<div class="book_box">
            <div class="center_book_box">            
                 <div class="book_title"><a href="details.html">Steve Jobs</a></div>
                 <div class="book_img"><a href="details.html"><img src="images/Steve Jobs.jpg" alt="" title="" width="100" height="110" border="0" /></a></div>
                 <div class="book_price">$35.00</div>                        
            </div>           
            <div class="book_details_tab">
            <a href="buy.html" class="book_buy">Add to Cart</a>          
            <a href="details.html" class="book_details">Details</a>            
            </div>                     
        </div>
    
    	<div class="book_box">
            <div class="center_book_box">            
                 <div class="book_title"><a href="details.html">The Twilight Saga</a></div>
                 <div class="book_img"><a href="details.html"><img src="images/The Twilight Saga.jpg" alt="" title="" width="100" height="110" border="0" /></a></div>
                 <div class="book_price">$19.99</div>                        
            </div>         
            <div class="book_details_tab">
            <a href="buy.html" class="book_buy">Add to Cart</a>          
            <a href="details.html" class="book_details">Details</a>            
            </div>                     
        </div>    
 

     	<div class="book_box">
            <div class="center_book_box">            
                 <div class="book_title"><a href="details.html">Alexander McQueen Savage Beauty</a></div>
                 <div class="book_img"><a href="details.html"><img src="images/Alexander McQueen Savage Beauty.jpg" alt="" title="" width="100" height="110" border="0" /></a></div>
                 <div class="book_price">$45.00</div>                        
            </div>          
            <div class="book_details_tab">
            <a href="buy.html" class="book_buy">Add to Cart</a>          
            <a href="details.html" class="book_details">Details</a>            
            </div>                     
        </div>   
      
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
					<input type="submit" name="submit"  value="Logoff"/>
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
					<p>Not yet a Member? <a href="#">Register Now</a></p>
					<p></p>
					<input type="submit" name="submit"  value="Login"/>
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
					<input type="submit" name="submit"  value="Login"/>
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
		<input type="button" name="button" value="Search"/>
        </div>  
        </form>
        <!-- end of search -->
		
         <!-- shopping cart start -->    
		<div class="shopping_cart">
        	<div class="title_box">Shopping cart</div>           
            <div class="cart_details">
            3 items <br />
            <span class="border_cart"></span>
            Total: <span class="price">350$</span>
            </div>           
            <div class="cart_icon"><a href="#" title=""><img src="images/shoppingcart.png" alt="" title="" width="35" height="35" border="0" /></a></div>        
        </div>
        <!-- end of shopping cart -->
    
	</div>
	<!-- end of right content -->   


</div>
<!-- end of main content -->
  
<%//*** close connection
                stmt.close();
                con.close(); %>
</body>
</html>