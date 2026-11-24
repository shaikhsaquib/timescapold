<%@page import="java.util.ArrayList" %>

<%
	String dropDownStyle ="small"; 
%>



<%
ArrayList typeArr = new ArrayList( );

String selectedOption = request.getParameter("selectedOption");
String isSelected = "";

if (selectedOption == null || selectedOption.equals("")) {

    selectedOption = "";
}

String type1[] = {"Full Time","Full Time","Full Time"};
String type2[] = {"Part Time","Part Time","Part Time"};
String type3[] = {"Correspondence","Correspondence","Correspondence"};

typeArr.add(type1);
typeArr.add(type2);
typeArr.add(type3);
		
%>
    <select name="studyType" class="<%=dropDownStyle%>">
        <option value="0" "SELECTED">Study Type</option>

<%

for(int ii=0 ; ii< typeArr.size( ); ii++) {

	String strTitle[ ] = (String[ ]) typeArr.get(ii);
    if ( (strTitle[0].equalsIgnoreCase(selectedOption)) || (strTitle[2].equalsIgnoreCase(selectedOption)) ) {

        isSelected = "SELECTED";
    }else{

        isSelected = "";
    }
%>
        <option value="<%=strTitle[0]%>"<%=isSelected%>><%=strTitle[2]%></option>
<%
}
%>
	</select>

