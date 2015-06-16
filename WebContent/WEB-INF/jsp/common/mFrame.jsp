<%@ page contentType="text/html;charset=euc-kr" %>
<%
	String mMainUrl = "/WEB-INF/jsp/common/mMain.jsp"; 
	System.out.println("mFrame.jsp");
	if(request.getAttribute("mMainUrl") != null && ((String)request.getAttribute("mMainUrl")).length() > 0)
	{
		mMainUrl = (String)request.getAttribute("mMainUrl");
		System.out.println("mMainUrl: "+mMainUrl);
	}

%>
<HTML>
	<HEAD>
		 <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
	
		<TITLE>������ ���������� �͸�SNS - Listen</TITLE>
		
		 <!-- ��Ʈ��Ʈ�� -->
    	<LINK href="/css/bootstrap.css" rel="stylesheet">
    	
    	<!-- Main CSS -->
    	<LINK href="/css/common.css" rel="stylesheet" type="text/css"/>
    	
    	<!-- JQuery -->
		<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
	</HEAD>
	
	<BODY style="margin:0px">
	 <!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <SCRIPT src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></SCRIPT>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <SCRIPT src="/js/bootstrap.min.js"></SCRIPT>
    
	<center>
		<div id="wrap">
			<div id="header"> 
				<jsp:include page ="mTop.jsp"/>
			<div id="middle"> 
				<div id="content">
					<jsp:include page="<%=mMainUrl%>" flush="true" />
			<div id="footer"> 
				<jsp:include page ="Bottom.jsp"/>
			</div>
		</div>
	</center>	
	</BODY>
<HTML>

