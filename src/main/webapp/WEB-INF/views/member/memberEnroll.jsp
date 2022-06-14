<%-- '회원가입에 성공하였습니다.' 팝업창..될까 ... 혹은 유효성 검사 확인 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id=enroll-container>
	<h2>회원가입</h2>
	<form name="memberEnrollFrm" method="POST">
		<table>
			<tr>
				<th>ID<sup>*</sup></th>
				<td>
					<input type="text" placeholder="10글자이상" name="memberId" id="_memberId">
					<input type="button" value="ID 중복검사" onclick="checkIdDuplicate();" />
					<input type="hidden" id="idValid" value="0" />
					<%-- #idValid 0이면 중복검사전, 1이면 중복검사통과 --%>
				</td>
			</tr>
			<tr>
				<th>숫자, 영문자 포함</th>
			<tr>
				<th>비밀번호<sup>*</sup></th>
				<td>
					<input type="password" placeholder="6글자이상" name="password" id="_password"><br>
				</td>
			</tr>
			<tr>
				<th>숫자, 영문자, 특수기호 포함</th>
			<tr>
			<tr>
				<th>비밀번호 확인<sup>*</sup></th>
				<td>	
					<input type="password" id="passwordCheck"><br>
				</td>
			</tr>  
			<tr>
				<th>이름<sup>*</sup></th>
				<td>	
				<input type="text"  name="memberName" id="memberName"><br>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>	
				<input type="date" name="birthday" id="birthday"><br/>
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc" name="email" id="email">
					<b>@</b>
					<select name="email_back">
						<option value="">-- 선택 --</option>
						<option value="naver">naver.com</option>
						<option value="daum">daum.net</option>
						<option value="gmail">gmail.com</option>
						<option value="hanmail">hanmail.net</option>
						<option value="nate">nate.com</option>
						<option value="ms">microsoft.com</option>
						<option value="outlook">outlook.com</option>
					</select>
					<input type="button" value="인증메일 받기" onclick="checkEmail();" />
				</td>
			</tr>
			<tr>
				<th>휴대폰<sup>*</sup></th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11"><br>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
			<tr>
				<th>성별 </th>
				<td>
					<input type="radio" name="gender" id="gender0" value="M">
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F" checked>
					<label for="gender1">여</label>
				</td>
			</tr>
			<tr>
				<th>회원 유형 </th>
				<td>
					<input type="radio" name="type" id="type0" value="P">
					<label for="type0">배우 및 아티스트</label>
					<input type="radio" name="type" id="type1" value="D">
					<label for="type1">제작자 및 캐스팅 담당자</label>
				</td>
			</tr>
			<tr>
				<th>관심지원분야</th>
				<td>
					<input type="checkbox" name="genre" id="genre0" value="영화"><label for="genre0">영화</label>
					<input type="checkbox" name="genre" id="genre1" value="드라마"><label for="genre1">드라마</label>
					<input type="checkbox" name="genre" id="genre2" value="뮤지컬"><label for="genre2">뮤지컬</label>
					<input type="checkbox" name="genre" id="genre3" value="연극"><label for="genre3">연극</label>
					<input type="checkbox" name="genre" id="genre4" value="재연"><label for="genre4">재연</label><br/>
				</td>
			</tr>
		</table>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
	</form>
</section>
<form name="checkIdDuplicateFrm" action="<%= request.getContextPath() %>/member/checkIdDuplicate">
	<input type="hidden" name="memberId" />
</form>
<script>
const checkIdDuplicate = () => {
	const title = "checkIdDuplicatePopup";
	const spec = "width=300px, height=200px";
	const popup = open("", title, spec);
	
	const frm = document.checkIdDuplicateFrm;
	frm.target = title; // 해당팝업에서 폼을 제출!
	frm.memberId.value = _memberId.value;
	frm.submit();
};

passwordCheck.onblur = () => {
	if(_password.value !== passwordCheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}	
	return true;
};


// 유효성 검사
document.memberEnrollFrm.onsubmit = () => {
	// memberId 영문자/숫자 10글자 이상
	if(!/^[A-Za-z0-9]{10,}$/.test(_memberId.value)){
		alert("아이디는 영문자/숫자로 10글자 이상이어야 합니다.");
		return false;
	}  
	// 중복검사여부 체크
	if(idValid.value !== "1") {
		alert("아이디 중복검사 해주세요.");
		return false;
	}
	// password 영문자/숫자/특수문자!@#$%^&*()
	if(!/^[A-Za-z0-9!@#$%^&*()]{4,}$/.test(_password.value)){
		alert("비밀번호는 영문자/숫자/특수문자!@#$%^&*()로 6글자 이상이어야 합니다.");
		return false;
	}
	if(!passwordCheck.onblur()){
		return false;		
	}
	
	// memberName
	if(!/^[가-힣]{2,}$/.test(memberName.value)){
		alert("이름은 한글 2글자이상 입력해주세요.");
		return false;
	}
	
	// phone
	if(!/^010\d{8}$/.test(phone.value)){
		alert("유효한 전화번호를 입력하세요.");
		return false;
	}
};
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
