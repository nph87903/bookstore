<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*,java.util.Date,java.text.SimpleDateFormat" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
            
            ResultSet    rs;
            
            if(session.getAttribute("username")==null)
            	out.print("<script type='text/javascript'>alert('please login');document.location.href='shoppingcart.jsp';</script>");
            else{
            Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String dates = dateFormat.format( now ); 

			String email=  (String)session.getAttribute("username");
            String name=request.getParameter("Full Name");
            String addr1=request.getParameter("Address Line 1");
            String addr2=request.getParameter("Address Line 2");
            String city=request.getParameter("City");
            String state=request.getParameter("State");
            String zip=request.getParameter("Zip");
            String country=request.getParameter("Country");
            String phone=request.getParameter("Phone Number");
            String items=request.getParameter("items");
           
            String address="Full Name:"+name+"; Address:"+addr1+","+addr2+"; City:"+city+"; State:"+state+"; Zip:"+zip+"; Country:"+country+"; Phone:"+phone;
            
            
            
            
             String       uname="project";
            String       passwd="project";
          
            //*** Load the jdbc-odbc bridge driver
                Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

                //*** Attempt to connect to a driver.
                con = DriverManager.getConnection(url, uname, passwd);

                //***  Create a Statement object so we can submit
                //***  SQL statements to the driver
                stmt = con.createStatement();
                 int orderId = 0;
             String query1 = "SELECT max(order_id) from orders";
                 rs = stmt.executeQuery(query1);
                 if(rs.next()) 
                 {  
                 
					if (rs.getString(1)== "Null" )
             {
             orderId = 0;
             }
            else 
             
            {
            orderId =  Integer.parseInt(rs.getString(1));
             orderId++;
             }
             
          }
               try{
			String query="INSERT INTO orders VALUES ('"+orderId+"','"+email+"','"+dates+"','"+items+"','"+address+"' )";
            out.print(query);  
            
                //*** execute query and show result
                rs = stmt.executeQuery(query);             
                session.invalidate(); 
                	out.print("<script type='text/javascript'>alert('success');document.location.href='index.jsp';</script>");    
                	          
                }
                catch(Exception e){
                	
                out.print("<script type='text/javascript'>alert('fail');document.location.href='index.jsp';</script>");
                e.printStackTrace();
                }
                
                stmt.close();
                
                
                con.close();
       }
%>
