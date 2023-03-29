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
    	<img src="<%=contextPath%>/board/images/board02.gif" width="150" height="30">
    </td>
    <td width="57%">&nbsp;</td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><div align="center"><img src="<%=contextPath%>/board/images/line_870.gif" width="870" height="4"></div></td>
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
                    	<div align="center">작 성 자</div>
                    </td>
                    <td width="34%" bgcolor="#f5f5f5" style="text-align: left">
                    	
                    <%	if(loginNick == null){//로그인 하지 않았을경우
                    	 %>
                    	<input type="text" name="writer" size="20" class="text2" />
                    <%}else{ %>
                    	<input type="text" name="writer" size="20" class="text2" value="<%=loginNick%>" readonly />
                    <%} %>
                    <!-- 0321 정태영: 관리자의 경우 공지글을 작성할 수 있는 체크박스 추가 -->
                    <c:if test="${ loginNick == 'admin' }">
                   		&nbsp;공지글로 쓰기<input type="checkbox" name="noticeCheck" id="noticeCheck">
                    </c:if>
                    </td>
                    </tr>
                    <tr>
                    <td width="13%" height="29" bgcolor="#e4e4e4" class="text2">
                    	<div align="center">글 비밀번호</div>
                    </td>
                     <td width="34%" bgcolor="#f5f5f5" style="text-align: left">
                    	<input type="password" name="password" size="20"/>
                    </td>
                   </tr>
                             
                  <tr> 
                    <td height="31" bgcolor="#e4e4e4" class="text2">
                    	<div align="center">제&nbsp;&nbsp;&nbsp;목</div>
                    </td>
                    <td colspan="3" bgcolor="#f5f5f5" style="text-align: left">
                    	<input type="text" name="title" size="70" id="title_"/>
                    </td>
                  </tr>
                  <tr> 
                    <td bgcolor="#e4e4e4" class="text2">
                    	<div align="center">내 &nbsp;&nbsp; 용</div>
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
            <!-- 등록 버튼 -->
            <div align="right">
            	<a href="" id="registration1">
            		<img src="<%=contextPath%>/eq/img/okwrite.png" width="100px" border="0"/>
           		</a>
            </div>
            </td>
            <td width="10%">
            <!-- 목록보기 -->
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
			//board테이블에 저장된 글을 조회 하는 요청!
			location.href = "<%=contextPath%>/com/listByRecent.bo?nowPage=<%=nowPage%>&nowBlock=<%=nowBlock%>";
			
		})
		
	
	
		//새글 정보를 입력하고 등록 이미지를 감싸고 있는 <a>태그를 클릭 했을때
		$("#registration1").click(function(event) {
			event.preventDefault();
			
			//작성자 명을 입력할 <input>을 선택해
			var writer = $("input[name=writer]").val();
			//글제목을 입력받아 얻는다.
			var title = $("input[name=title]").val();
			//글내용을 입력받아 얻는다.
			var content = $("textarea[name=content]").val();
			//글비밀번호를 입력받아 얻는다.
			var pass = $("input[name=password]").val();
			
			if(writer == "" || title == "" || content == "" || pass == ""){
				
				$("#resultInput").text("작성란을 모두 입력하여 주세요!").css("color","red");
				
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
								alert("글 등록 완료!");
								location.href = "<%=contextPath%>/com/listByRecent.bo?nowPage=<%=nowPage%>&nowBlock=<%=nowBlock%>";
							}else{//"0"
								$("#resultInsert").text("글 작성 실패!").css("color","red");
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
								alert("글 등록 완료!");
								location.href = "<%=contextPath%>/com/listByRecent.bo?nowPage=<%=nowPage%>&nowBlock=<%=nowBlock%>";
							}else{//"0"
								$("#resultInsert").text("글 작성 실패!").css("color","red");
							}
						}
						
					});
				}
			}
		})
		
	</script>
</body>
</html>