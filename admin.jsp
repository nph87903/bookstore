<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>BookStore</title>
<link rel="stylesheet" type="text/css" href="style.css" />

<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            Statement    stmt2;
            Statement    stmt3;
            ResultSet    rs;
            ResultSet    rs2;
            ResultSet    rs3;
            
            String loginUser="";
            String loginPassword="";
            if(session.getAttribute("adminname")==null)
            	loginUser=request.getParameter("textbox");
            else
            	loginUser=(String)session.getAttribute("adminname");
            if(session.getAttribute("adminpass")==null)
            	loginPassword=request.getParameter("password");
            else
            	loginPassword=(String)session.getAttribute("adminpass");
            
			String query="select * from admin where username='"+loginUser+"' and password='"+loginPassword+"'";
            String message="select * from message ";
            String orders="select * from orders ";
            
            
            
            
            String       uname="project";
            String       passwd="project";
          
            //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                stmt = con.createStatement();
                stmt2 = con.createStatement();
                stmt3 = con.createStatement();
                

                //*** execute query and show result
                rs = stmt.executeQuery(query);
                rs2 = stmt2.executeQuery(orders);
                rs3 = stmt3.executeQuery(message);
                
              
                
                try{
                if(rs.next()){
					session.setAttribute("admin",rs.getString(1));
					//out.print("<script type='text/javascript'>alert('success login');</script>");
				}
                else                
                	out.print("<script type='text/javascript'>alert('fail');document.location.href='index.jsp';</script>");              
                }
                catch(Exception e){
                out.print("<script type='text/javascript'>alert('error ');document.location.href='index.jsp';</script>"); 
                e.printStackTrace();
                }
                
               
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
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          <form method=post action="index.jsp">
		  <input class="btn4" type="submit" name="submit" value="Logoff"/>
		  </form>
 
          </ul>
        </div>
	</div>
</div>
<!-- end of header -->
<!-- main content start -->


<div class="center_content">
	<div class="center_title_bar">Add a New Book</div>
	<form method=post action="addbook.jsp">

	<div class="insert_book_bar">
		
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Auther:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="author" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="price" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;ISBN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="ISBN" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Category:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="category_id" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Publisher:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="publisher" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Year:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="year" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Image Name:&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="imagename" VALUE="">
			</div>
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Description:&nbsp;<textarea class="contact_textarea" NAME="description" ROWS="5" ></textarea>
			</div>
		
		 <div class="form_row">
		   <input type="submit" name="submit" value="Add"/>&nbsp;&nbsp;&nbsp;
		   <input type="reset"  value="Clear">
     </div>
	</div>
	</form>
	
	<div class="center_title_bar">Delete Book </div>
	<form method=post action="deletebook.jsp">
	<div class="book_delete">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
		</div>
		<div class="form_row">
			<input type="submit" name="submit" value="Delete"/>&nbsp;&nbsp;&nbsp;
		  <input type="reset"  value="Clear">
		</div>
	</div>
	</form>
	
	<div class="center_title_bar">Edit book in recommend</div>
	<form method=post action="addtorecommend.jsp">
	<div class="book_delete">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title of book to add:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
		</div>
		<div class="form_row">
			<input type="submit" name="submit" value="Add"/>&nbsp;&nbsp;&nbsp;
		  <input type="reset"  value="Clear">
		  </div>
	</div>
	</form>
	<form method=post action="deletefromrecommend.jsp">
	<div class="book_delete">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title of book to delete:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
		</div>
		<div class="form_row">
			<input type="submit" name="submit" value="Delete"/>&nbsp;&nbsp;&nbsp;
		  <input type="reset"  value="Clear">
		</div>
	</div>
	</form>
	
	
	<div class="center_title_bar">Edit book in bestseller</div>
	<form method=post action="addtobestseller.jsp">
	<div class="book_delete">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title of book to add:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
		</div>
		<div class="form_row">
			<input type="submit" name="submit" value="Add"/>&nbsp;&nbsp;&nbsp;
		  <input type="reset"  value="Clear">
		  </div>
	</div>
	</form>
	<form method=post action="deletefrombestseller.jsp">
	<div class="book_delete">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title of book to delete:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
		</div>
		<div class="form_row">
			<input type="submit" name="submit" value="Delete"/>&nbsp;&nbsp;&nbsp;
		  <input type="reset"  value="Clear">
		</div>
	</div>
	</form>
	
	
	
</div>
	<!-- end of center content -->

    <!-- right content start -->
    <div style="width:360px; float:left; padding:0px;">

		<!-- member start -->
		
		
		<!-- end of member -->

        <div class="center_title_bar">Recently Orders</div>
        <%
	int i=0;
	while(rs2.next()){
	i++;
	 %>
	<form method=post action="deleteorder.jsp">
	<div class="order_box">
		<div class="user_order">
			<div style="padding:5px 0 5px 0; color:#a53d17;">No.<%out.print(i); %>&nbsp;&nbsp;<%out.print(rs2.getString(1));%> </div>
			<div style="padding:5px 0 5px 0; color:#a53d17;"><%out.print(rs2.getString(2));%></div>
			<div style="padding:5px 0 5px 0; color:#a53d17;"><%out.print(rs2.getString(3));%></div>
			<input type="hidden" name="dates" value="<% out.print(rs2.getString(1)); %>"/> 
			<input  type="submit" name="cancel2" value="Processed"/>
		</div>
	</div>
	</form>
	<% 
	}
	%>
	<div class="center_title_bar">Contact Message</div>
	<%
	i=0;
	while(rs3.next()){
	i++;
	 %>
	<form method=post action="deletemessage.jsp">
	<div class="contact_massage">
		<div style="padding:5px 0 5px 0; color:#a53d17;">No.<%out.print(i); %>&nbsp;&nbsp;Name:<%out.print(rs3.getString(1));%>&nbsp; Email:<%out.print(rs3.getString(2));%>&nbsp; Phone:<%out.print(rs3.getString(3));%>&nbsp; Company:<%out.print(rs3.getString(4));%> </div>
		<div style="padding:5px 0 5px 0; color:#a53d17;">Message:<%out.print(rs3.getString(5));%> </div>
		<input type="hidden" name="email" value="<% out.print(rs3.getString(2)); %>"/> 
		<input  type="submit" name="submit" value="Processed"/>
	</div>
	</form>
	<% 
	}
	%>

    <div class="center_title_bar">Edit book in special</div>
	<form method=post action="addtospecail.jsp">
	<div class="book_delete">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title of book to add:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Specail price of this book:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="specialprice" VALUE="">
		</div>
		<div class="form_row">
			<input type="submit" name="submit" value="Add"/>&nbsp;&nbsp;&nbsp;
		  <input type="reset"  value="Clear">
		  </div>
	</div>
	</form>
	<form method=post action="deletefromspecial.jsp">
	<div class="book_delete">
		<div style="width:335px; clear:both; padding:5px 0 5px 0; color:#a53d17;">
			&nbsp;&nbsp;&nbsp;Title of book to delete:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT style="width: 70%" TYPE="text" NAME="title" VALUE="">
		</div>
		<div class="form_row">
			<input type="submit" name="submit" value="Delete"/>&nbsp;&nbsp;&nbsp;
		  <input type="reset"  value="Clear">
		</div>
	</div>
	</form>    

	</div>
	<!-- end of right content -->


</div>
<!-- end of main content -->

<% 		stmt.close();
		stmt2.close();
		stmt3.close();
                
        con.close(); %>
</body>
</html>