package member.model;

import java.sql.SQLException;
import java.util.Map;

import member.domain.MemberVO;

public interface MemberDAO {

	// 로그인 처리해주는 메소드
	MemberVO login(Map<String, String> paraMap) throws SQLException;

	// 회원가입을 처리해주는 메소드
	int registerMember(MemberVO member) throws SQLException;

	// 아이디 중복 검사를 처리해주는 메소드
	Boolean idDuplicateCheck(String userid) throws SQLException;

	// 이메일 중복 검사를 처리해주는 메소드
	Boolean emailDuplicateCheck(String email) throws SQLException;

	// 아이디 찾기 메소드
	String findUserid(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 찾기 메소드
	boolean findPwd(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 변경 메소드
	int pwdUpdate(Map<String, String> paraMap) throws SQLException;

	// 계정 복구 메소드
	int useridRecovery(Map<String, String> paraMap) throws SQLException;



}
