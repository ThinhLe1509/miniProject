package com.j6d8.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
@CrossOrigin("*")
@Controller
public class SecurityController {
	@RequestMapping("/security/login/form")
	public String loginForm(Model m) {
		m.addAttribute("message", "Vui lòng đăng nhập!");
		return "security/login";
	}
	
	@RequestMapping("/security/login/success")
	public String loginSuccess(Model m) {
		m.addAttribute("message", "Đăng nhập thành công!");
		return "security/login";
	}
	
	@RequestMapping("/security/login/error")
	public String loginError(Model m) {
		m.addAttribute("message", "Sai thông tin đăng nhập!");
		return "security/login";
	}
	
	@RequestMapping("/security/unauthoried")
	public String unauthoried(Model m) {
		m.addAttribute("message", "Không có quyền truy xuất!");
		return "security/login";
	}
	
	@RequestMapping("/security/logoff/success")
	public String logoffSuccess(Model m) {
		m.addAttribute("message", "Bạn đã đăng xuất!");
		return "security/login";
	}
	@RequestMapping("/security/signup/form")
	public String signupForm(Model m) {
		return "security/signup";
	}
	@RequestMapping("/security/signup/success")
	public String signupSuccess(Model m) {
		m.addAttribute("message", "Đăng kí thành công!");
		return "security/login";
	}
	

	
}

