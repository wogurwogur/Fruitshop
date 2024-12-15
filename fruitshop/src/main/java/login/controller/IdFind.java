package login.controller;

import java.util.HashMap;
import java.util.Map;



import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class IdFind extends AbstractController {
	
	private MemberDAO mdao = new MemberDAO_imple();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		if("get".equalsIgnoreCase(request.getMethod())) {

			super.setRedirect(false);
			super.setViewPage("/WEB-INF/login/login.jsp");
		}
		

		if ("POST".equalsIgnoreCase(request.getMethod())) {
			
			// 아이디 찾기 모달창에서 "찾기" 버튼을 클릭했을 경우
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("name", name);
			paraMap.put("email", email);
			
			String userid = mdao.findUserid(paraMap);
			
			if(userid != null) { // 조회된 아이디가 있다면
				request.setAttribute("userid", userid);
				
			}
			else {
				request.setAttribute("userid", "존재하지 않습니다.");
			}
			
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			
		} // end of post 방식
	
		request.setAttribute("method", request.getMethod());
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/login/idFind.jsp");

	}
}
