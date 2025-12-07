package com.example.BE_java_proj_Laptop_E_Commerce_web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.BE_java_proj_Laptop_E_Commerce_web.service.UserService;



@Controller
public class UserController {

    // DI : dependency injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomepage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("roy", test);
        model.addAttribute("hung", "haha2026");


        return "hello";
    }


}


// @RestController
// public class UserController {

// // DI : dependency injection
// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }



// @GetMapping("/")
// public String getHomepage() {
// return this.userService.handleHello();
// }
// }
