<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.StringTokenizer,java.io.*" %>
<html>
<head>
<body>
<%
  String token = "";
  String afroz = "";
   StringTokenizer st=new StringTokenizer("mr rahul mejari adad");
   while(st.hasMoreTokens()) 
   {
	   token = st.nextToken();        
	   token = String.format( "%s%s",Character.toUpperCase(token.charAt(0)),token.substring(1));       
	   //out.println(token + "<br>");
	   afroz = afroz + token;
	}
     out.println(afroz);
 %>
    </body>
    </head>
    </html>