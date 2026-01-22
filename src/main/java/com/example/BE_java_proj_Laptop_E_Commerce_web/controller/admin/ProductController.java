package com.example.BE_java_proj_Laptop_E_Commerce_web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;

@Controller
public class ProductController {

    @GetMapping("/admin/product")
    public String getProduct() {
        return "admin/product/show";
    };

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

}
