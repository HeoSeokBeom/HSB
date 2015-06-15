<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="com.listen.admin.vo.OpinionVo"%>
<%@ page import="java.util.ArrayList"%>


<div class="btn-group" role="group" aria-label="menuGroup">
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/notice.listen'">��������</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/background.listen'">���׸� ����</button>
	<button type="button" class="btn btn-success"
		onclick="location.href='/admin/opinion.listen'">�ǰߺ���</button>
</div>

<BR>
<BR>
<BR>
<H2 align="center">�ǰ� ����</H2>
<BR>
<BR>
<BR>

<DIV class="row" style="margin-bottom:150px;">
	<DIV class="col-md-4 col-md-offset-4">
		<%

			ArrayList opinionList = (ArrayList) request.getAttribute("opinionList");
			for (int i = 0; i < opinionList.size(); i++) {
				OpinionVo opinionVo = (OpinionVo) opinionList.get(i);
				int bbs_seq = opinionVo.getBbs_seq();
				String contents = opinionVo.getBbs_contents();
				contents = contents.replaceAll("\r\n","<BR>");
				contents = contents.replaceAll("\u0020"," ");
				String reg_email = opinionVo.getReg_email();
				String reg_date = opinionVo.getReg_date();

				int random = (int) (Math.random() * 5);
				String[] ranPoint = { "primary", "success", "info", "warning","danger" };
				String classTag = "panel-"+ranPoint[random];
		%>
		<div class="panel <%=classTag%>">
			<div class="panel-heading">
				<h3 class="panel-title" id="panel-title"><%=bbs_seq %> / <%=reg_email %> / <%=reg_date %>
				<a class="anchorjs-link" href="#panel-title"><span	class="anchorjs-icon"></span></a>
				</h3>
			</div>
			<div class="panel-body"><P><%=contents %></P></div>
		</div>
		<%
			}
		%>
	</DIV>
</DIV>