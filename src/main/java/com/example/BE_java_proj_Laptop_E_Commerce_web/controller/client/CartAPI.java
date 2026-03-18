package com.example.BE_java_proj_Laptop_E_Commerce_web.controller.client;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.BE_java_proj_Laptop_E_Commerce_web.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class CartAPI {

    private final ProductService productService;

    public CartAPI(ProductService productService) {
        this.productService = productService;
    }

    // ===== DTO nhận dữ liệu từ frontend =====
    public static class CartRequest {
        private long quantity;
        private long productId;

        public long getQuantity() {
            return quantity;
        }

        public void setQuantity(long quantity) {
            this.quantity = quantity;
        }

        public long getProductId() {
            return productId;
        }

        public void setProductId(long productId) {
            this.productId = productId;
        }
    }

    // ===== API Add to Cart =====
    @PostMapping("/api/add-product-to-cart")
    public ResponseEntity<Integer> addProductToCart(@RequestBody() CartRequest cartRequest,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);

        // Nếu chưa login
        if (session == null || session.getAttribute("email") == null) {
            return ResponseEntity.badRequest().body(0);
        }

        String email = (String) session.getAttribute("email");

        // Gọi service xử lý
        this.productService.handleAddProductToCart(email, cartRequest.getProductId(), session,
                cartRequest.getQuantity());

        // Lấy tổng số lượng sản phẩm trong cart
        Integer sum = (Integer) session.getAttribute("sum");

        return ResponseEntity.ok(sum != null ? sum : 0);
    }
}
