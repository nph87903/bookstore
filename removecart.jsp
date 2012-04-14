
<%@ page import="java.net.*, java.io.*,java.lang.*, java.sql.*, java.util.*,java.text.DecimalFormat"%>

<% 
String number=request.getParameter("number");
int i=Integer.parseInt(number);

String items=(String)session.getAttribute("cart");
String[] item=items.split(";");

String[] delete=item[i].split("Price:");


double price= Double.parseDouble(delete[1].substring(1));

String result="";
for(int j=0;j<item.length;j++)
{
	if(j!=i) result=result+item[j]+";";
}
session.setAttribute("cart",result);









int a = null==session.getAttribute("count")?0:Integer.parseInt(session.getAttribute("count").toString());
a=a-1 ;
session.setAttribute("count",String.valueOf(a));

DecimalFormat   df   =   new   DecimalFormat( "##.## "); 

if(session.getAttribute("price")!=null)
{
	double temp=Double.parseDouble(session.getAttribute("price").toString())-price;
	session.setAttribute("price",String.valueOf(df.format(temp)));
	}
else
	session.setAttribute("price",String.valueOf(price));
out.print("<script type='text/javascript'>alert('remove from cart!');document.location.href='shoppingcart.jsp';</script>");

%>

