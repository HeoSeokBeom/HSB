<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<% System.out.println("���Ⱑ �α���"); %>

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
                  window.alert("ID(email)�� �ݵ�� �Է��ؾ� �մϴ�.");
                  f.id.focus();
                  return false;
               }
               if(regex.test(f.id.value) === false)
               {
                  alert("��ȿ�� �̸��� ������ �ƴմϴ�");
                  return false;
               }
            /*   if(f.id.value.length < 4 || f.id.value.length > 20)
               {
                  window.alert("ID�� 4�� �̻� 20�� ���� �Դϴ�.");
                  f.id.select();
                  return false;
               }*/
               
               //if(!write.Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", write))
               //{
               //   window.alert("Email ������ �Է����ּ���");
               //   write.select();
               //   return false;
               //}


               f.submit();
            }

            function logoutAction()
            {
               window.alert("�α׾ƿ� �Ǿ����ϴ�");
               location.href="/Logout.listen";
            }
      </SCRIPT>
   </HEAD>

   <BODY>
      <CENTER>
         <FONT size="4" color="blue"><B>�α���</B></FONT><BR>
         <HR>
<%
System.out.println("login.jsp�α���");
   if(session.getAttribute("LoginYn") != null && ((String)session.getAttribute("LoginYn")).length()>0 &&    ((String)session.getAttribute("LoginYn")).equals("Y"))
   {
      String email = (String)session.getAttribute("email");
%>
         <TABLE border=0>
            <TR>
               <TD>
                  �ݰ����ϴ�. <%= email%> ��!
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