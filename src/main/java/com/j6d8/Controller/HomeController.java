package com.j6d8.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
  @RequestMapping({"/","/home/index"})
  public String home() {
	  return "redirect:/product/list";
  }
  
  @RequestMapping({"/admin","/admin/home/index"})
  public String admin() {
	  return "redirect:/assets/admin/index.html";
  }
  @GetMapping("/account/form")
	public String getform() {
		return "account/form";
	}
	
	@GetMapping("/account/getUser")
	public String getUser() {
		return "account/form2";
	}
	
	@GetMapping("/account/doimk")
	public String getmk() {
		return"account/form_mk";
	}
}
