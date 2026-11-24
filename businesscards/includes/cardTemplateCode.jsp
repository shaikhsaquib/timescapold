<%
	//out.println("test"+myList.size());
	
//out.println("emailId::"+emailId+"::");

ArrayList<String[]> emailList = new ArrayList<String[]>();
	ArrayList<String> myList = new ArrayList<String>();
	emailList = businessCardUserWebController.emailDisplay();

	for(int i=0;i<emailList.size();i++){
		String [] my = (String[]) emailList.get(i);
		
			myList.add(my[0]);
	}
	Hashtable deptCode = new Hashtable();
LinkedHashMap<String, String> map = new LinkedHashMap<String, String>(5,0.75F,true);

//out.println("compCode::"+compCode+"::"+"deptName::"+deptName+"::"+"emailId::"+emailId);

	if ("1000".equals(compCode) && !("BCCL - BRAND CAPITAL".equalsIgnoreCase(deptName)) 
	&& !("BCCL - RESPONSE".equalsIgnoreCase(deptName)) && !(myList.contains(emailId))) {

		deptCode.put("TG","Times Group");

		/*deptCode.put("ADMIN","Administration");
		deptCode.put("BT","Bombay Times");
		deptCode.put("ET","Economic Times");
		deptCode.put("MOD","Modernization");
		deptCode.put("BOMMIRR","Mumbai Mirror");
		deptCode.put("RESP","Response");
		deptCode.put("MUSIC","Times Music");
		deptCode.put("MT","Maharashtra Times");
		deptCode.put("NBT","Navabharat Times");
		deptCode.put("NBTL","Navabharat Times Lucknow");
		deptCode.put("PT","Brand Capital");
		deptCode.put("PMIRR","Pune Mirror");
		deptCode.put("AMIRR","Ahmedabad Mirror");
		deptCode.put("BMIRR","Bangalore Mirror");
		deptCode.put("TOI","Toi Editorial");
		deptCode.put("TRC","Times Red Cell");
		deptCode.put("TGC","Times Grey Cell");
		deptCode.put("IMEDIA","International Media Marketing");
		deptCode.put("TCREST","Times Crest");
		deptCode.put("NAVGUJ","Nav Gujarat Samay");
		deptCode.put("MINIMETRO","Response-Mini Metros");
		deptCode.put("ETPANACHE","ETpanache");
		//deptCode.put("ARTHA", "Artha Property Division");*/

	}else if (compCode.equals("1000") && !(deptName.equalsIgnoreCase("BCCL - BRAND CAPITAL")) 
	&& !(deptName.equalsIgnoreCase("BCCL - RESPONSE")) &&  myList.contains(emailId)) {

			deptCode.put("TG","Times Group");
			//deptCode.put("LH","Letter heads");
		
	}  else if (compCode.equals("1003")) {

		deptCode.put("BRAINBAAZI","BrainBaazi");
		deptCode.put("CRICPLAY","CricPlay");
		deptCode.put("IAG","I am Gujarat");
		deptCode.put("VK","Vijay Karnataka");
		deptCode.put("TELEGU","Telugu Samayam");
		deptCode.put("TAMIL","Tamil Samayam");
		deptCode.put("MALYALAM","Malayalam Samayam ");
		//deptCode.put("SPEAKINGTREE","SpeakingTree");
		deptCode.put("IND","India Times");
		deptCode.put("IDIVA","IDIVA");
		deptCode.put("TILC","TIL CORPORATE");
		deptCode.put("TILET","Economic Times");
		//deptCode.put("ETDP","Economic Times Demand Plus");
		//deptCode.put("GL","Guy Life");
		//deptCode.put("HMU","Health Me Up");
		//deptCode.put("LUX","Luxpresso");
		deptCode.put("TILMT","Maharashtra Times");
		//deptCode.put("TC","Times City");
		//deptCode.put("TD","Times Deal");
		deptCode.put("TILTOI","Times Of India");
		//deptCode.put("ZW","Zig Wheels");
		//deptCode.put("TWSL", "Gaana");
		//deptCode.put("iTimes", "iTimes");
		//deptCode.put("ST", "Speaking Tree");
		//deptCode.put("TIMESCARD", "Times Card");
		//deptCode.put("TP", "Times Points");
		deptCode.put("mensXP", "mensXP");
		deptCode.put("esamay", "ei-samay");
		//deptCode.put("TLabs", "TLabs");
		//deptCode.put("ETIndiatimes", " ET & Indiatimes");
		//deptCode.put("IdivaLuxHealthmeup", "Idiva Luxpresso Healthmeup");
		deptCode.put("TILNBT","Navabharat Times");
		deptCode.put("DO" , "Dine Out");
		//deptCode.put("Filmipop" , "Filmipop");
		//deptCode.put("gadgetsNow" , "gadgetsNow");
		deptCode.put("Getmeashop" , "Get Me A Shop");
		deptCode.put("Whatshotin" , "Whats HOT");
		//deptCode.put("BANDWIRE" , "Band Wire");
		//deptCode.put("ETINSURE" , "ET Insure");
		deptCode.put("AHMEDABADMIRROR" , "Ahmedabad Mirror");
		deptCode.put("BANGALOREMIRROR" , "Bangalore Mirror");
		deptCode.put("MUMBAIMIRROR" , "Mumbai Mirror");
		deptCode.put("PUNEMIRROR" , "Pune Mirror");
		
		
		deptCode.put("COLOMBIA" , "COLOMBIA");
		deptCode.put("ETPRIME" , "ETPRIME");
		deptCode.put("ETMONEY" , "ETMONEY");
		deptCode.put("NEWSPOINT" , "NEWSPOINT");
		deptCode.put("TIMESCARD" , "TIMESCARD");
		deptCode.put("TIMESPRIME" , "TIMESPRIME");
		deptCode.put("TP" , "TIMESPOINTS");
		

	}else if (compCode.equals("1048")) {

		deptCode.put("DO" , "Dine Out");
	}
    else if ((compCode.equals("1023")) && (deptName.equalsIgnoreCase("BPHCL - ARTHA SALES") || deptName.equalsIgnoreCase("Bphcl - Artha Administration")|| deptName.equalsIgnoreCase("BPHCL - ARTHA CORPORATE")|| deptName.equalsIgnoreCase("Bphcl - Artha Finance")|| deptName.equalsIgnoreCase("BPHCL - ARTHA HUMAN RESOURCES")|| deptName.equalsIgnoreCase("BPHCL - ARTHA PRODUCT")|| deptName.equalsIgnoreCase("BPHCL - ARTHA SALES SUPPORT"))) {
		deptCode.put("ARTHA", "Artha");
	}
    else if (compCode.equals("1023")) {
    	deptCode.put("BPHCL", "BPHCL");
	} else if (compCode.equals("1002")) {
    	deptCode.put("PT","Brand Capital");
	}    else if (compCode.equals("1026")) {
    	deptCode.put("TWSL", "Times Websol LTD");
	} else if (compCode.equals("1032")) {
    	deptCode.put("TWDT", "Times Websol LTD");
	} else if (compCode.equals("1030")) {
    	deptCode.put("A2Z", "A2Z Shopping");
	} else if (compCode.equals("1025")) {
    	deptCode.put("TML", "Times Mobile LTD");
	} else if (compCode.equals("1031")) {
    	deptCode.put("TMDT", "Times Mobile LTD");
	}else if (compCode.equals("1027")) {
    	deptCode.put("BBDSL", "Bennett Broadcasting & Distribution Services LTD");
	} else if (compCode.equals("1029")) {
    	deptCode.put("TCL", "TIMES CONFERENCES LTD");
	} else if (compCode.equals("1028")) {
    	deptCode.put("TCLL", "TIMES CENTRE FOR LEARNING LTD.");
	} else if (compCode.equals("1034")) {
    	deptCode.put("LFFL", "JUNGLEE PICTURES LTD.");
	} else if (compCode.equals("1033")) {
    	deptCode.put("ARECL", "ARECL");

	}else if (compCode.equals("1036")){
		deptCode.put("GGL", "Gaana");
		deptCode.put("ST", "Speaking Tree");
	}else if (compCode.equals("1040")){
		deptCode.put("ETINSURE", "ET Insure");	
	}else if (compCode.equals("1041")){
		deptCode.put("ETMONEY", "ET Money");	
	}else if (compCode.equals("1043")){
		deptCode.put("QUICKLEAP", "Quick Leap");	
	}
	else if (compCode.equals("1039")){
		deptCode.put("TIMESCONTENT", "Times Content");	
	}
	else if (compCode.equals("1007")){
		deptCode.put("WWM", "Worldwide Media");	
	}
	

	else if ((compCode.equals("1000")) && (deptName.equalsIgnoreCase("BCCL - BRAND CAPITAL")) && !(deptName.equalsIgnoreCase("BCCL - RESPONSE"))&& !(myList.contains(emailId))){

		map.put("BC","Brand Capital");
		map.put("BE","Brand Estate");
		map.put("SB","Springboard");
		map.put("BS","Brandscope");
		map.put("TG","Times Group");
		//map.put("LH","Letter heads");
	}
	else if ((compCode.equals("1000")) && (deptName.equalsIgnoreCase("BCCL - BRAND CAPITAL")) && !(deptName.equalsIgnoreCase("BCCL - RESPONSE"))
		&&  myList.contains(emailId)){

		map.put("BC","Brand Capital");
		map.put("BE","Brand Estate");
		map.put("SB","Springboard");
		map.put("BS","Brandscope");
		map.put("TG","Times Group");
		//map.put("LH","Letter heads");
	}
	else if ((compCode.equals("1000"))  && (deptName.equalsIgnoreCase("BCCL - RESPONSE")) && !(myList.contains(emailId)) ){
	deptCode.put("TGR","Response");
	//deptCode.put("LH","Letter heads");
	}
	else if ((compCode.equals("1000"))  && (deptName.equalsIgnoreCase("BCCL - RESPONSE")) && myList.contains(emailId)){
	deptCode.put("TGR","Response");
	//deptCode.put("LH","Letter heads");
	}else if(compCode.equals("1049")){
		deptCode.put("MXP" , "mxp");
	}

%>