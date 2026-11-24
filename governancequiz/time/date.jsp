<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
		int m,s;
		String m1 = "";
		String s1 = "";

		if(session.getAttribute("mnts")==null)
		{
			session.setAttribute("mnts","29");		
		}
		if(session.getAttribute("secs")==null)
		{
			session.setAttribute("secs","60");		
		}
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        Date date = new Date();
    	out.println("&nbsp;&nbsp;"+dateFormat.format(date));


		
		m1 = (String)session.getAttribute("mnts");		
		s1 = (String)session.getAttribute("secs");
		m = Integer.parseInt(m1);
		s = Integer.parseInt(s1);

		if( m == 0)
		{
			s = s - 1;
			s1 = s+"";
			if(s >= 0)
			{
				session.setAttribute("secs",s1);
				session.setAttribute("mnts",m1);
				if(s<10)
				{
					if(m<10)
					{
						out.println("  " +"Time Left : "+"0"+m+":"+"0"+s);
					}
					else
					{
						out.println("  " +"Time Left : "+m+":"+"0"+s);
					}
				}
				else
				{
					if(m<10)
					{
						out.println("  " +"Time Left : "+"0"+m+":"+s);
					}
					else
					{
						out.println("  " +"Time Left : "+m+":"+s);
					}
				}
				
			}
			else
			{
                // code end here 
			}
		}
		else
		{
			s = s - 1;
			s1 = s+"";
			if(s == 0)
			{
				s = 59;
				m = m - 1;
				s1 = s+"";
				m1 = m+"";
				session.setAttribute("secs",s1);
				session.setAttribute("mnts",m1);
				if(s<10)
				{
					if(m<10)
					{
						out.println("  " +"Time Left : "+"0"+m+":"+"0"+s);
					}
					else
					{
						out.println("  " +"Time Left : "+m+":"+"0"+s);
					}
				}
				else
				{
					if(m<10)
					{
						out.println("  " +"Time Left : "+"0"+m+":"+s);
					}
					else
					{
						out.println("  " +"Time Left : "+m+":"+s);
					}

				}
				
			}
			else
			{
				session.setAttribute("secs",s1);
				session.setAttribute("mnts",m1);
				if(s<10)
				{
					if(m<10)
					{
						out.println("  " +"Time Left : "+"0"+m+":"+"0"+s);
					}
					else
					{
						out.println("  " +"Time Left : "+m+":"+"0"+s);
					}
				}
				else
				{
					if(m<10)
					{
						out.println("  " +"Time Left : "+"0"+m+":"+s);
					}
					else
					{
						out.println("  " +"Time Left : "+m+":"+s);
					}
				}
				
			}
		}
%>
<% 
		
	/*	if(session.getAttribute("endTime")==null)
		{
				session.setAttribute("endTime",dateFormat.format(date));
		}
		else
		{*/
				
		//}
		if(session.getAttribute("startTime")==null)
		{
				// update date in database

				session.setAttribute("startTime",dateFormat.format(date));
		}
		session.setAttribute("endTime",dateFormat.format(date));
%>