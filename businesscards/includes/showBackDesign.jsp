<%
	
	Hashtable backDesign = new Hashtable();
	
	/*backDesign.put("fr","FlamingRed1.jpg");
	backDesign.put("tc","TILcorporate1.jpg");
	backDesign.put("cb","CorporateBlue1.jpg");
	backDesign.put("do1","DigitalOrange1.jpg");
	backDesign.put("dc","DigitalCells1.jpg");
	backDesign.put("bs","BlueStripes1.jpg");
	backDesign.put("dw","DigitalWave1.jpg");
	backDesign.put("dp","DigitalPink1.jpg");
	backDesign.put("db","DigitalBlue1.jpg");
	backDesign.put("lg","LeafGreens1.jpg");*/

	backDesign.put("b1","NewBackSide-1.jpg");
	backDesign.put("b2","NewBackSide-2.jpg");
	backDesign.put("b3","NewBackSide-3.jpg");
	backDesign.put("b4","Back-4.jpg");
	backDesign.put("b5","Back-5.jpg");
	backDesign.put("b6","Back-6.jpg");
	backDesign.put("b7","wwmback.jpg");
	backDesign.put("b8","NewBackside-Option1.jpg");
	backDesign.put("b9","NewBackside-Option2.jpg");
	backDesign.put("b10","MX-Back.jpg");


	 
%>
		 <img   width = '394' height = '238' src="../images/<%= backDesign.get(backDesignVal)%>" class ="ImageBorder" border="2" cellpadding="0" cellspacing="0"> 


		<!-- <table width='394' height='238' cellpadding='0' cellspacing='0' border='1'><tr><td><img width = '394' height = '238' src='../images/"+radioValue+" '></td></tr></table>"; -->
		