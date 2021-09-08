package com.j6d8.RestController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.j6d8.Entity.Account;
import com.j6d8.Service.AccountService;

@CrossOrigin("*")
@RestController
public class AccountsRestController {

	@Autowired
	AccountService accountService;
	@Autowired
	HttpServletRequest req;


	@GetMapping("/account/remoteuser")
	public Account get() {
		String user = req.getRemoteUser();
		System.err.println(accountService.findByIds(user).getUsername());
		return accountService.findByIds(user);
	}

	@PostMapping("/account/form")
	public Account create(@RequestBody Account account) {
		return accountService.create(account);
	}

	@PutMapping("/account/form")
	public Account update(@RequestBody Account account) {
		return accountService.update(account);
	}

}
