package com.example.BE_java_proj_Laptop_E_Commerce_web.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {
    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/show";
    }
}
