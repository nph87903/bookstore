<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>BookStore</title>
<link rel="stylesheet" type="text/css" href="style.css" />

<script language="javascript"> 
      	function checkuname() {
      		var patrn = /^([A-Za-z0-9])(\w)+@(\w)+(\.)(com|com\.cn|net|cn|net\.cn|org|biz|info|gov|gov\.cn|edu|edu\.cn)/; 
      		 x=document.f1.textbox.value
      		 y=document.f1.password.value
      		 if(!patrn.exec(x)) 
      		 {
      		 	 alert("username is not valid (please input email form)");
      		 	 return false
      		 }
      		 else if(y.length<8){
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
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            Statement    stmt2;
            Statement    stmt3;
            Statement    stmt4;
            ResultSet    rs;
            ResultSet    rs2;
            ResultSet    rs3;
            ResultSet    rs4;
           
            String loginUser=null;
            String count="0";
            String price="0.00";
            
            if (!session.isNew()) loginUser=(String)session.getAttribute("username");
            if (session.getAttribute("count")!=null) count=(String)session.getAttribute("count");
            if (session.getAttribute("price")!=null) price=(String)session.getAttribute("price");
            
            
            //out.print(session.getAttribute("username"));
            
            String       uname="project";
            String       passwd="880224";
            String       NewReleases="select title,imagename,price,book_id from book order by book_id desc";
            String		 bestseller="select title,imagename,price,book_id from bestseller";  
            String		 special="select title,imagename,price,specialprice,book_id from specialproducts";
            String		 recommend="select title,imagename,description,book_id from recommend";
			//String query2="select * from users where username='"+loginUser+"' and password='"+loginPassword+"'";
            
            //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                stmt = con.createStatement();
                stmt2 = con.createStatement();
                stmt3 = con.createStatement();
                stmt4 = con.createStatement();

                //*** execute query and show result
                rs = stmt.executeQuery(NewReleases);
                rs2 = stmt2.executeQuery(bestseller);
                rs3 = stmt3.executeQuery(special);
                rs4 = stmt4.executeQuery(recommend);
            
              
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
        Navigation: <span class="current">Home</span>  
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
       <%
       for(int i=0;i<3;i++){ 
		    if(!rs3.next())break;
		     %>         
		<div class="title_box">Special Products</div>  
        <div class="border_box">
        	<div class="book_title"><% out.println(rs3.getString(1)); %></div>
       		<div class="book_img"><img src="<%out.print("images/"+rs3.getString(2)); %>" alt="" title="" width="100" height="110" border="0" /></div>
       		<div class="book_price"><span class="reduce">$<% out.println(rs3.getString(3)); %></span> <span class="price">$<% out.println(rs3.getString(4)); %></span></div>
       		<form method=post action="details.jsp">
            <input type="hidden" name="id" value="<% out.print(rs3.getString(5)); %>"/>            
            <input class="btn3" type="submit" name="submit" value="Details"/>  
            </form>
        </div>  
       <%
       }
        %>
	</div>
	<!-- end of left content --> 

    <!-- center content start -->
	<div class="center_content"> 
		<%
       for(int i=0;i<3;i++){ 
		    if(!rs4.next())break;
		     %> 
    	<div class="recommended">
        <img src="<%out.print("images/"+rs4.getString(2)); %>" width="135" height="140" border="0" class="recommended_img" alt="" title="" />              	
        	<div class="recommended_details">
			    <div class="recommended_head">Recommend:<p></p></div>
       	    	<div class="recommended_title"><% out.println(rs4.getString(1)); %></div>
          	    <div class="recommended_text"><% out.println(rs4.getString(3)); %></div>
                
            <form method=post action="details.jsp">
            <input type="hidden" name="id" value="<% out.print(rs4.getString(4)); %>"/>            
            <input class="btn2" type="submit" name="submit" value="Details"/>  
            </form>
            </div>
		</div>
		<%
       }
        %>
		<div class="center_title_bar">New Releases</div>	
    	<% 
    	try{
     
            for(int i=0;i<6;i++){ 
              
               if(!rs.next())break;
                %>
         	<div class="book_box">
            <div class="center_book_box">            
                 <div class="book_title"><% out.println(rs.getString(1)); %></div>
                 <div class="book_img"><img src="<%out.print("images/"+rs.getString(2)); %>" alt="" title="" width="100" height="110" border="0" /></div>
                 <div class="book_price">$<% out.println(rs.getString(3)); %></div>                        
            </div>          
            <div class="book_details_tab">
            <form method=post action="addtocart.jsp">
            <input type="hidden" name="title" value="<% out.println(rs.getString(1)); %>"/>
            <input type="hidden" name="price" value="<% out.println(rs.getString(3)); %>"/>
			 <input type="hidden" name="book_id" value="<% out.println(rs.getString(4)); %>"/>
            <input class="btn1" type="submit" name="submit" value="Add to Cart"/>  
            </form> 
            <form method=post action="details.jsp">
            <input type="hidden" name="id" value="<% out.print(rs.getString(4)); %>"/>            
            <input class="btn2" type="submit" name="submit" value="Details"/>  
            </form>            
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

  
    	<% 
    	try{
     
            for(int i=0;i<6;i++){ 
              
               if(!rs2.next())break;
                %>
         	<div class="book_box">
         	
            <div class="center_book_box">            
                 <div class="book_title"><% out.println(rs2.getString(1)); %></div>
                 <div class="book_img"><img src="<%out.print("images/"+rs2.getString(2)); %>" alt="" title="" width="100" height="110" border="0" /></div>
                 <div class="book_price">$<% out.print(rs2.getString(3)); %></div>                        
            </div>          
            <div class="book_details_tab">
            <form method=post action="addtocart.jsp">
            <input type="hidden" name="title" value="<% out.print(rs2.getString(1)); %>"/>
            <input type="hidden" name="price" value="<% out.print(rs2.getString(3)); %>"/>
			 <input type="hidden" name="book_id" value="<% out.println(rs2.getString(4)); %>"/>
            <input class="btn1" type="submit" name="submit" value="Add to Cart"/>  
            </form> 
            <form method=post action="details.jsp">
            <input type="hidden" name="id" value="<% out.print(rs2.getString(4)); %>"/>            
            <input class="btn2" type="submit" name="submit" value="Details"/>  
            </form>
                      
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
                	<form name=f1 action="login.jsp"  method="post" onsubmit="return checkuname();">
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
            <div class="cart_icon"><a href="shoppingcart.jsp" title=""><img src="images/shoppingcart.png" alt="" title="" width="35" height="35" border="0" /></a></div>        
        </div>
        <!-- end of shopping cart -->
    
	</div>
	<!-- end of right content -->   


</div>
<!-- end of main content -->
  
<%//*** close connection
                stmt.close();
                stmt2.close();
                stmt3.close();
                stmt4.close();
                con.close(); %>
</body>
</html>