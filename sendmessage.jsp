
<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            
            ResultSet    rs;
            
            

            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String company=request.getParameter("company");
            String message=request.getParameter("message");

            
            
			String query="INSERT INTO message VALUES ('"+name+"','"+email+"','"+phone+"','"+company+"','"+message+"' )";
            
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
                rs = stmt.executeQuery(query);
                
                
              
                
              
                
                
                	
					out.print("<script type='text/javascript'>alert('success');document.location.href='contactus.jsp';</script>");
				
               }
                catch(Exception e){
                	
                out.print("<script type='text/javascript'>alert('fail');document.location.href='contactus.jsp';</script>");
                e.printStackTrace();
                }
                
                stmt.close();
               
                
                con.close();
%>
