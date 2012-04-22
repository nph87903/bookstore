
<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            
            ResultSet    rs;
            
            

            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String email=request.getParameter("email");
            

            
            
			String query="INSERT INTO users VALUES ('"+username+"','"+password+"','"+email+"')";
            
            String       uname="project";
            String       passwd="880224";
          
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
                
                
              
                
              
                
                
                	
					out.print("<script type='text/javascript'>alert('success');document.location.href='index.jsp';</script>");
				
               }
                catch(Exception e){
                	
                out.print("<script type='text/javascript'>alert('fail');document.location.href='index.jsp';</script>");
                e.printStackTrace();
                }
                
                stmt.close();
               
                
                con.close();
%>
