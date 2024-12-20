package admin.admincontroller;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PageManagementController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String ctxPath = request.getContextPath();
		
		request.setAttribute("adminpage_val", "admin_page_management");
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin_page/admin_page.jsp");
		

	}

}
