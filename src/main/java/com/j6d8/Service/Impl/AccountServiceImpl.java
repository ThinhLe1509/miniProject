package com.j6d8.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.j6d8.Dao.AccountDao;
import com.j6d8.Entity.Account;
import com.j6d8.Service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountDao adao;

	@Override
	public Account findById(String username) {
		return adao.findById(username).get();
	}

	public List<Account> getAdministrators() {
		return adao.getAdministrators();
	}

	public List<Account> findAll() {
		return adao.findAll();
	}

	@Override
	public Account create(Account account) {

		return adao.save(account);
	}

	@Override
	public Account findByIds(String user) {
		return adao.findById(user).get();
	}

	@Override
	public Account update(Account account) {
		return adao.save(account);
	}


	@Override
	public Account delete(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account delete(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
