<%@ page contentType="text/html; charset=euc-kr"%>

<% 
	String message = "adfasdfasdf";
	if(request.getAttribute("message") != null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
	
%>

<P>�۾��� ������</P>

<SCRIPT>
	$(function() {
		$('#writeBtn').click(function() {
			//var writeForm = $('#writeForm');
			$('#writeForm').submit();
			alert(<%=message%>);
		});
	});
	
</SCRIPT>

<BODY>  
<!--  
	<FORM name="writeForm" method="post" id="writeForm" enctype="multipart/form-data" action="/writePage.listen">
		<INPUT type="file" name="upload"/>
		<INPUT type="button" id="writeBtn" value="���"/>
	</FORM>
-->
	<FORM name="writeForm" id="writeForm" action="/writeSave.listen" method="post">
		<P>�Ҹ� �Է���</P>
		<INPUT type="text" name="bbs_contents" id="bbs_contents">
		
		<P><INPUT id="writeBtn" type="button" value="�Է�"></P>
	</FORM>
</BODY>