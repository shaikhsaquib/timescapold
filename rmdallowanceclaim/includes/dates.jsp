
<%
		String months[ ]		= {"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
		
		String currMonth		=	"";
		String selMonthText		=	"";
		
		String runningMonth		=	"";		
		int todayDate			=	0;
		int currYear			=	0;
		int lastYear			=	0;
		int secndlastYear		=	0;
		
		int selYear				=	0;

		GregorianCalendar today = new GregorianCalendar();
		
		todayDate				= today.get(Calendar.DAY_OF_MONTH);
		currYear				= today.get(Calendar.YEAR);
		currMonth				= months[today.get(Calendar.MONTH) + 1] ;
		
		String option			= ( String ) request.getParameter("selYear");
		String selMonth			= ( String ) request.getParameter("selMonth");
		

		if ( option	==	null ) {
			
			selMonthText		= months[today.get(Calendar.MONTH)+1];
			selMonth			= today.get(Calendar.MONTH)+1 +"";
			selYear				= currYear;		
			runningMonth		= selMonth;	

		} else {

			selYear				= Integer.parseInt(option);
			selMonthText		= months[ Integer.parseInt(selMonth) ];
			runningMonth		= selMonth;

		}

		lastYear				= currYear	-	1;		
		secndlastYear			= currYear	-	2;		
		
		String monYear			= currMonth	+"-"+ currYear;
		String selMonYear		= selMonthText	+"-"+ selYear;

		int  maxMonthDay		= today.getActualMaximum(Calendar.DAY_OF_MONTH); 

		String currDate			= todayDate	+	"-" + 	currMonth + "-" + currYear;
%>