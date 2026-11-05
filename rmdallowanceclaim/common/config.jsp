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
 -- Comments	Business Configuration Parameters for Conveyance Claim
 -- @author		Vikrant Desai
 -- @version 	1.00
 --%>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>

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

	String faStartYear = "2012";
	String faEndYear   = "2013";
	String faYear	   = "1213";
	String entlCode	   = "CNV";

	// Populate the Hashtable for Financial Year
	faYearHash.put("01", faYear);
	faYearHash.put("02", faYear);
	faYearHash.put("03", faYear);
	faYearHash.put("04", faYear);
	faYearHash.put("05", faYear);
	faYearHash.put("20", faYear);
	faYearHash.put("25", faYear);
	faYearHash.put("26", faYear);
	faYearHash.put("27", faYear);
	faYearHash.put("29", faYear);
	faYearHash.put("30", faYear);
	faYearHash.put("31", faYear);
	faYearHash.put("32", faYear);
	faYearHash.put("33", faYear);
	faYearHash.put("35", faYear);
	faYearHash.put("40", faYear);
	faYearHash.put("42", faYear);
	faYearHash.put("44", faYear);
	faYearHash.put("46", faYear);
	faYearHash.put("12", faYear);
	faYearHash.put("13", faYear);
	faYearHash.put("14", faYear);

	
	// Populate the Start Period for accepting Proposed Investment Declarations
	startProposedHash.put("01", "01-APR-" + faStartYear);
	startProposedHash.put("02", "01-APR-" + faStartYear);
	startProposedHash.put("03", "01-APR-" + faStartYear);
	startProposedHash.put("04", "01-APR-" + faStartYear);
	startProposedHash.put("05", "01-APR-" + faStartYear);
	startProposedHash.put("20", "01-APR-" + faStartYear);
	startProposedHash.put("25", "01-APR-" + faStartYear);
	startProposedHash.put("26", "01-APR-" + faStartYear);
	startProposedHash.put("27", "01-APR-" + faStartYear);
	startProposedHash.put("29", "01-APR-" + faStartYear);
	startProposedHash.put("30", "01-APR-" + faStartYear);
	startProposedHash.put("31", "01-APR-" + faStartYear);
	startProposedHash.put("32", "01-APR-" + faStartYear);
	startProposedHash.put("33", "01-APR-" + faStartYear);
	startProposedHash.put("35", "01-APR-" + faStartYear);
	startProposedHash.put("40", "01-APR-" + faStartYear);
	startProposedHash.put("42", "01-APR-" + faStartYear);
	startProposedHash.put("44", "01-APR-" + faStartYear);
	startProposedHash.put("46", "01-APR-" + faStartYear);
	startProposedHash.put("12", "01-APR-" + faStartYear);
	startProposedHash.put("13", "01-APR-" + faStartYear);
	startProposedHash.put("14", "01-APR-" + faStartYear);

	// Populate the End Period for accepting Proposed Investment Declarations
	endProposedHash.put("01", "01-DEC-" + faStartYear);
	endProposedHash.put("02", "01-DEC-" + faStartYear);
	endProposedHash.put("03", "01-DEC-" + faStartYear);
	endProposedHash.put("04", "01-DEC-" + faStartYear);
	endProposedHash.put("05", "01-DEC-" + faStartYear);
	endProposedHash.put("20", "01-DEC-" + faStartYear);
	endProposedHash.put("25", "01-DEC-" + faStartYear);
	endProposedHash.put("26", "01-DEC-" + faStartYear);
	endProposedHash.put("27", "01-DEC-" + faStartYear);
	endProposedHash.put("29", "01-DEC-" + faStartYear);
	endProposedHash.put("30", "01-DEC-" + faStartYear);
	endProposedHash.put("31", "01-DEC-" + faStartYear);
	endProposedHash.put("32", "01-DEC-" + faStartYear);
	endProposedHash.put("33", "01-DEC-" + faStartYear);
	endProposedHash.put("35", "01-DEC-" + faStartYear);
	endProposedHash.put("40", "01-DEC-" + faStartYear);
	endProposedHash.put("42", "01-DEC-" + faStartYear);
	endProposedHash.put("44", "01-DEC-" + faStartYear);
	endProposedHash.put("46", "01-DEC-" + faStartYear);
	endProposedHash.put("12", "01-DEC-" + faStartYear);	
	endProposedHash.put("13", "01-DEC-" + faStartYear);	
	endProposedHash.put("14", "01-DEC-" + faStartYear);	
	
	// Populate the Start Period for accepting Actual Investment Declarations
	startActualHash.put("01", "01-JAN-" + faEndYear);
	startActualHash.put("02", "01-JAN-" + faEndYear);
	startActualHash.put("03", "01-JAN-" + faEndYear);
	startActualHash.put("04", "01-JAN-" + faEndYear);
	startActualHash.put("05", "01-JAN-" + faEndYear);
	startActualHash.put("20", "01-JAN-" + faEndYear);
	startActualHash.put("25", "01-JAN-" + faEndYear);
	startActualHash.put("26", "01-JAN-" + faEndYear);
	startActualHash.put("27", "01-JAN-" + faEndYear);
	startActualHash.put("29", "01-JAN-" + faEndYear);
	startActualHash.put("30", "01-JAN-" + faEndYear);
	startActualHash.put("31", "01-JAN-" + faEndYear);
	startActualHash.put("32", "01-JAN-" + faEndYear);
	startActualHash.put("33", "01-JAN-" + faEndYear);
	startActualHash.put("35", "01-JAN-" + faEndYear);
	startActualHash.put("40", "01-JAN-" + faEndYear);
	startActualHash.put("42", "01-JAN-" + faEndYear);
	startActualHash.put("44", "01-JAN-" + faEndYear);
	startActualHash.put("46", "01-JAN-" + faEndYear);
	startActualHash.put("12", "01-JAN-" + faEndYear);
	startActualHash.put("13", "01-JAN-" + faEndYear);
	startActualHash.put("14", "01-JAN-" + faEndYear);

	// Populate the End Period for accepting Actual Investment Declarations
	endActualHash.put("01", "01-MAR-" + faEndYear);
	endActualHash.put("02", "01-MAR-" + faEndYear);
	endActualHash.put("03", "01-MAR-" + faEndYear);
	endActualHash.put("04", "01-MAR-" + faEndYear);
	endActualHash.put("05", "01-MAR-" + faEndYear);
	endActualHash.put("20", "01-MAR-" + faEndYear);
	endActualHash.put("25", "01-MAR-" + faEndYear);
	endActualHash.put("26", "01-MAR-" + faEndYear);
	endActualHash.put("27", "01-MAR-" + faEndYear);
	endActualHash.put("29", "01-MAR-" + faEndYear);
	endActualHash.put("30", "01-MAR-" + faEndYear);
	endActualHash.put("31", "01-MAR-" + faEndYear);
	endActualHash.put("32", "01-MAR-" + faEndYear);
	endActualHash.put("33", "01-MAR-" + faEndYear);
	endActualHash.put("35", "01-MAR-" + faEndYear);
	endActualHash.put("40", "01-MAR-" + faEndYear);
	endActualHash.put("42", "01-MAR-" + faEndYear);
	endActualHash.put("44", "01-MAR-" + faEndYear);
	endActualHash.put("46", "01-MAR-" + faEndYear);
	endActualHash.put("12", "01-MAR-" + faEndYear);
	endActualHash.put("13", "01-MAR-" + faEndYear);
	endActualHash.put("14", "01-MAR-" + faEndYear);


	// Populate the start of the year and the end of the year
	periodBeginHash.put("01", "01-APR-" + faStartYear);
	periodBeginHash.put("02", "01-APR-" + faStartYear);
	periodBeginHash.put("03", "01-APR-" + faStartYear);
	periodBeginHash.put("04", "01-APR-" + faStartYear);
	periodBeginHash.put("05", "01-APR-" + faStartYear);
	periodBeginHash.put("20", "01-APR-" + faStartYear);
	periodBeginHash.put("25", "01-APR-" + faStartYear);
	periodBeginHash.put("26", "01-APR-" + faStartYear);
	periodBeginHash.put("27", "01-APR-" + faStartYear);
	periodBeginHash.put("29", "01-APR-" + faStartYear);
	periodBeginHash.put("30", "01-APR-" + faStartYear);
	periodBeginHash.put("31", "01-APR-" + faStartYear);
	periodBeginHash.put("32", "01-APR-" + faStartYear);
	periodBeginHash.put("33", "01-APR-" + faStartYear);
	periodBeginHash.put("35", "01-APR-" + faStartYear);
	periodBeginHash.put("40", "01-APR-" + faStartYear);
	periodBeginHash.put("42", "01-APR-" + faStartYear);
	periodBeginHash.put("44", "01-APR-" + faStartYear);
	periodBeginHash.put("46", "01-APR-" + faStartYear);
	periodBeginHash.put("12", "01-APR-" + faStartYear);
	periodBeginHash.put("13", "01-APR-" + faStartYear);
	periodBeginHash.put("14", "01-APR-" + faStartYear);


	periodEndHash.put("01", "31-MAR-" + faEndYear);
	periodEndHash.put("02", "31-MAR-" + faEndYear);
	periodEndHash.put("03", "31-MAR-" + faEndYear);
	periodEndHash.put("04", "31-MAR-" + faEndYear);
	periodEndHash.put("05", "31-MAR-" + faEndYear);
	periodEndHash.put("20", "31-MAR-" + faEndYear);
	periodEndHash.put("25", "31-MAR-" + faEndYear);
	periodEndHash.put("26", "31-MAR-" + faEndYear);
	periodEndHash.put("27", "31-MAR-" + faEndYear);
	periodEndHash.put("29", "31-MAR-" + faEndYear);
	periodEndHash.put("30", "31-MAR-" + faEndYear);
	periodEndHash.put("31", "31-MAR-" + faEndYear);
	periodEndHash.put("32", "31-MAR-" + faEndYear);
	periodEndHash.put("33", "31-MAR-" + faEndYear);
	periodEndHash.put("35", "31-MAR-" + faEndYear);
	periodEndHash.put("40", "31-MAR-" + faEndYear);
	periodEndHash.put("42", "31-MAR-" + faEndYear);
	periodEndHash.put("44", "31-MAR-" + faEndYear);
	periodEndHash.put("46", "31-MAR-" + faEndYear);
	periodEndHash.put("12", "31-MAR-" + faEndYear);
	periodEndHash.put("13", "31-MAR-" + faEndYear);
	periodEndHash.put("14", "31-MAR-" + faEndYear);


	// Populate the entitle code and transaction code
	entlTransHash.put("MED", "183");
	entlTransHash.put("TEL", "415");
	entlTransHash.put("CNV", "124");
%>
