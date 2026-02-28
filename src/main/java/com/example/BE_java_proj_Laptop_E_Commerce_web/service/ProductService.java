package com.example.BE_java_proj_Laptop_E_Commerce_web.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Cart;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.CartDetail;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Order;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.OrderDetail;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.CartDetailRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.CartRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.OrderDetailRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.OrderRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;



    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService,
            OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
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
                Cart otherCart = new Cart(); // phải gán lại
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartRepository.save(otherCart);
            }

            // lưu cart_detail
            // tim product by id
            Optional<Product> producOptional = this.productRepository.findById(productId);
            if (producOptional.isPresent()) {
                Product realProduct = producOptional.get();

                // check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa ? www ~
                // boolean isExistProductInCart =
                // this.CartDetailRepository.existsByCartAndProduct(cart, realProduct);

                CartDetail oldDetail =
                        this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);

                    this.cartDetailRepository.save(cd);

                    // update cart (sum);
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }

            }
        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {

        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);

        if (cartDetailOptional.isPresent()) {

            CartDetail cartDetail = cartDetailOptional.get();
            Cart currentCart = cartDetail.getCart();

            // 1️ Xóa cartDetail
            this.cartDetailRepository.delete(cartDetail);

            // 2️ Giảm sum
            int newSum = currentCart.getSum() - 1;
            if (newSum < 0)
                newSum = 0;

            currentCart.setSum(newSum);
            this.cartRepository.save(currentCart);

            // 3️ Update session
            session.setAttribute("sum", newSum);
        }

    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional =
                    this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                // Nếu số lượng <= 0 thì bỏ qua hoặc có thể xóa
                if (cartDetail.getQuantity() <= 0) {
                    continue;
                }
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    @Transactional
    public void handlePlaceOrder(User user, HttpSession session, String receiverName,
            String receiverAddress, String receiverPhone) {


        // create order
        // Order order = new Order();
        // order.setUser(user);
        // order.setReceiverName(receiverName);
        // order.setReceiverAddress(receiverAddress);
        // order.setReceiverPhone(receiverPhone);
        // order = this.orderRepository.save(order);

        // create orderDetail

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                // step 2: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }
                this.cartRepository.deleteById(cart.getId());

                // step 3: update session
                session.setAttribute("sum", 0);
            }
        }
    }
}
