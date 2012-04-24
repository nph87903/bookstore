
<%-- JSP directive --%>
    <%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*,java.text.DecimalFormat" %>
<% 
			String url   = "jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
            Connection   con;
            Statement    stmt;
			DecimalFormat   df   =   new   DecimalFormat( "##.## "); 

            
            ResultSet    rs;
            
            
            
            String code=request.getParameter("code");
			 String price=request.getParameter("price");
            
            String coupon="select * from coupons where code= '"+code+"'";
			
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
                rs = stmt.executeQuery(coupon); 
				 if ( rs.next())
                	{
					
					double dis = Double.parseDouble(rs.getString(2));
					double newprice =  Double.parseDouble(price);
					newprice = dis*newprice;
					session.setAttribute("price2",df.format(newprice));
					out.print("<script type='text/javascript'>alert('success');document.location.href='shoppingcart.jsp';</script>");
				}
				else {
				session.setAttribute("price",price);
				out.print("<script type='text/javascript'>alert('the promotional code is not available');document.location.href='shoppingcart.jsp';</script>");
				}
                          
                }
                catch(SQLException e){
				session.setAttribute("price2",price);
                out.print("<script type='text/javascript'>alert('fail');document.location.href='shoppingcart.jsp';</script>");
                e.printStackTrace();
                }
                
                stmt.close();
                
                
                con.close();
%>
