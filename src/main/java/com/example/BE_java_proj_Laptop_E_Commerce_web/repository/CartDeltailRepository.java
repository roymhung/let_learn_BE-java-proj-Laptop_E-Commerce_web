package com.example.BE_java_proj_Laptop_E_Commerce_web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Cart;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.CartDetail;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;

@Repository
public interface CartDeltailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
