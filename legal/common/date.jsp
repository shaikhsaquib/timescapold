<%

		GregorianCalendar today		= new GregorianCalendar();
        int todayDay				= today.get(Calendar.DAY_OF_MONTH);

		String months[ ]			={"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
		String monthsStr[ ]			= {"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};


		String todayMon				= months[today.get(Calendar.MONTH)+1];
		String todayMonStr			= monthsStr[today.get(Calendar.MONTH) + 1] ;

		int  todayMonInt = Integer.parseInt(todayMon);

		int  todayYear				= today.get(Calendar.YEAR);

		String  todayYearStr		= todayYear+"";
		String  todayMon1		= "";

		todayYearStr				= todayYearStr.substring(2);

		int  nextYear				= todayYear+1;
		int  previousYear			= todayYear-1;
		int  prevPreviousYear		= todayYear-2;

		String  nextYearStr			= nextYear+"";
		String  previousYearStr		= previousYear+"";
		String  prevPreviousYearStr	= prevPreviousYear+"";

		nextYearStr					= nextYearStr.substring(2);
		previousYearStr				= previousYearStr.substring(2);
		prevPreviousYearStr			= prevPreviousYearStr.substring(2);

		String todayDay1			= Integer.toString(todayDay);

		if(todayDay1.length()==1){

			todayDay1 = "0"+todayDay1;
		}

		if(todayMon.length()==1){

			todayMon1 = "0"+todayMon;
		}

		
		String dayMonYear			= todayDay1 + "-" + todayMon1 + "-" + todayYear;


		String quarMonth0 ="";
		String quarMonth1 ="";

		String quarPrevMonth0 ="";
		String quarCurrMonth1 ="";

		quarCurrMonth1 = monthsStr[today.get(Calendar.MONTH) + 1] +"-"+todayYearStr;

		if(("1").equals(todayMon))
		{
			quarPrevMonth0 = monthsStr[12] +"-"+previousYearStr;
		}else
		{
			quarPrevMonth0 = monthsStr[today.get(Calendar.MONTH)] +"-"+todayYearStr;
		}

		if(("12").equals(todayMon))
		{
			quarMonth0 = monthsStr[1] +"-"+nextYearStr;
			quarMonth1 = monthsStr[2] +"-"+nextYearStr;		

		}else if(("11").equals(todayMon))
		{
			quarMonth0 = monthsStr[today.get(Calendar.MONTH) + 2] +"-"+todayYearStr;
			quarMonth1 = monthsStr[1] +"-"+nextYearStr;
		}else
		{

			quarMonth0 = monthsStr[today.get(Calendar.MONTH) + 2] +"-"+todayYearStr;
			quarMonth1 = monthsStr[today.get(Calendar.MONTH) + 3] +"-"+todayYearStr;
		}

		/*System.out.println("quarMonth0---"+quarMonth0);
		System.out.println("quarMonth1---"+quarMonth1);

		System.out.println("quarPrevMonth0---"+quarPrevMonth0);
		System.out.println("quarCurrMonth1---"+quarCurrMonth1);*/

 
%>