package com.fpoly.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.model.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{

}
