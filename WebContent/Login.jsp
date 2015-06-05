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
		window.alert("잘못된 정보입니다.");
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
						window.alert("ID를 반드시 입력해야 합니다.");
						f.id.focus();
						return false;
					}
					if(regex.test(f.id.value) === false)
					{
						alert("유효한 이메일 형식이 아닙니다");
						return false;
					}
					f.submit();
				}

				function logoutAction()
				{
					window.alert("로그아웃 되었습니다");
					location.href="Login.jsp";
				}
		</SCRIPT>
	</HEAD>

	<BODY>
		<CENTER>
			<FONT size="4" color="blue"><B>로그인</B></FONT><BR>
			<HR>
<%
	if(session.getAttribute("LoginYn") != null && ((String)session.getAttribute("LoginYn")).length()>0 && ((String)session.getAttribute("LoginYn")).equals("Y"))
	{
		String id = (String)session.getAttribute("id");
%>
			<TABLE border=0>
				<TR>
					<TD>
						반갑습니다. <%= id%> 님!
						<BR>
						좋은하루 되세요~~!
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