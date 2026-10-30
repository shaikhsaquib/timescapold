<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.text.SimpleDateFormat,java.util.Date, java.text.DateFormat" %>

<%
		String DPATH        = EnvironmentProperties.getValue("priceapproval", "uploadPath");

	    String userEmailid  = "";

		String timescapeUId = Long.toString(timescapeUserOId);
	    		
		String tOId			= (String)request.getParameter("tOId");

		String priceid		= (String)request.getParameter("priceid");

		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewStatusOsp(tOId,priceid);

		ArrayList vStatus1	=  new ArrayList();
	
		vStatus1 			=	priceApprovalWebController.viewTechVendor(tOId,priceid);

		ArrayList vStatus2	=  new ArrayList();
	
		vStatus2 			=	priceApprovalWebController.viewComVendor(tOId,priceid);

		ArrayList vStatus3	=  new ArrayList();
	
		vStatus3 			=	priceApprovalWebController.viewEsVendor(tOId,priceid);

		ArrayList vStatus4	=  new ArrayList();
	
		vStatus4 			=	priceApprovalWebController.viewInVendor(tOId,priceid);

		ArrayList vStatus5	=  new ArrayList();
	
		vStatus5 			=	priceApprovalWebController.viewApproverDetailsOsp(tOId,priceid);

	
		String[] data1		= (String [])vStatus.get(0);
		
		String pageType		= request.getParameter("viewSAB"); 

		String[] data3      = (String [])vStatus5.get(0);
		

		  String APPROVER11_STATUS = data3[0];            
		  String APPROVER12_STATUS = data3[1];           
		  String APPROVER13_STATUS = data3[2];            
		  String APPROVER21_STATUS = data3[3];            
		  String APPROVER22_STATUS = data3[4];            
		  String APPROVER23_STATUS = data3[5];             
		  String APPROVER31_STATUS = data3[6];            
		  String APPROVER32_STATUS = data3[7];            
		  String APPROVER33_STATUS = data3[8];            
		  String APPROVER4_STATUS  = data3[9];            
		  String APPROVER5_STATUS  = data3[10];            
		  String APPROVER6_STATUS  = data3[11];           
		  String APPROVER11_DATE = data3[12];              
		  String APPROVER12_DATE = data3[13];              
		  String APPROVER13_DATE = data3[14];              
		  String APPROVER21_DATE = data3[15];              
		  String APPROVER22_DATE = data3[16];              
		  String APPROVER23_DATE = data3[17];              
		  String APPROVER31_DATE = data3[18];              
		  String APPROVER32_DATE = data3[19];              
		  String APPROVER33_DATE = data3[20];              
		  String APPROVER4_DATE  = data3[21];              
		  String APPROVER5_DATE  = data3[22];              
		  String APPROVER6_DATE  = data3[26];
		  String APPROVER34_STATUS = data3[24];
		  String APPROVER35_STATUS = data3[30];
		  String APPROVER36_STATUS = data3[32];
		  String APPROVER7_STATUS  = data3[25];
		  String APPROVER34_DATE   = data3[26];
		  String APPROVER35_DATE   = data3[31];
		  String APPROVER36_DATE   = data3[33];
		  String APPROVER7_DATE    = data3[27];
		  String APPROVER8_STATUS  = data3[28];
		  String APPROVER8_DATE	   = data3[29];


		String SANCTIONEDREFTYPE			= data1[1];
		String REFNUMBER					= data1[2];
		String DATEOFAPPROVAL				= data1[3];
		String PROJECTNAME      			= data1[4];
		String FROMCONTRACTVALIDITY         	= data1[5];
		String TOCONTRACTVALIDITY         	= data1[59];
		String DESCRIPTION			        = data1[6];
		//int negVal							= Integer.parseInt(NEGOTIATION_VALUE);
		String CONTRACTVALUE        		= data1[7];
		String USERGROUP				    = data1[8];
		String VENDORNAME					= data1[9];
		String TOTALBUDGET	                = data1[10];
		String PAYMENTTERMS				    = data1[11];
		String SANCTIONNOTE		            = data1[12];
		String SAVINGS  					= data1[13];
		String BACKGROUND		            = data1[14];
		String RECOMMENDATION				= data1[15];
		String AP11     					= data1[16];
		String AP12					        = data1[17];
		String AP13					        = data1[18];
		String AP21					        = data1[19];
		String AP22					        = data1[20];
		String AP23					        = data1[21];
		String AP31					        = data1[22];
		String AP32					        = data1[23];
		String AP33					        = data1[24];
		String AP34					        = data1[25];
		String AP35					        = data1[26];
		String AP36					        = data1[27];
		String AP4					        = data1[28];
		String AP5					        = data1[29];
		String AP6					        = data1[30];
		String AP7					        = data1[31];
		String AP8					        = data1[32];

		String APPROVER11					= data1[40];
		String APPROVER12					= data1[41];
		String APPROVER13					= data1[42];
		String APPROVER21					= data1[43];
		String APPROVER22					= data1[44];
		String APPROVER23					= data1[45];
		String APPROVER31					= data1[46];
		String APPROVER32					= data1[47];
		String APPROVER33					= data1[48];
		String APPROVER34					= data1[49];
		String APPROVER35					= data1[50];
		String APPROVER36					= data1[51];

		String APPROVER4					= data1[52];
		String APPROVER5					= data1[53];
		String APPROVER6					= data1[54];
		String APPROVER7					= data1[55];
		String APPROVER8					= data1[56];

       	String CREATEDBY					= data1[33];
		String CREATEDON					= data1[34];
		String MODIFIEDBY					= data1[35];	
		String MODIFIEDON					= data1[36];
        String COMPANY  					= data1[37];
		String STATUS						= data1[38];
		       userEmailid				    = data1[57];

        String INITIATORNAME				= data1[39];
        String INITIATEDON					= data1[34];
        String COMPANYNAME 					= data1[58];
		String compAttachmentName="compulsory";
		String addAttachmentName="additional";

    String label1="";
    String label2="";
    String label3="";
    String label4="";

	SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yyyy");

	Date createdOnDate1 = format1.parse(CREATEDON);
	//String date2Temp = format.format(new Date());
	Date changedDate1 = format1.parse("11-FEB-2022");
	Date changedDateNew1 = format1.parse("19-JUN-2023");
	
	//to show designation CEC or ED & CEC
	Date changedDate2 = format1.parse("12-JAN-2023");
	String showDesig = "CEC";
	
		if (createdOnDate1.compareTo(changedDate2) < 0 && STATUS.equals("CL") ) {
			showDesig = "CEC";
		}else if (createdOnDate1.compareTo(changedDateNew1) < 0  ) {
			showDesig = "CEC & ED";
		}else{
			showDesig = "CEO (Publishing)";
		}

		
    if(COMPANY.equals("1000"))
    {
       // label1 = "<span class=\"greyBG\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        label1 = "<span >Director B&C</span>";
        //label2 = "Executive Director";
        label2 = "COO (Publishing)";
        label3 = "COO";
        label4 = showDesig;
    }else{
        label1  ="Group Company CEO";
        //label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        label2 = "<span class=\"greyBG\">Director B&C</span>";
        //label3 = "Executive Director";
        label3 = "COO (Publishing)";
        label4 = showDesig +" - BCCL";

    }


		if (userEmailid.indexOf("@") > -1) {
        userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
	    } 

		String display						= "NA";
        String PrintRemarks = "";
		String specialReview = "";
		String rData[]       = null;
		ArrayList remarks1   = new ArrayList();
		String str1          = ""; 
		int ii = 0;	
		Hashtable remarksHash  = new Hashtable();
				   
				   remarksHash.put("PRICEID",priceid);				   
		           remarks1  = priceApprovalWebController.showRemarksNew(remarksHash);
				
		           str1      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks1.size()>0)
				   {
						
						for(ii = 0; ii<remarks1.size(); ii++)
						{
							       rData   = (String[])remarks1.get(ii);
							       str1    = str1 + "<tr><td align='left' width='20px'>";
								   str1	  = str1 + rData[3];
								   str1	  = str1 + "</td></tr>";
								   str1	  = str1 + "<tr><td height='6px'></td></tr>";
								  if(rData[05].equals("Y")){
                                   str1	  = str1 + "<tr><td align='right' class='rdatacolor'>";
                                   str1	  = str1 + "&nbsp;<font class='redsmall'>Specific Review : </font>"+ rData[2]+" To "+rData[6];
                                   str1	  = str1 + "&nbsp;&nbsp;"+ rData[4];
                                   str1	  = str1 + "</td></tr>";
                                    }else{
                                    str1	  = str1 + "<tr><td align='right' class='rdatacolor'>";
                                  if(rData[07].equals("AD")){
                                    str1	  = str1 + "&nbsp;<font class='redsmall'><b>Authorisation Changed By: "+ rData[2]+": "+rData[4]+"</b></font>";
                                    }else{
                                    str1	  = str1 + "&nbsp;"+ rData[2];
                                    str1	  = str1 + "&nbsp;&nbsp;"+ rData[4];
                                    str1	  = str1 + "</td></tr>";
                                        }
								   
								   str1	  = str1 + "<tr><td height='8px' align='center'></td></tr>";
						}
							}
							
						str1 = str1+ "</table>";
						PrintRemarks = str1;
				   }
				   else
				   {
					  PrintRemarks= "No Remarks";
				   }

