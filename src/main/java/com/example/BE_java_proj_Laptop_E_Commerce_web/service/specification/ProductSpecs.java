package com.example.BE_java_proj_Laptop_E_Commerce_web.service.specification;

import org.springframework.data.jpa.domain.Specification;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME),
                "%" + name + "%");
    }

}
