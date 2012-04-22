
<%@ page import="java.net.*, java.io.*,java.lang.*, java.sql.*, java.util.*,java.text.DecimalFormat"%>

<% 

String title=request.getParameter("title");title=title.replaceAll("\n","");

double price= Double.parseDouble(request.getParameter("price"));

String book_id = request.getParameter("book_id");book_id=book_id.replaceAll("\n","");

String item="book_id:"+book_id+"----Title:"+title+"----Price:$"+String.valueOf(price)+";";
if(session.getAttribute("cart")==null)
	session.setAttribute("cart",item);
else
	session.setAttribute("cart",(String)session.getAttribute("cart")+item);





int a = null==session.getAttribute("count")?0:Integer.parseInt(session.getAttribute("count").toString());
a=a+1 ;
session.setAttribute("count",String.valueOf(a));

DecimalFormat   df   =   new   DecimalFormat( "##.## "); 

if(session.getAttribute("price")!=null)
{
	double temp=Double.parseDouble(session.getAttribute("price").toString())+price;
	session.setAttribute("price",String.valueOf(df.format(temp)));
	}
else
	session.setAttribute("price",String.valueOf(price));
out.print("<script type='text/javascript'>alert('added to cart!');document.location.href='index.jsp';</script>");

%>

