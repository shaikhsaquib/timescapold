<%
	String remarkVal="";
	String rmkReadOnly="";

	if("1".equals(roleId)){

		if(tmpArr[6]!=null && !tmpArr[6].equals(" ")&& !tmpArr[6].equals("-"))
			remarkVal=tmpArr[6];

		if("A".equals(tmpArr[16]))
			rmkReadOnly = "readOnly";

	}else if("2".equals(roleId)){

		if(tmpArr[9]!=null && !tmpArr[9].equals(" ")&& !tmpArr[9].equals("-"))
			remarkVal=tmpArr[9];

		/*if("A".equals(tmpArr[16]))
			rmkReadOnly = "readOnly";
		*/
	}

%>

<textarea name="<%=remark%>" rows="2" cols="25" class="normal" <%=rmkReadOnly%> maxlength ="255"><%=remarkVal%></textarea>