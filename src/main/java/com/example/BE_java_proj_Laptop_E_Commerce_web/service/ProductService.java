package com.example.BE_java_proj_Laptop_E_Commerce_web.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    // ===================== CREATE & UPDATE =====================
    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    // ===================== READ ALL =====================
    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    // ===================== READ BY ID =====================
    public Product getProductById(long id) {
        Optional<Product> productOpt = this.productRepository.findById(id);
        return productOpt.orElse(null);
    }

    // ===================== DELETE =====================
    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }
}
