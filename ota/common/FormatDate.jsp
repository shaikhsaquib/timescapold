<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%!

	public String formatDate(String dateStr, String actualFormat, String reqdFormat) throws ParseException{
		if(dateStr == null || dateStr.equals("")) return "NA";
		SimpleDateFormat dateFormat = new SimpleDateFormat(actualFormat);	
		SimpleDateFormat requiredDateFormat = new SimpleDateFormat(reqdFormat);
		Date date = dateFormat.parse(dateStr);
		return requiredDateFormat.format(date);
	}

%>