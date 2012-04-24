<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>BookStore</title>
<link rel="stylesheet" type="text/css" href="style.css" />

<%-- JSP  --%>

<%!public static String orderString(String noOrderString){
		String[] words = noOrderString.split(";");
		String orderedString ="";
		try {
		     java.util.Arrays.sort(words);
		     for(String s: words){
		    	 orderedString+=s+";";
		     }
		     

		      }
		    catch(Exception e){
		      e.printStackTrace();
		    }

		
		return orderedString;
		
	}
%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            
            Statement    stmt4;            
            ResultSet    rs4;
			 String       uname="project";
            String       passwd="880224";
			
			 String 		id=request.getParameter("id");
			
			
           
            String loginUser=null;
            String count="0";
            String price="0.00";
			
			String price2 = price;
            
            if (!session.isNew()) loginUser=(String)session.getAttribute("username");
            if (session.getAttribute("count")!=null) count=(String)session.getAttribute("count");
            if (session.getAttribute("price")!=null) price=(String)session.getAttribute("price");
			
             if (session.getAttribute("price2")!=null) 
			 {
			 price2=(String)session.getAttribute("price2");
			
			 }
			else
			{
			price2 = price;
			}
			
            String items="";
            if (session.getAttribute("cart")!=null)  items=(String)session.getAttribute("cart");
			 
            String[] item=items.split(";");
			String book_id="";
			String temp = "";
			
		if (item.length>0)
			{
			 temp=item[0];	
			if ( !temp.equals(""))
			 book_id = temp.substring(temp.indexOf("book_id:")+8,temp.indexOf("----"))+";";
			}
			
			if (item.length >1)
			{
			for (int i=1;i<item.length;i++)
			{ temp= item[i];
			
			 
			if (i < item.length)
			{ book_id = book_id+temp.substring(temp.indexOf("book_id:")+8,temp.indexOf("----"))+";";
			  											}
			else 
               	{
				book_id = book_id+ temp.substring(temp.indexOf("book_id:")+8,temp.indexOf("----"))+";";		
				}
				}
				}
				
			book_id = orderString(book_id);
				
            int length=item.length;
			
			
			 
	   String       associate = "select itemy from ASSOCIATIONRULES where itemx = '"+book_id+"'";
	   
	     //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                
                stmt4 = con.createStatement();

                //*** execute query and show result
                
                rs4 = stmt4.executeQuery(associate);            
           
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
	<div class="center_title_bar"> Shopping Cart</div>

	<div class="insert_book_box">
		 <div class="form_row">
		 	<% 
		 	for(int i=0;i<length;i++){
		 	if (!item[i].equals(""))
			{
		 	%>
			<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;<%out.print("#"+(i+1)+": "+item[i]); %>
			</div>
			<form method="post" action="removecart.jsp">
			<input type="hidden" name="number" value="<%out.print(i); %>"/>
		    <input class="btn4" type="submit" name="submit" value="remove"/>&nbsp;&nbsp;&nbsp;
		    </form>
		    <%
		    }
			}
		     %>

     </div>
	</div>
	
	<%
	if (Double.parseDouble(price2) < Double.parseDouble(price))
	{
	
	%>
		 
	&nbsp;&nbsp;&nbsp;Total Price: $ <%out.println(price);%>
	<br>
	&nbsp;&nbsp;&nbsp;<span style= "color:red">Promotional Price:$ <%out.println(price2);%></span>
	<%
	}
	else 
	{
	
	if (!count.equals("0"))
	{
	%>
	<div class="form_row">
	
	&nbsp;&nbsp;&nbsp;Total Price:$<%	
	out.println(price); 
	%>
	<br>
	<br>
	
	<div class="center_title_bar"> Promotional Code</div>
	<br><br><br>
	<form method=post action="update_price.jsp">
	<input type="text" style  = "height: 20px;
	font-size: 14px;font-family: Vernada;padding: 0 30px;color: #fff;
				overflow: visible;
				border: 1px solid #000;
				background: #159dcc;
				-moz-border-radius: 20px;
				-webkit-border-radius: 20px;
				border-radius: 20px;" name="code">
	<input type="hidden" name="price" value="<%out.print(price); %>"/>
	<input type="submit" name="update" value="Apply"/>&nbsp;&nbsp;&nbsp;
	</form>
	</div>
	
	<%
	}
	}
	%>
	
	<div style = "position:relative;top:10px; left:0px;">
	<% 
	
	   if (rs4.next())
	   	   {
		  
		   String[] splitStr = rs4.getString(1).split(";"); 
		   for ( int i = 0;i < splitStr.length;i++)
		   
		   {
		   Statement    stmt6;
		   ResultSet    rs6;
		   
		    stmt6 = con.createStatement();

                //*** execute query and show result
                
                rs6 = stmt6.executeQuery("select * from book where book_id='"+splitStr[i]+"'");
				
				if (rs6.next())
				{
				
				%>
	
	<div class="center_title_bar"> Frequently Bought Together</div>
	<%
	}
	
	break;
	}
	}
	%>
	
	
	<%
	stmt4 = con.createStatement();
	rs4 = stmt4.executeQuery(associate);  
	   if (rs4.next())
	   	   {
		   String[] splitStr = rs4.getString(1).split(";"); 
		   for ( int i = 0;i < splitStr.length;i++)
		   
		   {
		   Statement    stmt6;
		   ResultSet    rs6;
		   
		    stmt6 = con.createStatement();

                //*** execute query and show result
                
                rs6 = stmt6.executeQuery("select * from book where book_id='"+splitStr[i]+"'");
				
				if (rs6.next())
				{
				
				%>
				
			<div class="book_box">
				<div class="center_book_box">            
                 <div class="book_title"><% out.println(rs6.getString(2)); %></div>
                 <div class="book_img"><img src="<%out.print("images/"+rs6.getString(9)); %>" alt="" title="" width="100" height="110" border="0" /></div>
                 <div class="book_price">$<% out.println(rs6.getString(4)); %></div>                        
            </div>          
            <div class="book_details_tab">
            <form method=post action="addtocart.jsp">
            <input type="hidden" name="title" value="<% out.println(rs6.getString(2)); %>"/>
            <input type="hidden" name="price" value="<% out.println(rs6.getString(4)); %>"/>			
			 <input type="hidden" name="book_id" value="<% out.println(rs6.getString(1)); %>"/>
            <input class="btn1" type="submit" name="submit" value="Add to Cart"/>  
            </form> 
            <form method=post action="details.jsp">
            <input type="hidden" name="id" value="<% out.print(rs6.getString(1)); %>"/>            
            <input class="btn2" type="submit" name="submit" value="Details"/>  
            </form>            
            </div>                     
       		</div>
				
				<%
				
				}
				stmt6.close();
		   
		   }
		  
	   }
	%>
	</div>
	
	
	

	<form method="post" action="placeorder.jsp"  >
	<div class="center_title_bar">Shipping address</div>
	<div class="insert_book_box">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Full Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="Full Name" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Address Line 1:<INPUT style="width: 70%" TYPE="text" NAME="Address Line 1" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Address Line 2:<INPUT style="width: 70%" TYPE="text" NAME="Address Line 2" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="City" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="State" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Zip:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="Zip" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Country:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="Country" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Phone Number:<INPUT style="width: 70%" TYPE="text" NAME="Phone Number" VALUE="">
			</div>
     </div>

	<div class="center_title_bar">Payment information</div>

	<div class="insert_book_box">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
		<h3>&nbsp;&nbsp;&nbsp;Credit or debit card</h3>
		<p>&nbsp;&nbsp;&nbsp;Enter your card information</p>
		</div>

		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Card #:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 70%" TYPE="text" NAME="cardnumber" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;pin  #:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT style="width: 20%" TYPE="text" NAME="cardnumber" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Name On Card:<INPUT style="width: 70%" TYPE="text" NAME="nameoncard" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Expiration Date:<INPUT style="width: 70%" TYPE="text" NAME="expirationdate" VALUE="">
			</div>

		 <div class="form_row">
		 	<input type="hidden" name="items" value="<% out.print(items); %>"/>
		 	
		   <input class="btn4" type="submit" name="submit" value="Place Your Order"/>&nbsp;&nbsp;&nbsp;
		   </div>
	</div>
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
            Total: <span class="price">$<% out.print(price2); %></span>
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