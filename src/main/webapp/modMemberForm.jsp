<%@page import="VO.MemberVO"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%  
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	String email = (String)session.getAttribute("email");
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.findMember(email);
	%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정창</title>
	<style type="text/css">
		.cls1{
			font-size: 40;
			text-align: center;
		}
	</style>
</head>

<body>
	<h1 style="text-align:center">회원정보 수정창</h1>
	<table align="center">
		<tr>
			<td width="200"><p align="right">이메일</p></td>
			<td width="400"><input type="text" name="email"
			value="<%=email%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td width="200"><p align="right">비밀번호</p></td>
			<td width="400"><input type="text" name="pw"
			value="<%=vo.getPw()%>"></td>
		</tr>
		<tr>
			<td width="200"><p align="right">이름</p></td>
			<td width="400"><input type="text" name="name"
			value="<%=vo.getName()%>"></td>
		</tr>
		<tr>
			<td width="200"><p align="right">휴대폰번호</p></td>
			<td width="400"><input type="text" name="phoneNum"
			value="<%=vo.getPhoneNum()%>"></td>
		</tr>
		
		<div colspan="4">
			<%-- name속성값 address1 부터 ~~ address5 까지 입력되어 있는 주소를 모두 합쳐서 DB에 address열에  INSERT 하자. --%>
			<br>주소<br>
			<p id="addressInput"></p>
			<input type="text" id="sample4_postcode" name="address1" placeholder="우편번호" value="<%=vo.getAddress1()%>"><br>
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
			
			<input type="text" id="sample4_roadAddress" name="address2" placeholder="도로명주소" value="<%=vo.getAddress2()%>"><br>
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3" value="<%=vo.getAddress3()%>"><br>
			
			<span id="guide" style="color:#999;display:none"></span>
			
			<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4" value="<%=vo.getAddress4()%>"><br>
			<input type="text" id="sample4_extraAddress" placeholder="참고항목"  name="address5" value="<%=vo.getAddress5()%>">
		</div>
		
		<tr>
			<td width="200"><p align="right">가입일</p></td>
			<td width="400"><input type="text" name="address"
			value="<%=vo.getM_date() %>" readonly="readonly"></td>
		</tr>
		<tr align="center">
			<td colspan="5" width="400">
			<td><a href="<%=contextPath%>/member1/update.me">수정완료</a></td>
			</td>
		</tr>
	</table>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>	
</body>
</html>