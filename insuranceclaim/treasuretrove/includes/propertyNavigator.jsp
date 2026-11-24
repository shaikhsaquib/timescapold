<%--
 -- @(#) propertyNavigator.jsp - 26-OCT-2009 
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments -  Navigator JSP for All Property Assets
 -- @author  -  Vikrant Desai
 -- @version -  1.0
 -- This jsp is included in home.jsp
 --%>

<%
	String locationsArr[] = {"Ahmedabad","Aurangabad","Bangalore","Bhopal","Chennai","Delhi","Ghaziabad","Goa","Gurgaon","Hyderabad","Indore","Kochi","Kolhapur","Kolkata","Lucknow","Mumbai","Nagpur","Nasik","Pune","Rajkot","Sahibabad","Surat","Vadodra","",""};
	String propertiesOptionsLinks[]   = {"Data on Property","Drawing Repository","Google Map","Layouts","Location-wise Properties","Photos"};	
	String propertiesLocationsLinks[] = new String[24]; 
	
	String opt = (String) request.getParameter("opt");
	String service = "<span class = \"greysmall\"><a href = \"../web/home.html\" class = \"greysmall\"><img src=\"../images/home.gif\" border=\"0\"></a> &gt property classification";;
	if(opt == null){
		opt="NA";
	}
%>
<%
	if(opt.equals("1")){
		service = "<span class = \"greysmall\"><a href = \"../web/home.html\" class = \"greysmall\"><img src=\"../images/home.gif\" border=\"0\"></a> &gt data on property &gt location-wise property";
		propertiesLocationsLinks[0] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Ahmedabad?StartUri=/";
		propertiesLocationsLinks[1] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Aurangabad?StartUri=/";
		propertiesLocationsLinks[2] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Bangalore?StartUri=/";
		propertiesLocationsLinks[3] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Bhopal?StartUri=/";
		propertiesLocationsLinks[4] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Chennai?StartUri=/";
		propertiesLocationsLinks[5] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Delhi?StartUri=/";
		propertiesLocationsLinks[6] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Ghaziabad?StartUri=/";
		propertiesLocationsLinks[7] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Goa?StartUri=/";
		propertiesLocationsLinks[8] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Gurgaon?StartUri=/";
		propertiesLocationsLinks[9] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Hyderabad?StartUri=/";
		propertiesLocationsLinks[10] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Indore?StartUri=/";
		propertiesLocationsLinks[11] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Kochi?StartUri=/";
		propertiesLocationsLinks[12] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Kolhapur?StartUri=/";
		propertiesLocationsLinks[13] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Kolkata?StartUri=/";
		propertiesLocationsLinks[14] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Lucknow?StartUri=/";
		propertiesLocationsLinks[15] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Mumbai?StartUri=/";
		propertiesLocationsLinks[16] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Nagpur?StartUri=/";
		propertiesLocationsLinks[17] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Nashik?StartUri=/";
		propertiesLocationsLinks[18] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Pune?StartUri=/";
		propertiesLocationsLinks[19] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Rajkot?StartUri=/";
		propertiesLocationsLinks[20] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Sahibabad?StartUri=/";
		propertiesLocationsLinks[21] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Surat?StartUri=/";
		propertiesLocationsLinks[22] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Data on Property/Vadodra?StartUri=/";
		propertiesLocationsLinks[23] = "";
	}

	if(opt.equals("2")){
		service = "<span class = \"greysmall\"><a href = \"../web/home.html\" class = \"greysmall\"><img src=\"../images/home.gif\" border=\"0\"></a> &gt drawing repository &gt location-wise property";
		propertiesLocationsLinks[0] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Ahmedabad?StartUri=/";
		propertiesLocationsLinks[1] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Aurangabad?StartUri=/";
		propertiesLocationsLinks[2] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Bangalore?StartUri=/";
		propertiesLocationsLinks[3] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Bhopal?StartUri=/";
		propertiesLocationsLinks[4] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Chennai?StartUri=/";
		propertiesLocationsLinks[5] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Delhi?StartUri=/";
		propertiesLocationsLinks[6] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Ghaziabad?StartUri=/";
		propertiesLocationsLinks[7] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Goa?StartUri=/";
		propertiesLocationsLinks[8] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Gurgaon?StartUri=/";
		propertiesLocationsLinks[9] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Hyderabad?StartUri=/";
		propertiesLocationsLinks[10] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Indore?StartUri=/";
		propertiesLocationsLinks[11] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Kochi?StartUri=/";
		propertiesLocationsLinks[12] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Kolhapur?StartUri=/";
		propertiesLocationsLinks[13] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Kolkata?StartUri=/";
		propertiesLocationsLinks[14] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Lucknow?StartUri=/";
		propertiesLocationsLinks[15] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Mumbai?StartUri=/";
		propertiesLocationsLinks[16] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Nagpur?StartUri=/";
		propertiesLocationsLinks[17] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Nashik?StartUri=/";
		propertiesLocationsLinks[18] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Pune?StartUri=/";
		propertiesLocationsLinks[19] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Rajkot?StartUri=/";
		propertiesLocationsLinks[20] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Sahibabad?StartUri=/";
		propertiesLocationsLinks[21] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Surat?StartUri=/";
		propertiesLocationsLinks[22] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Dwg Repository/Vadodra?StartUri=/";
		propertiesLocationsLinks[23] = "";
	}

	if(opt.equals("3")){
		service = "<span class = \"greysmall\"><a href = \"../web/home.html\" class = \"greysmall\"><img src=\"../images/home.gif\" border=\"0\"></a> &gt google maps &gt location-wise property";		
		propertiesLocationsLinks[0] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Ahmedabad?StartUri=/";
		propertiesLocationsLinks[1] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Aurangabad?StartUri=/";
		propertiesLocationsLinks[2] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Bangalore?StartUri=/";
		propertiesLocationsLinks[3] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Bhopal?StartUri=/";
		propertiesLocationsLinks[4] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Chennai?StartUri=/";
		propertiesLocationsLinks[5] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Delhi?StartUri=/";
		propertiesLocationsLinks[6] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Ghaziabad?StartUri=/";
		propertiesLocationsLinks[7] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Goa?StartUri=/";
		propertiesLocationsLinks[8] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Gurgaon?StartUri=/";
		propertiesLocationsLinks[9] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Hyderabad?StartUri=/";
		propertiesLocationsLinks[10] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Indore?StartUri=/";
		propertiesLocationsLinks[11] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Kochi?StartUri=/";
		propertiesLocationsLinks[12] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Kolhapur?StartUri=/";
		propertiesLocationsLinks[13] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Kolkata?StartUri=/";
		propertiesLocationsLinks[14] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Lucknow?StartUri=/";
		propertiesLocationsLinks[15] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Mumbai?StartUri=/";
		propertiesLocationsLinks[16] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Nagpur?StartUri=/";
		propertiesLocationsLinks[17] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Nashik?StartUri=/";
		propertiesLocationsLinks[18] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Pune?StartUri=/";
		propertiesLocationsLinks[19] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Rajkot?StartUri=/";
		propertiesLocationsLinks[20] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Sahibabad?StartUri=/";		
		propertiesLocationsLinks[21] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Surat?StartUri=/";
		propertiesLocationsLinks[22] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Google Map/Vadodra?StartUri=/";
		propertiesLocationsLinks[23] = "";
	}

	if(opt.equals("4")){
		service = "<span class = \"greysmall\"><a href = \"../web/home.html\" class = \"greysmall\"><img src=\"../images/home.gif\" border=\"0\"></a> &gt photos &gt layouts &gt location-wise property";
		propertiesLocationsLinks[0] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Ahmedabad?StartUri=/";
		propertiesLocationsLinks[1] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Aurangabad?StartUri=/";
		propertiesLocationsLinks[2] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Bangalore?StartUri=/";
		propertiesLocationsLinks[3] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Bhopal?StartUri=/";
		propertiesLocationsLinks[4] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Chennai?StartUri=/";
		propertiesLocationsLinks[5] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Delhi?StartUri=/";
		propertiesLocationsLinks[6] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Ghaziabad?StartUri=/";
		propertiesLocationsLinks[7] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Goa?StartUri=/";
		propertiesLocationsLinks[8] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Gurgaon?StartUri=/";
		propertiesLocationsLinks[9] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Hyderabad?StartUri=/";
		propertiesLocationsLinks[10] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Indore?StartUri=/";
		propertiesLocationsLinks[11] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Kochi?StartUri=/";
		propertiesLocationsLinks[12] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Kolhapur?StartUri=/";
		propertiesLocationsLinks[13] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Kolkata?StartUri=/";
		propertiesLocationsLinks[14] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Lucknow?StartUri=/";
		propertiesLocationsLinks[15] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Mumbai?StartUri=/";
		propertiesLocationsLinks[16] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Nagpur?StartUri=/";
		propertiesLocationsLinks[17] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Nashik?StartUri=/";
		propertiesLocationsLinks[18] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Pune?StartUri=/";
		propertiesLocationsLinks[19] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Rajkot?StartUri=/";
		propertiesLocationsLinks[20] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Sahibabad?StartUri=/";		
		propertiesLocationsLinks[21] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Surat?StartUri=/";
		propertiesLocationsLinks[22] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Layouts/Vadodra?StartUri=/";
		propertiesLocationsLinks[23] = "";
	}

	if(opt.equals("5")){
		service = "<span class = \"greysmall\"><a href = \"../web/home.html\" class = \"greysmall\"><img src=\"../images/home.gif\" border=\"0\"></a> &gt location-wise property";
		propertiesLocationsLinks[0] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Ahmedabad?StartUri=/";
		propertiesLocationsLinks[1] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Aurangabad?StartUri=/";
		propertiesLocationsLinks[2] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Bangalore?StartUri=/";
		propertiesLocationsLinks[3] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Bhopal?StartUri=/";
		propertiesLocationsLinks[4] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Chennai?StartUri=/";
		propertiesLocationsLinks[5] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Delhi?StartUri=/";
		propertiesLocationsLinks[6] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Ghaziabad?StartUri=/";
		propertiesLocationsLinks[7] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Goa?StartUri=/";
		propertiesLocationsLinks[8] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Gurgaon?StartUri=/";
		propertiesLocationsLinks[9] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Hyderabad?StartUri=/";
		propertiesLocationsLinks[10] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Indore?StartUri=/";
		propertiesLocationsLinks[11] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Kochi?StartUri=/";
		propertiesLocationsLinks[12] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Kolhapur?StartUri=/";
		propertiesLocationsLinks[13] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Kolkata?StartUri=/";
		propertiesLocationsLinks[14] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Lucknow?StartUri=/";
		propertiesLocationsLinks[15] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Mumbai?StartUri=/";
		propertiesLocationsLinks[16] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Nagpur?StartUri=/";
		propertiesLocationsLinks[17] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Nashik?StartUri=/";
		propertiesLocationsLinks[18] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Pune?StartUri=/";
		propertiesLocationsLinks[19] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Rajkot?StartUri=/";
		propertiesLocationsLinks[20] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Sahibabad?StartUri=/";		
		propertiesLocationsLinks[21] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Surat?StartUri=/";		
		propertiesLocationsLinks[22] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Location Wise Properties/Vadodra?StartUri=/";
		propertiesLocationsLinks[23] = "";
	}

	if(opt.equals("6")){
		service = "<span class = \"greysmall\"><a href = \"../web/home.html\" class = \"greysmall\"><img src=\"../images/home.gif\" border=\"0\"></a> &gt photos &gt location-wise property";
		propertiesLocationsLinks[0] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Ahmedabad?StartUri=/";
		propertiesLocationsLinks[1] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Aurangabad?StartUri=/";
		propertiesLocationsLinks[2] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Bangalore?StartUri=/";
		propertiesLocationsLinks[3] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Bhopal?StartUri=/";
		propertiesLocationsLinks[4] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Chennai?StartUri=/";
		propertiesLocationsLinks[5] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Delhi?StartUri=/";
		propertiesLocationsLinks[6] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Ghaziabad?StartUri=/";
		propertiesLocationsLinks[7] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Goa?StartUri=/";
		propertiesLocationsLinks[8] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Gurgaon?StartUri=/";
		propertiesLocationsLinks[9] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Hyderabad?StartUri=/";
		propertiesLocationsLinks[10] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Indore?StartUri=/";
		propertiesLocationsLinks[11] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Kochi?StartUri=/";
		propertiesLocationsLinks[12] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Kolhapur?StartUri=/";
		propertiesLocationsLinks[13] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Kolkata?StartUri=/";
		propertiesLocationsLinks[14] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Lucknow?StartUri=/";
		propertiesLocationsLinks[15] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Mumbai?StartUri=/";
		propertiesLocationsLinks[16] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Nagpur?StartUri=/";
		propertiesLocationsLinks[17] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Nashik?StartUri=/";
		propertiesLocationsLinks[18] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Pune?StartUri=/";
		propertiesLocationsLinks[19] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Rajkot?StartUri=/";
		propertiesLocationsLinks[20] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Sahibabad?StartUri=/";		
		propertiesLocationsLinks[21] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Surat?StartUri=/";
		propertiesLocationsLinks[22] = "http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/80e02445-7ab1-2c10-a2b1-c649bce72002/Photos/Vadodra?StartUri=/";
		propertiesLocationsLinks[23] = "";
	}
//http://timescape.timesgroup.com/irj/go/km/navigation/room_extensions/cm_stores/documents/workspaces/60ef76d0-b842-2c10-2c8d-8c9c7c726d37/Photos/Vadodra?StartUri=/room_extensions/cm_stores/documents/workspaces/60ef76d0-b842-2c10-2c8d-8c9c7c726d37
%>

		<tr>
			<td colspan="100%" class="normal" align="left" height="30"><img src="../images/tr_properties.jpg" border="0"></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal" align="left" height="30"><%=service%></td>
		</tr>
