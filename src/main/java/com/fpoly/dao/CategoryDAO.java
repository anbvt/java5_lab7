package com.fpoly.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.model.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{

}
