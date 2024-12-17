<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/member/memberRegister.css" />

<script type="text/javascript" src="<%= request.getContextPath() %>/js/member/memberRegister.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<div class="container">

	<form name="registerFrm">

		<div style="width: 450px; margin: 10px auto;">

			<div class="text-center"
				style="margin-top: 50px; margin-bottom: 50px;">
				<h2 style="font-weight: bold;">회원가입</h2>
				(<span class="star text-danger">*</span>표시는 필수입력사항)
			</div>


			<div>

				<table id="tblMemberRegister" class="w-100">
				
					<tbody>
						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 80px; vertical-align:top;">
								<input type="text" name="userid" id="userid" maxlength="40" class="requiredInfo info" placeholder="아이디" /><br>
								<span id="idcheckResult"></span>
								<span id="useridError" class="error"></span>&nbsp;<span class="rule">(영문소문자/숫자, 5~16자)</span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 50px; vertical-align:top;">
								<input type="password" name="passwd" id="passwd" maxlength="20" class="requiredInfo info" placeholder="비밀번호" /><br>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 80px; vertical-align:top;">
								<input type="password" id="passwdcheck" maxlength="20" class="requiredInfo info" placeholder="비밀번호 확인" /><br>
								<span id="pwdError" class="error"></span>&nbsp;<span class="rule">(영문 대소문자/숫자/특수문자 조합, 8자~20자)</span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 80px; vertical-align:top;">
								<input type="text" name="name" id="name" maxlength="30" class="requiredInfo info" placeholder="성명" /><br>
								<span class="error"></span>
								<span class="rule">(한글, 2자~6자)</span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 80px; vertical-align:top;">
								<input type="text" name="email" id="email" maxlength="60" class="requiredInfo info" placeholder="이메일" /><br>
								<span class="error"></span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 80px; vertical-align:top;">
								<select name="tel1" id="tel1" style="width: 100px;" required>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
								</select>&nbsp;-&nbsp;
								<input type="text" name="tel2" id="tel2" class="info" style="width: 100px;" size="6" maxlength="4" />&nbsp;-&nbsp;
								<input type="text" name="tel3"id="tel3" class="info" style="width: 100px;" size="6" maxlength="4" /><br>
								<span class="error"></span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td>
								<input type="text" name="postcode" id="postcode" style="width: 100px;" size="6" maxlength="5" placeholder="우편번호"/>&nbsp;&nbsp;
								<%-- 우편번호 찾기 --%>
								<img src="<%= request.getContextPath() %>/images/memberRegister/b_zipcode.gif" id="zipcodeSearch" width="90" height="30" />
								<span class="error"></span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height:160px; vertical-align: top;">
								<input type="text" name="address" id="address" size="40" maxlength="200" placeholder="주소" style="margin:3px 0;" />
								<input type="text" name="extraaddress" id="extraAddress" size="40" maxlength="200" placeholder="참고항목" style="margin:3px 0;" />
								<input type="text" name="detailaddress" id="detailAddress" size="40" maxlength="200" placeholder="상세주소" style="margin:3px 0 auto 0;" />
								<span class="error"></span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 60px; vertical-align:top;">
								<label for="male" style="margin-right: 10px; margin-left: 10px; font-size: 20px;">남자</label>
								<input type="radio" name="gender" value="남" id="male" />
								<label for="female" style="margin-right: 10px; margin-left: 40px; font-size: 20px;">여자</label>
								<input type="radio" name="gender" value="여" id="female" /><br>
								<span class="error"></span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td style="height: 80px; vertical-align:top;">
								<label for="datepicker" style="font-size: 20px; margin-left: 10px; margin-right: 20px;" >생년월일</label>
								<input type="text" name="birthday" id="datepicker" maxlength="10" style="width:150px; display:inline-block"/>
								<span class="rule">(클릭하면 달력이 나옵니다.)</span><br>
								<span class="error"></span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger">*</span>
							</td>
							<td>
								<label for="agree">이용약관에 동의합니다</label>&nbsp;&nbsp;
								<input type="checkbox" id="agree" /><br>
								<span class="error"></span>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger"></span>
							</td>
							<td style="height: 200px; vertical-align:top;">
								<iframe src="<%= request.getContextPath() %>/iframe_agree/agree.html" width="100%" height="150px" style="border: solid 1px navy;"></iframe>
							</td>
						</tr>

						<tr>
							<td>
								<span class="star text-danger"></span>
							</td>
							<td class="text-center">
								<input type="button" class="btn btn-success btn-lg mr-5" value="가입하기" onclick="goRegister()" />
								<input type="reset" class="btn btn-danger btn-lg" value="취소하기" onclick="goReset()" />
							</td>
						</tr> 

					</tbody>

				</table>
			</div>

		</div>
	</form>
</div>


<jsp:include page="../common/footer.jsp"></jsp:include>

