
<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            Statement    stmt2;
            
            ResultSet    rs;
            ResultSet    rs2;
            
            
            
            String title=request.getParameter("title");
           
            String query="select * from book where title='"+title+"'";
            
            
            
			
            
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
                rs = stmt.executeQuery(query);
                
                while(rs.next())
                {
                	String insert="INSERT INTO  recommend VALUES ("+rs.getString(1)+",'"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"',"+rs.getString(6)+",'"+rs.getString(7)+"','"+rs.getString(8)+"','"+rs.getString(9)+"','"+rs.getString(10)+"' )";
                	rs2 = stmt2.executeQuery(insert);
                	
                
                
                }
                
                
                
                	
                
                
                
                
              
                
                
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
                stmt2.close();
                
                
                con.close();
%>
