package com.framework.rbac.user.web;

import com.framework.commons.controller.BaseController;
import com.framework.commons.exception.ServiceException;
import com.framework.commons.model.Page;
import com.framework.commons.model.R;
import com.framework.rbac.role.service.RoleService;
import com.framework.rbac.user.model.SessionUser;
import com.framework.rbac.user.model.User;
import com.framework.rbac.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (sys_user)表控制层
 *
 * @author pangsir
 * @since 2020-07-31 13:33:28
 */
@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@GetMapping("/find")
	public String list(Page<User> page, Model model) {
		model.addAttribute("page", this.userService.find(page));
		model.addAttribute("roleList",this.roleService.list());
		return "user/find";
	}


	@GetMapping("/add")
	public String add(Model model) {
		model.addAttribute("roleList",this.roleService.list());
		return "user/add";
	}
	@GetMapping("/valid/account")
	@ResponseBody
	public boolean validAccount(String account){
		if(this.userService.getAccountCount(account)==1){
			return false;
		}else{
			return true;
		}
	}

	@PostMapping("/add")
	public String add(User user, Model model) {
		try {
			this.userService.add(user);
			model.addAttribute("R", R.ok("新建用户成功"));
		} catch (ServiceException e) {
			model.addAttribute("R", R.error(e.getMessage()));
			model.addAttribute("url", "sys/user/add");
		}

		return "message";
	}

	@GetMapping("/update/{id}")
	public String update(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", this.userService.load(id));
		return "user/update";
	}

	@PostMapping("/update")
	public String update(User user, Model model) {
		try {
			this.userService.update(user);
			model.addAttribute("R", R.ok("更新用户成功"));
		} catch (ServiceException e) {
			model.addAttribute("R", R.error(e.getMessage()));
			model.addAttribute("url", "sys/user/update/"+user.getUserId());
		}
		return "message";
	}

	@GetMapping("/update/status")
	@ResponseBody
	public R updateStatus(User user) {
		try {
			this.userService.update(user);
			return R.ok("更新系统用户状态成功");
		} catch (ServiceException e) {
			return R.error("更新系统用户状态失败");
		}
	}
	@GetMapping("/update/role/{id}")
	public String updateRole(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", this.userService.load(id));
		model.addAttribute("roleList",this.roleService.list());
		return "user/role";
	}
	@PostMapping("/update/role")
	public String updateRole(Integer roleId,Integer userId, Model model) {
		try {
			this.userService.updateUserRole(roleId,userId);
			model.addAttribute("R", R.ok("更新用户角色成功"));
		} catch (ServiceException e) {
			model.addAttribute("R", R.error(e.getMessage()));
			model.addAttribute("url", "sys/user/update/role/"+userId);
		}
		return "message";
	}
	@GetMapping("/update/photo/{id}")
	public String updatePhoto(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", this.userService.load(id));
		return "user/photo";
	}

	@PostMapping("/update/photo")
	public String updatePhoto(User user, MultipartFile myfile, Model model) {
		try {
			Map<String,String> uploadMap = uploadFile(myfile);
			user.setPhoto(uploadMap.keySet().iterator().next());
			this.userService.update(user);
			model.addAttribute("R", R.ok("更新用户头像成功"));
		} catch (ServiceException e) {
			model.addAttribute("R", R.error(e.getMessage()));
			model.addAttribute("url", "sys/user/update/photo/"+user.getUserId());
		}
		return "message";
	}
	@GetMapping("/edit/photo/{id}")
	public String editPhoto(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", this.userService.load(id));
		return "user/image";
	}
	@PostMapping("/edit/photo")
	public String editPhoto(User user, MultipartFile myfile, Model model) {
		try {
			Map<String,String> uploadMap = uploadFile(myfile);
			String photo = uploadMap.keySet().iterator().next();
			user.setPhoto(photo);
			this.userService.update(user);
			model.addAttribute("message", "更新用户头像成功");
			model.addAttribute("photo",photo);
			model.addAttribute("flag","photo");
		} catch (ServiceException e) {
			model.addAttribute("message", e.getMessage());
			model.addAttribute("url", "sys/user/edit/photo/"+user.getUserId());
		}
		return "user_message";
	}

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", this.userService.load(id));
		return "user/edit";
	}

	@PostMapping("/edit")
	public String edit(User user, Model model) {
		try {
			this.userService.update(user);
			model.addAttribute("message", "更新用户头像成功");
			model.addAttribute("userName",user.getUserName());
			model.addAttribute("flag","user");
		} catch (ServiceException e) {
			model.addAttribute("R", R.error(e.getMessage()));
			model.addAttribute("url", "sys/user/edit/"+user.getUserId());
		}
		return "user_message";
	}
	@GetMapping("/update/password")
	public String updatePassword(){
		return "user/password";
	}
	@GetMapping("/valid/password")
	@ResponseBody
	public boolean validPassword(String password){
		SessionUser sessionUser = (SessionUser)session.getAttribute("session_user");
		if(this.userService.getUserPasswordCount(sessionUser.getUserId(),password)==1){
			return true;
		}else{
			return false;
		}
	}
	@PostMapping("/update/password")
	public String updatePassword(String password,Model model) {
		SessionUser sessionUser = (SessionUser)session.getAttribute("session_user");
		User user = new User();
		user.setUserId(sessionUser.getUserId());
		user.setPassword(password);
		try {
			this.userService.update(user);
			model.addAttribute("message", "更新用户密码成功");
		} catch (ServiceException e) {
			model.addAttribute("R", R.error(e.getMessage()));
			model.addAttribute("url", "sys/update/password");
		}
		return "message";
	}

	/**测试用户列表返回JSON数据**/
	@GetMapping("/json/find")
	@ResponseBody
	@CrossOrigin
	public Map<String,Object> list(Page<User> page) {
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("data",this.userService.find(page).getDatas());
		//com.github.pagehelper.Page

		return resultMap;
	}
	@PostMapping("/json/add")
	@ResponseBody
	@CrossOrigin
	public Map<String,Object> add(@RequestBody User user) {
		System.out.println("用户添加操作123=>"+System.currentTimeMillis());
		System.out.println(user);
		Map<String,Object> resultMap = new HashMap<>();
		Map<String,String> tempMap = new HashMap<>();
		try {
			user.setPassword("123456");
			this.userService.add(user);

			resultMap.put("status", 200);
			resultMap.put("statusText", "新用户添加操作成功");
			resultMap.put("data", "ok");
		} catch (ServiceException e) {
			resultMap.put("status", 500);
			resultMap.put("statusText", "新用户添加操作失败");
			resultMap.put("data", "error");
		}
		System.out.println(resultMap);
		return resultMap;
	}

}