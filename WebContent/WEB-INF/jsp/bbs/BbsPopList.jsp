<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.listen.bbs.vo.*" %>

<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/ajax-bbsview.js"></script>
<script type="text/javascript" src="js/ajax-comment.js"></script>
<SCRIPT>
$(function() {
    $('.img').click(function() {
      clearTbody();
       var d = $(this).attr("src");
       var c = $(this).attr("contents");
       var bbs_seq = $(this).attr("name");
       var bbs_likeCount = $(this).attr("bbs_goodCount");

       $('.like-label').text(bbs_likeCount); // ���� ��ư ������ DB�� ��������
       $("#modalImg").attr("src", d);
       $("#bbs_seq").attr("value", bbs_seq);
       var modalContent = document.getElementById("modalContent");
       modalContent.innerHTML = c;
       
       ajaxBbsAdd();
    });

    var addForm = $('#addForm');
    $('#addWriteBtn').click(function() {
       ajaxBbsAdd();
    });
   
   $('.radiobox').click(function(){
       $('#radioForm').submit();
    })
});
</SCRIPT>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Listen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    
      .jb-content {
           width: 375px;
           padding: 5px;
           margin-bottom: 25px;        
           float: left;
      }
      
      .image{
           width: 350px;
           padding: 10px;
           margin-bottom: 10px;        
           float: left;
           border: 1px solid #bcbcbc;
           background-color:gray;
      }
       
       .chkbox{
             width:13px;
             height:13px;
             vertical-align:text-top
      }
      
      label{
            vertical-align:-3px
      }
      .dd{
      top: 0;
  right:50%;
  bottom: 0;
  left: 0;
  z-index: 1040;
      }
      
   </style>
