
<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            Statement    stmt2;
            ResultSet    rs;
            ResultSet    rs2;
            
            int book_id=0;
            String title=request.getParameter("title");
            String author=request.getParameter("author");
            String price=request.getParameter("price");
            String ISBN=request.getParameter("ISBN");
            int 	category_id=Integer.parseInt(request.getParameter("category_id"));
            String publisher=request.getParameter("publisher");
            String year=request.getParameter("year");
            String imagename=request.getParameter("imagename");
            String description=request.getParameter("description");
            
            String maxid="select book_id from book order by book_id desc";
			
            
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
                try{

                //*** execute query and show result
                rs = stmt.executeQuery(maxid);
                
                
                if(rs.next()){
                	String temp=rs.getString(1);
                	
                	book_id=Integer.parseInt(temp)+1;
                
                
                String query="INSERT INTO book VALUES ("+book_id+",'"+title+"','"+author+"','"+price+"','"+ISBN+"',"+category_id+",'"+publisher+"','"+year+"','"+imagename+"','"+description+"' )";
                rs2 = stmt2.executeQuery(query);
                
              
                
                
                	session.setAttribute("adminname","admin");
                	session.setAttribute("adminpass","admin");
					out.print("<script type='text/javascript'>alert('success');document.location.href='admin.jsp';</script>");
				}
                else  { 
                	session.setAttribute("adminname","admin");
                	session.setAttribute("adminpass","admin");             
                
                	out.print("<script type='text/javascript'>alert('fail');document.location.href='admin.jsp';</script>");    
                	}          
                }
                catch(Exception e){
                	session.setAttribute("adminname","admin");
                	session.setAttribute("adminpass","admin");
                out.print("<script type='text/javascript'>alert('fail');document.location.href='admin.jsp';</script>");
                e.printStackTrace();
                }
                
                stmt.close();
                stmt2.close();
                
                con.close();
%>
