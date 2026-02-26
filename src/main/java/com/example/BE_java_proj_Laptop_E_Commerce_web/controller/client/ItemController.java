package com.example.BE_java_proj_Laptop_E_Commerce_web.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Cart;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.CartDetail;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        // Lấy session hiện tại (không tạo mới)
        HttpSession session = request.getSession(false);

        // Lấy id user từ session
        long id = (long) session.getAttribute("id");

        // Tạo user hiện tại
        User currentUser = new User();
        currentUser.setId(id);

        // Lấy cart theo user
        Cart cart = this.productService.fetchByUser(currentUser);

        // Danh sách sản phẩm trong giỏ
        List<CartDetail> cartDetails =
                cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        // Tính tổng tiền
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        // Đưa dữ liệu sang view
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/show";
    }
}
