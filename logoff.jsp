
<%@ page import="java.net.*, java.io.*, java.sql.*, java.util.*"%>

<%
//if (!session.isNew()) session.romoveAttribute("username");
session.invalidate(); 
//session.romoveAttribute("username");  
out.print("<script type='text/javascript'>alert('logoff');document.location.href='index.jsp';</script>");

%>

