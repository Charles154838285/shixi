package com.framework.rbac.web;

import com.framework.commons.controller.BaseController;
import com.framework.commons.exception.ServiceException;
import com.framework.rbac.menu.service.MenuService;
import com.framework.rbac.user.model.SessionUser;
import com.framework.rbac.user.model.User;
import com.framework.rbac.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
public class IndexController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;


	@GetMapping({"/sys/login","/"})
	public String login(){
		return "login";
	}
	@PostMapping("/sys/login")
	public String login(String account, String password, RedirectAttributes ra){
		try {
			SessionUser sessionUser = this.userService.login(account, password);
			if(session.getAttribute("session_user")==null){
				User loginUser = new User();
				loginUser.setUserId(sessionUser.getUserId());
				loginUser.setLoginDate(new Date());
				loginUser.setIpAddress(request.getRemoteAddr());

				this.userService.update(loginUser);
			}
			session.setAttribute("session_user",sessionUser);
			return "redirect:/sys/main";
		} catch (ServiceException e) {
			ra.addFlashAttribute("message",e.getMessage());
			return "redirect:/sys/login";
		}
	}
	@GetMapping("/sys/main")
	public String main(Model model){
		SessionUser sessionUser = (SessionUser) session.getAttribute("session_user");
		User user = this.userService.load(sessionUser.getUserId());
		if(user.getRoleId()!=null){
			model.addAttribute("navMenuList",this.menuService.getLeftNavList(user.getRoleId()));
		}
		model.addAttribute("user",user);
		return "main";
	}
	@GetMapping("/sys/logout")
	public ModelAndView logout(){
		session.removeAttribute("session_user");
		session.invalidate();
		return redirect("/sys/login");
	}
	@GetMapping("/sys/content")
	public ModelAndView content(){
		return forward("content");
	}
}
