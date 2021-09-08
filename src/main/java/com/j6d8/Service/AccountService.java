package com.j6d8.Service;

import java.util.List;

import com.j6d8.Entity.Account;

public interface AccountService {
	public Account findById(Integer id);

	public List<Account> getAdministrators();

	public List<Account> findAll();
	Account create(Account account);

	public Account findByIds(String user);

	public Account update(Account account);

	public Account delete(Integer id);

	Account findById(String username);

	Account delete(String username);
}
