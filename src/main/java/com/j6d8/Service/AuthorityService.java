package com.j6d8.Service;

import java.util.List;

import com.j6d8.Entity.Authority;

public interface AuthorityService {
	public List<Authority> findAll();

	public Authority create(Authority auth);

	public void delete(Integer id);

	public List<Authority> findAuthoritiesOfAdministrators();
}
