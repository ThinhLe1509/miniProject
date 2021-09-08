package com.j6d8.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.j6d8.Entity.Account;
import com.j6d8.Service.AccountService;

@CrossOrigin("*")
@RestController
public class UserRestController {
		@Autowired
		AccountService accountService;
		
		@GetMapping("/rest/user")
		public ResponseEntity< List<Account>> getAll() {
			return ResponseEntity.ok( accountService.findAll());
		}
		
		@GetMapping("{id}")
		public Account getOne(@PathVariable("id")Integer id) {
			return accountService.findById(id);
		}
		@PostMapping
		public Account create(@RequestBody Account account) {
			return accountService.create(account);
		}
		
		@PutMapping("{id}")
		public Account update(@PathVariable("id")Integer id, @RequestBody Account account) {
			return accountService.update(account);
		}
		
		@DeleteMapping("{id}")
		public void delete(@PathVariable("id")Integer id) {
			 accountService.delete(id);
		}
}