</head>
<% 
   if(session.getAttribute("email")!=null 
      && session.getAttribute("LoginYn") != null 
      &&((String)session.getAttribute("LoginYn")).equals("Y"))
      {
      String email = (String)session.getAttribute("email");
      String userIp = request.getRemoteAddr();
      String selectItem = (String)session.getAttribute("selectItem");
      System.out.println("Age jsp ���� "+selectItem);

%>
<body>

   <FORM name="radioForm"  method="post" id="radioForm" action="/bbPopList.listen">
   <div class="check" style="margin-left:700px;">
   <input class="radiobox" name="selectItem" type="radio" style="width:17px;height:17px;" value="bbs_add_count" <%if(selectItem.equals("bbs_add_count")){%> checked<%}%>>&nbsp;<label for="">���</label>&nbsp;&nbsp;&nbsp;
   <input class="radiobox" name="selectItem" type="radio" style="width:17px;height:17px;" value="goodCount" <%if(selectItem.equals("goodCount")){%> checked<%}%>>&nbsp;<label for="">����</label>&nbsp;&nbsp;&nbsp;
   <input class="radiobox" name="selectItem" type="radio" style="width:17px;height:17px;" value="bbs_hitCount" <%if(selectItem.equals("bbs_hitCount")){%> checked<%}%>>&nbsp;<label for="">��ȸ��</label>
   </div>
   </FORM>
  <div class="divAll">
   <div class="jb-content" style="margin-left: 10%;">    

<%

      int i =0;
      ArrayList bbsIntList = (ArrayList)request.getAttribute("bbsIntList");
       for(i=0; i<10; i++)
       {  
         BbsVo bbsVo = (BbsVo)bbsIntList.get(i);
         int bbs_seq = (int)bbsVo.getBbs_seq();
         String bbs_contents = (String)bbsVo.getBbs_contents();
         int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
         String reg_email = (String)bbsVo.getReg_email();
         String path = (String)bbsVo.getPath();
         String save_name = (String)bbsVo.getSave_name();
         int goodCount = (int)bbsVo.getGoodCount();
       int add_count = (int)bbsVo.getAdd_count();
         if(i%3==0){
   %>
       <div class="image " id="imgRootDiv" style="margin-left: 15px;">
           <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
         data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
         width=300 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>
      
           <div class="text2">
              <table>
                 <TR height="70%">
                    <TD>
                         <H3><%=bbs_contents%></h3>
                      </TD>
                   </TR>
                   <TR height="30%">
                      <TD align="left">
                            ��ȸ�� : <%=bbs_hitCount%> / <br>
                            ���ƿ� : <%=goodCount %> / <br>
                            ��ۼ� : <%=add_count %>
                         
                      </TD>
                   </TR>
                </table>
                
             </div>
      </div>
         <%
      }
     }
      
   %>
       </div>      
      <div class="jb-content" style="margin-left: 5px;">                 
   <%
      
      for(i=0; i<=10; i++)
      {  
         BbsVo bbsVo = (BbsVo)bbsIntList.get(i);
         int bbs_seq = (int)bbsVo.getBbs_seq();
         String bbs_contents = (String)bbsVo.getBbs_contents();
         int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
         String reg_email = (String)bbsVo.getReg_email();
         String path = (String)bbsVo.getPath();
         String save_name = (String)bbsVo.getSave_name();
         int goodCount = (int)bbsVo.getGoodCount();
         int add_count = (int)bbsVo.getAdd_count();

         
         if(i%3==1){
   %>
       <div class="image" id="imgRootDiv"  style="margin-left: 30px;">
           <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
         data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
         width=300 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>
      
           <div class="text2">
              <table>
                 <TR height="70%">
                    <TD>
                         <H3><%=bbs_contents%></h3>
                      </TD>
                   </TR>
                   <TR height="30%">
                      <TD align="left">
                            ��ȸ�� : <%=bbs_hitCount%> / <br>
                            ���ƿ� : <%=goodCount %> / <br>
                            ��ۼ� : <%=add_count %>
                      </TD>
                   </TR>
                </table>
                
             </div>
      </div>
         <%
      }
     }
      
   %>
   </div>
   
   <nav id="page-nav">
     <a href="pages/2.html"></a>
   </nav>
      
        
    <div class="jb-content" style="margin-left: 15px;">                 
   <%
      for(i=0; i<10; i++)
      {  
         BbsVo bbsVo = (BbsVo)bbsIntList.get(i);
         int bbs_seq = (int)bbsVo.getBbs_seq();
         String bbs_contents = (String)bbsVo.getBbs_contents();
         int bbs_hitCount = (int)bbsVo.getBbs_hitCount();
         String reg_email = (String)bbsVo.getReg_email();
         String path = (String)bbsVo.getPath();
         String save_name = (String)bbsVo.getSave_name();
         int goodCount = (int)bbsVo.getGoodCount();
         int add_count = (int)bbsVo.getAdd_count();
         if(i%3==2){
   %>
       <div class="image " id="imgRootDiv" style="margin-left: 33px;" >
           <img class="img imageShadow" name="<%=bbs_seq%>" data-toggle="modal" 
         data-target="#myModal"  style="cursor:pointer" src="<%=path%>/<%=save_name%>" 
         width=310 data-img-url="<%=path%>/<%=save_name%>" contents="<%=bbs_contents%>"/>
      
           <div class="text2">
              <table>
                 <TR height="70%">
                    <TD>
                         <H3><%=bbs_contents%></h3>
                      </TD>
                   </TR>
                   <TR height="30%">
                      <TD align="left">
                            ��ȸ�� : <%=bbs_hitCount%> / <br>
                            ���ƿ� : <%=goodCount %> / <br>
                             ��ۼ� : <%=add_count %>
                      </TD>
                   </TR>
                </table>
                
             </div>
      </div>
         <%
         }
      }
    
   %></div>
</div>
<!-- Modal �� List-->
<div class="modal fade" style="width: 100%" id="myModal" tabindex="-1"
   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <div class="lcard-button-wrapper">
               <div class="lcard-button">
                  <div class="container animation-1">
                     <div class="heartImg" alt="0"></div>
                  </div>
                  <span class="ng-binding">���ƿ�</span>
               </div>
               <div class="like-label">0</div>
            </div>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body" style="background-color:gray;margin-left:0;border:30px white solid">
            <img id="modalImg" class="imageShadow" src="#" width="500" />
            <div class="text3">
               <H3>
                  <label id="modalContent"></label>
               </H3>
            </div>
         </div>


         <div class="modal-footer">
            <!-- ����� ���� �κ� -->
            <DIV id="comment-list">
               <TABLE id="comment_table" bgcolor="#FFFAFA" border="2"
                  cellspacing="0" cellpadding="0">
                  <TBODY id="comment_table_body"></TBODY>
               </TABLE>
            </DIV>
            <!-- ��� ���� �κ� -->
            <FORM name="addForm" id="addForm" method="post"
               action="/bbsAdd.listen">
               <div class="comment-textarea">
                  <textarea name="content" id="comment"
                     class="ng-pristine ng-valid ng-touched" placeholder="��� �����ϼ���?"
                     style="overflow: hidden; word-wrap: break-word; height: 50px;"></textarea>
               </div>
               <INPUT type="hidden" name="bbs_seq" id="bbs_seq" value="">
               <INPUT type="hidden" name="reg_ip" id="reg_ip" value="<%=userIp%>">
               <INPUT type="hidden" name="reg_email" id="reg_email"
                  value="<%=email%>">
            </FORM>
            <BR>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="addWriteBtn">�Խ�</button>
         </div>
      </div>
   </div>
</div>


<!-- Modal ��� ���� Ȯ��-->
<div class="modal fade comment-delete-modal" style="width: 100%" tabindex="-1" role="dialog"
   aria-labelledby="mySmallModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-sm" style="margin-top:200px">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">����Ȯ��</h4>
         </div>
         <div class="modal-body">
            <label for="recipient-name" class="control-label">���� ���� �Ͻðڽ��ϱ�?</label>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">����</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
         </div>
      </div>
   </div>
</div>
</body>
</html>         

<%} %>          