//System.out.println("AP11- "+AP11);
	String Approver  = "";
	String appStatus = "";

	 if(!AP11.equals("0") && AP11.equals(tOId) && APPROVER11_STATUS.equals("L"))
	{
		Approver = "AP11";
		appStatus = APPROVER11_STATUS;

	}else if((AP11.equals("0") || APPROVER11_STATUS.equals("A")) && !AP21.equals("0") && AP21.equals(tOId) && APPROVER21_STATUS.equals("L"))
	{
		Approver = "AP21";
		appStatus = APPROVER21_STATUS;
	
	}else if(AP11.equals("0") && AP21.equals("0") && !AP31.equals("0") && AP31.equals(tOId) && APPROVER31_STATUS.equals("L"))
	{
		Approver = "AP31";
		appStatus = APPROVER31_STATUS;
	}	
	else if(!AP31.equals("0") && AP31.equals(tOId) && APPROVER21_STATUS.equals("A")&& APPROVER31_STATUS.equals("L"))
	{
		Approver = "AP31";
		appStatus = APPROVER31_STATUS;
	}
	else if(!AP31.equals("0") && AP31.equals(tOId) && AP21.equals("0") && APPROVER11_STATUS.equals("A")&& APPROVER31_STATUS.equals("L"))
	{
		Approver = "AP31";
		appStatus = APPROVER31_STATUS;
	}
	else if(!AP12.equals("0") && AP12.equals(tOId) && APPROVER31_STATUS.equals("A") && APPROVER12_STATUS.equals("L"))
	{
		Approver = "AP12";
		appStatus = APPROVER12_STATUS;
	}

	else if(!AP22.equals("0") && AP22.equals(tOId) && APPROVER22_STATUS.equals("L"))
	{
		if( (!AP12.equals("0") && APPROVER12_STATUS.equals("A"))){
            Approver = "AP22";
		    appStatus = APPROVER22_STATUS;
        }else if( (AP12.equals("0") && APPROVER31_STATUS.equals("A"))){
            Approver = "AP22";
		    appStatus = APPROVER22_STATUS;
        }
	}
	else if(!AP32.equals("0") && AP32.equals(tOId) && APPROVER32_STATUS.equals("L"))
	{
        if( !AP22.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP32";
		    appStatus = APPROVER32_STATUS;
        }else if( AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP32";
		    appStatus = APPROVER32_STATUS;
        }else if( AP12.equals("0") && AP22.equals("0") && APPROVER31_STATUS.equals("A")){
		    Approver = "AP32";
		    appStatus = APPROVER32_STATUS;
        }
        
	}
    else if(!AP35.equals("0")&& AP35.equals(tOId) && APPROVER35_STATUS.equals("L"))
	{	if( !AP32.equals("0") && APPROVER32_STATUS.equals("A")){
		    Approver = "AP35";
		    appStatus = APPROVER35_STATUS;
        }else if(AP32.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP35";
		    appStatus = APPROVER35_STATUS;
        }else if(AP32.equals("0") && AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP35";
		    appStatus = APPROVER35_STATUS;
        }else if( AP12.equals("0") && AP22.equals("0") && AP32.equals("0") && APPROVER31_STATUS.equals("A")){
		    Approver = "AP35";
		    appStatus = APPROVER35_STATUS;
        }
        
	}
   
    else if(!AP36.equals("0")&& AP36.equals(tOId) && APPROVER36_STATUS.equals("L"))
	{	if( !AP35.equals("0") && APPROVER35_STATUS.equals("A")){
		    Approver = "AP36";
		    appStatus = APPROVER36_STATUS;
        }else if(AP35.equals("0") && APPROVER32_STATUS.equals("A")){
		    Approver = "AP36";
		    appStatus = APPROVER36_STATUS;
        }else if(AP35.equals("0") && AP32.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP36";
		    appStatus = APPROVER36_STATUS;
        }else if(AP35.equals("0") && AP32.equals("0") &&  AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP36";
		    appStatus = APPROVER36_STATUS;
        }else if(AP35.equals("0") &&  AP12.equals("0") && AP22.equals("0") && AP32.equals("0") && APPROVER31_STATUS.equals("A")){
		    Approver = "AP36";
		    appStatus = APPROVER36_STATUS;
        }        
	}
    else if(!AP13.equals("0")&& AP13.equals(tOId) && APPROVER13_STATUS.equals("L"))
	{	
        if( !AP36.equals("0") && APPROVER36_STATUS.equals("A")){
             Approver = "AP13";
		    appStatus = APPROVER13_STATUS;
        }else if( AP36.equals("0") && APPROVER35_STATUS.equals("A")){
		    Approver = "AP13";
		    appStatus = APPROVER13_STATUS;
        }
        else if(AP36.equals("0") && AP35.equals("0") && APPROVER32_STATUS.equals("A")){
		    Approver = "AP13";
		    appStatus = APPROVER13_STATUS;
        }else if(AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP13";
		    appStatus = APPROVER13_STATUS;
        }else if(AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP13";
		    appStatus = APPROVER13_STATUS;
        }else if( AP12.equals("0") && AP22.equals("0") && AP32.equals("0") && AP36.equals("0") && AP35.equals("0") && APPROVER31_STATUS.equals("A")){
		    Approver = "AP13";
		    appStatus = APPROVER13_STATUS;
        }
        
	}
    else if(!AP23.equals("0")&& AP23.equals(tOId) && APPROVER23_STATUS.equals("L"))
	{	if( !AP13.equals("0") && APPROVER13_STATUS.equals("A")){
		    Approver = "AP23";
		    appStatus = APPROVER23_STATUS;
        }else if(AP13.equals("0") && APPROVER36_STATUS.equals("A")){
		    Approver = "AP23";
		    appStatus = APPROVER23_STATUS;
        }else if(AP13.equals("0") && AP36.equals("0") && APPROVER35_STATUS.equals("A")){
		    Approver = "AP23";
		    appStatus = APPROVER23_STATUS;
        }else if(AP13.equals("0") && AP36.equals("0") &&  AP35.equals("0") && APPROVER32_STATUS.equals("A")){
		    Approver = "AP23";
		    appStatus = APPROVER23_STATUS;
        }else if(AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP23";
		    appStatus = APPROVER23_STATUS;
        }else if(AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP23";
		    appStatus = APPROVER23_STATUS;
        }else if(AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && AP12.equals("0")&& APPROVER31_STATUS.equals("A")){
		    Approver = "AP23";
		    appStatus = APPROVER23_STATUS;
        }          
	}

	else if(!AP33.equals("0")&& AP33.equals(tOId) && APPROVER33_STATUS.equals("L"))
	{	if( !AP23.equals("0") && APPROVER23_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }else if(AP23.equals("0") && APPROVER13_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }else if(AP23.equals("0") && AP13.equals("0") && APPROVER36_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }else if(AP23.equals("0") && AP13.equals("0") && AP36.equals("0") && APPROVER35_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }else if(AP23.equals("0") && AP13.equals("0") && AP36.equals("0") &&  AP35.equals("0") && APPROVER32_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }else if(AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }else if(AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }else if(AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && AP12.equals("0")&& APPROVER31_STATUS.equals("A")){
		    Approver = "AP33";
		    appStatus = APPROVER33_STATUS;
        }         
	}

	else if(!AP34.equals("0")&& AP34.equals(tOId) && APPROVER34_STATUS.equals("L"))
	{	if(!AP33.equals("0") && APPROVER33_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && APPROVER23_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && AP23.equals("0") && APPROVER13_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && AP23.equals("0") && AP13.equals("0") && APPROVER36_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && AP23.equals("0") && AP13.equals("0") && AP36.equals("0") && APPROVER35_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && AP23.equals("0") && AP13.equals("0") && AP36.equals("0") &&  AP35.equals("0") && APPROVER32_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }else if(AP33.equals("0") && AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && AP12.equals("0")&& APPROVER31_STATUS.equals("A")){
		    Approver = "AP34";
		    appStatus = APPROVER34_STATUS;
        }         
	}

	
	else if(!AP4.equals("0")&& AP4.equals(tOId) && APPROVER4_STATUS.equals("L"))
	{	
	if(!AP34.equals("0") && APPROVER34_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && APPROVER33_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && APPROVER23_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && AP23.equals("0") && APPROVER13_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && AP23.equals("0") && AP13.equals("0") && APPROVER36_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && AP23.equals("0") && AP13.equals("0") && AP36.equals("0") && APPROVER35_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && AP23.equals("0") && AP13.equals("0") && AP36.equals("0") &&  AP35.equals("0") && APPROVER32_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && APPROVER22_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && APPROVER12_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }else if(AP34.equals("0") && AP33.equals("0") && AP23.equals("0") && AP13.equals("0") &&  AP36.equals("0") && AP35.equals("0") && AP32.equals("0") && AP22.equals("0") && AP12.equals("0")&& APPROVER31_STATUS.equals("A")){
		    Approver = "AP4";
		    appStatus = APPROVER4_STATUS;
        }  
	}
	
	else if(!AP5.equals("0") && AP5.equals(tOId) && APPROVER4_STATUS.equals("A") && APPROVER5_STATUS.equals("L"))
	{
		Approver = "AP5";
		appStatus = APPROVER5_STATUS;
	}
	else if(!AP6.equals("0") && AP6.equals(tOId) && APPROVER5_STATUS.equals("A") && APPROVER6_STATUS.equals("L"))
	{
		Approver = "AP6";
		appStatus = APPROVER6_STATUS;
	}
	else if(!AP6.equals("0") && AP6.equals(tOId) && AP5.equals("0") && APPROVER4_STATUS.equals("A")  && APPROVER6_STATUS.equals("L"))
	{
		Approver = "AP6";
		appStatus = APPROVER6_STATUS;
	}
	else if(!AP7.equals("0")&& AP7.equals(tOId) && APPROVER6_STATUS.equals("A")&& APPROVER7_STATUS.equals("L"))
	{	
		Approver = "AP7";
		appStatus = APPROVER7_STATUS;
	}
	else if(!AP7.equals("0")&& AP7.equals(tOId) && AP6.equals("0") && APPROVER5_STATUS.equals("A") && APPROVER7_STATUS.equals("L"))
	{	
		Approver = "AP7";
		appStatus = APPROVER7_STATUS;
	}
	else if(!AP7.equals("0")&& AP7.equals(tOId) && AP6.equals("0") && AP5.equals("0") && APPROVER4_STATUS.equals("A") && APPROVER7_STATUS.equals("L"))
	{	
		Approver = "AP7";
		appStatus = APPROVER7_STATUS;
	}
    else if(!AP8.equals("0")&& AP8.equals(tOId) && APPROVER7_STATUS.equals("A")&& APPROVER8_STATUS.equals("L"))
	{	
		Approver = "AP8";
		appStatus = APPROVER8_STATUS;
	}
    else if(!AP8.equals("0")&& AP8.equals(tOId) && AP7.equals("0") && APPROVER6_STATUS.equals("A") && APPROVER8_STATUS.equals("L"))
	{	
		Approver = "AP8";
		appStatus = APPROVER8_STATUS;
	}
	else if(!AP8.equals("0")&& AP8.equals(tOId) && AP7.equals("0") && AP6.equals("0") && APPROVER5_STATUS.equals("A") && APPROVER8_STATUS.equals("L"))
	{	
		Approver = "AP8";
		appStatus = APPROVER8_STATUS;
	}
	else if(!AP8.equals("0")&& AP8.equals(tOId) && AP7.equals("0") && AP6.equals("0") && AP5.equals("0") && APPROVER4_STATUS.equals("A") && APPROVER8_STATUS.equals("L"))
	{	
		Approver = "AP8";
		appStatus = APPROVER8_STATUS;
	}
	//out.println("My TEst :" + APPROVER4_STATUS);
    //out.println(Approver);
	//out.println("STATUS "+ STATUS);
%>