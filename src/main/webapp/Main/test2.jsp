
<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	String nowPage = request.getParameter("nowPage");
	String nowBlock = request.getParameter("nowBlock");
	String loginNick = (String)session.getAttribute("m_nickname");
	String noticeCheck;
%>
<c:set var="loginNick" value="${ m_nickname }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/MVCBoard/style.css"/>
<title>Insert title here</title>
</head>
<body>
<center>
<table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr height="40"> 
    <td width="41%" style="text-align: left"> &nbsp;&nbsp;&nbsp; 
    	<h1>�Խ���</h1>
    </td>
    <td width="57%">&nbsp;</td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><div align="center"><hr></div></td>
  </tr>
  <tr> 
    <td colspan="3"><div align="center"> 
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="20" colspan="3"></td>
          </tr>
          <tr> 
            <td colspan="3" valign="top">
            <div align="center"> 
                <table width="100%" height="373" border="0" cellpadding="0" cellspacing="1" class="border1">
                  <tr> 
                    <td width="13%" height="29" bgcolor="#e4e4e4" class="text2">
                    	<div align="center">�� �� ��</div>
                    </td>
                    <td width="34%" bgcolor="#f5f5f5" style="text-align: left">
                    	
                    <%	if(loginNick == null){//�α��� ���� �ʾ�����
                    	 %>
                    	<input type="text" name="writer" size="20" class="text2" />
                    <%}else{ %>
                    	<input type="text" name="writer" size="20" class="text2" value="<%=loginNick%>" readonly />
                    <%} %>
                    <!-- 0321 ��¿�: ������ ��� ������ �ۼ��� �� �ִ� üũ�ڽ� �߰� -->
                    <c:if test="${ loginNick == 'admin' }">
                   		&nbsp;����۷� ����<input type="checkbox" name="noticeCheck" id="noticeCheck">
                    </c:if>
                    </td>
                    </tr>
                    <tr>
                    <td width="13%" height="29" bgcolor="#e4e4e4" class="text2">
                    	<div align="center">�� ��й�ȣ</div>
                    </td>
                     <td width="34%" bgcolor="#f5f5f5" style="text-align: left">
                    	<input type="password" name="password" size="20"/>
                    </td>
                   </tr>
                             
                  <tr> 
                    <td height="31" bgcolor="#e4e4e4" class="text2">
                    	<div align="center">�&nbsp;&nbsp;&nbsp;��</div>
                    </td>
                    <td colspan="3" bgcolor="#f5f5f5" style="text-align: left">
                    	<input type="text" name="title" size="70" id="title_"/>
                    </td>
                  </tr>
                  <tr> 
                    <td bgcolor="#e4e4e4" class="text2">
                    	<div align="center">�� &nbsp;&nbsp; ��</div>
                    </td>
                    <td colspan="3" bgcolor="#f5f5f5" style="text-align: left">
                    	<textarea name="content" rows="15" cols="100"></textarea>
                    	<p id="resultInput"></p>
                    </td>
                  </tr>
                </table>
              </div>
              </td>
          </tr>
          <tr> 
            <td colspan="3">&nbsp;</td>
          </tr>
          <tr> 
            <td width="48%">
            <!-- ��� ��ư -->
            <div align="right">
            	<a href="" id="registration1">
            		<img src="<%=contextPath%>/eq/img/okwrite.png" width="100px" border="0"/>
           		</a>
            </div>
            </td>
            <td width="10%">
            <!-- ��Ϻ��� -->
            <div align="center">
            	<a href="" id="list">
            		<img src="<%=contextPath%>/eq/img/listgo.png" width="100px" border="0"/>
            	</a>
            </div>
            </td>
            <td width="42%" id="resultInsert"></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>
</form>
</center>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script type="text/javascript">
		
		$("#list").click(function(event) {
			event.preventDefault();
			//board���̺� ����� ��� �ȸ �ϴ� ��û!
			location.href = "<%=contextPath%>/com/listByRecent.bo?nowPage=<%=nowPage%>&nowBlock=<%=nowBlock%>";
			
		})
		
	
	
		//��� ����� �Է��ϰ� ��� �̹��� ���ΰ� �ִ� <a>�±׸� Ŭ�� �����
		$("#registration1").click(function(event) {
			event.preventDefault();
			
			//�ۼ��� ��� �Է��� <input>� ������
			var writer = $("input[name=writer]").val();
			//������ �Է¹޾� ��´�.
			var title = $("input[name=title]").val();
			//�۳���� �Է¹޾� ��´�.
			var content = $("textarea[name=content]").val();
			//�ۺ�й�ȣ�� �Է¹޾� ��´�.
			var pass = $("input[name=password]").val();
			
			if(writer == "" || title == "" || content == "" || pass == ""){
				
				$("#resultInput").text("�ۼ���� ��� �Է��Ͽ� �ּ���!").css("color","red");
				
			}else{
				if($("#noticeCheck").is(":checked")) {
					$.ajax({
						type:"post",
						async:true,
							url:"<%=contextPath%>/com/noticePro.bo",
						data:{
							w : writer,
							t : title,
							c : content,
							p : pass
						},
						dataType : "text",
						success:function(data){
							console.log(data);
							
							if(data == "1"){
								alert("�� ��� �Ϸ�!");
								location.href = "<%=contextPath%>/com/listByRecent.bo?nowPage=<%=nowPage%>&nowBlock=<%=nowBlock%>";
							}else{//"0"
								$("#resultInsert").text("�� �ۼ� ����!").css("color","red");
							}
						}
						
					});
				} else {
					$.ajax({
						type:"post",
						async:true,
							url:"<%=contextPath%>/com/writePro.bo",
						data:{
							w : writer,
							t : title,
							c : content,
							p : pass
						},
						dataType : "text",
						success:function(data){
							console.log(data);
							
							if(data == "1"){
								alert("�� ��� �Ϸ�!");
								location.href = "<%=contextPath%>/com/listByRecent.bo?nowPage=<%=nowPage%>&nowBlock=<%=nowBlock%>";
							}else{//"0"
								$("#resultInsert").text("�� �ۼ� ����!").css("color","red");
							}
						}
						
					});
				}
			}
		})
		
	</script>
</body>
</html>

