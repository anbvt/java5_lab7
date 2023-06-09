package com.fpoly.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.model.Account;

public interface AccountDAO extends JpaRepository<Account, String>{

}
