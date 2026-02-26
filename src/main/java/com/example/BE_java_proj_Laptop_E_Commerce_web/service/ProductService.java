package com.example.BE_java_proj_Laptop_E_Commerce_web.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Cart;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.CartDetail;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.CartDeltailRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.CartRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDeltailRepository cartDeltailRepository;
    private final UserService userService;

    public ProductService(CartDeltailRepository cartDeltailRepository,
            CartRepository cartRepository, ProductRepository productRepository,
            UserService userService) {
        this.cartDeltailRepository = cartDeltailRepository;
        this.cartRepository = cartRepository;
        this.productRepository = productRepository;
        this.userService = userService;
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

    public CartRepository getCartRepository() {
        return cartRepository;
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đã có Cart chưa ? nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                this.cartRepository.save(otherCart);
            }

            // lưu cart_detail
            // tim product by id
            Optional<Product> producOptional = this.productRepository.findById(productId);
            if (producOptional.isPresent()) {
                Product realProduct = producOptional.get();

                // check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa ? www ~
                // boolean isExistProductInCart =
                // this.cartDeltailRepository.existsByCartAndProduct(cart, realProduct);

                CartDetail oldDetail =
                        this.cartDeltailRepository.findByCartAndProduct(cart, realProduct);
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);

                    this.cartDeltailRepository.save(cd);

                    // update cart (sum);
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDeltailRepository.save(oldDetail);
                }

            }
        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDeltailRepository.findById(cartDetailId);

        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart currentCart = cartDetail.getCart();

            // 1️ Xóa cart-detail trước
            this.cartDeltailRepository.deleteById(cartDetailId);

            // 2️ Cập nhật cart
            if (currentCart.getSum() > 1) {

                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // sum = 1 → xóa cart
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }

    }

}
