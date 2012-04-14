
<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            ResultSet    rs;
            
            String loginUser=request.getParameter("textbox");
            String loginPassword=request.getParameter("password");
            
			String query="select * from users where username='"+loginUser+"' and password='"+loginPassword+"'";
            
            String       uname="project";
            String       passwd="project";
          
            //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                stmt = con.createStatement();

                //*** execute query and show result
                rs = stmt.executeQuery(query);
                
              
                
                try{
                if(rs.next()){
					session.setAttribute("username",rs.getString(1));
					out.print("<script type='text/javascript'>alert('success login');document.location.href='index.jsp';</script>");
				}
                else                
                	out.print("<script type='text/javascript'>alert('fail');document.location.href='index.jsp';</script>");              
                }
                catch(Exception e){
                e.printStackTrace();
                }
                
                stmt.close();
                
                con.close();
%>
