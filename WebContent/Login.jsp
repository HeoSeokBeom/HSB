<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>


<HTML>
	<HEAD>
		<TITLE>Login</TITLE>
<%
	if(request.getParameter("error") != null)
	{
%>
<SCRIPT>
		window.alert("�߸��� �����Դϴ�.");
</SCRIPT>
<%
	}
%>
		<SCRIPT language="JavaScript">
				function loginAction()
				{
					var f = document.form;
					var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
					
					
					if(f.id.value == "")
					{
						window.alert("ID�� �ݵ�� �Է��ؾ� �մϴ�.");
						f.id.focus();
						return false;
					}
					if(regex.test(f.id.value) === false)
					{
						alert("��ȿ�� �̸��� ������ �ƴմϴ�");
						return false;
					}
					f.submit();
				}

				function logoutAction()
				{
					window.alert("�α׾ƿ� �Ǿ����ϴ�");
					location.href="Login.jsp";
				}
		</SCRIPT>
	</HEAD>

	<BODY>
		<CENTER>
			<FONT size="4" color="blue"><B>�α���</B></FONT><BR>
			<HR>
<%
	if(session.getAttribute("LoginYn") != null && ((String)session.getAttribute("LoginYn")).length()>0 && ((String)session.getAttribute("LoginYn")).equals("Y"))
	{
		String id = (String)session.getAttribute("id");
%>
			<TABLE border=0>
				<TR>
					<TD>
						�ݰ����ϴ�. <%= id%> ��!
						<BR>
						�����Ϸ� �Ǽ���~~!
					</TD>
				</TR>
					<TR>
						<TD align="center">
							<INPUT type="button" value="Logout" onclick="logoutAction();" style="cursor:hand">
						</TD>
					</TR>
			</TABLE>
<%
	}
	else
	{
%>
			<TABLE border=0>
				<FORM name="form" action="loginAction.listen" method="post">
					<TR><TD>User ID(E-mail) : </td><td><input type="text" name="id"></TD></TR>
					
					<TR>
						<TD colspan="2" align="center">
							<INPUT type="button" value="Submit" onclick="loginAction();">
							<INPUT type="reset" value="Reset" >
						</TD>
					</TR>
				</FORM>
			</TABLE>
<%
	}
%>
			<HR>
		</CENTER>
	</BODY>
</HTML>