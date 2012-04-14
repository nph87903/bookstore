
<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            
            ResultSet    rs;
            
            
            
            String email=request.getParameter("email");
           
            
            String delete="delete from message where email='"+email+"'";
			
            
            String       uname="ld548674";
            String       passwd="d3329774";
          
            //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);
                
                

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                stmt = con.createStatement();
                
                try{

                //*** execute query and show result
                rs = stmt.executeQuery(delete);
                
                
                
                	
                
                
                
                
              
                
                
                	session.setAttribute("adminname","admin");
                	session.setAttribute("adminpass","admin");
					out.print("<script type='text/javascript'>alert('success');document.location.href='admin.jsp';</script>");
				
                          
                }
                catch(SQLException e){
                	session.setAttribute("adminname","admin");
                	session.setAttribute("adminpass","admin");
                out.print("<script type='text/javascript'>alert('fail');document.location.href='admin.jsp';</script>");
                e.printStackTrace();
                }
                
                stmt.close();
                
                
                con.close();
%>
