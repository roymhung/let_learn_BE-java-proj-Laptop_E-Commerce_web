package com.example.BE_java_proj_Laptop_E_Commerce_web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Order;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;


@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findByUser(User user);

}
