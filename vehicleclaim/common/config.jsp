<%--
 -- @(#)config.jsp
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments	Business Configuration Parameters for Investment Declaration
 -- @author		Vikrant Desai
 -- @version 	1.00
 --%>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>

<%
	// This parameter file has to be defined every year
	
	Hashtable faYearHash		 = new Hashtable();
	Hashtable startProposedHash	 = new Hashtable();
	Hashtable endProposedHash	 = new Hashtable();
	Hashtable startActualHash	 = new Hashtable();
	Hashtable endActualHash		 = new Hashtable();
	Hashtable periodBeginHash	 = new Hashtable();
	Hashtable periodEndHash		 = new Hashtable();
	Hashtable entlTransHash		 = new Hashtable();
	
	GregorianCalendar thisDay = new GregorianCalendar( );
	int currMonth=0;
	int currYear=0;

	currMonth = thisDay.get(Calendar.MONTH);
	currYear =  thisDay.get(Calendar.YEAR);
	
	String faStartYear = "";
	String faEndYear   = "";
	String faYear	   = "";
	String entlCode	   = "TEL";
	

	if(currMonth >= 3 && currMonth <= 11){
		faStartYear = Integer.toString(currYear);
		faEndYear   = Integer.toString(currYear+1);
	}
	else if(currMonth >= 0 && currMonth <= 2){
		faStartYear = Integer.toString(currYear-1);
		faEndYear   = Integer.toString(currYear);
	}

	faYear	    = faStartYear.substring( 2,faStartYear.length() ) + faEndYear.substring( 2,faEndYear.length() ) ;

	// Populate the Hashtable for Financial Year
	// Populate the Start Period for accepting Proposed Investment Declarations
	// Populate the End Period for accepting Proposed Investment Declarations
	// Populate the Start Period for accepting Actual Investment Declarations
	// Populate the End Period for accepting Actual Investment Declarations
	// Populate the start of the year and the end of the year
	for(int jj=0; jj< companiesList.size(); jj++){
		
		String tmpArr[] = (String[])companiesList.get(jj);

		faYearHash.put(tmpArr[2], faYear);
		startProposedHash.put(tmpArr[2], "01-APR-" + faStartYear);
		endProposedHash.put(tmpArr[2], "01-DEC-" + faStartYear);
		startActualHash.put(tmpArr[2], "01-JAN-" + faEndYear);
		endActualHash.put(tmpArr[2], "01-MAR-" + faEndYear);
		periodBeginHash.put(tmpArr[2], "01-APR-" + faStartYear);
		periodEndHash.put(tmpArr[2], "31-MAR-" + faEndYear);

	}

	
	// Populate the entitle code and transaction code
	entlTransHash.put("MED", "183");
	entlTransHash.put("TEL", "415");
%>
