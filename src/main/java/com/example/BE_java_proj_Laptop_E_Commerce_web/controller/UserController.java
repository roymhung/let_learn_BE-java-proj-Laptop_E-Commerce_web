package com.example.BE_java_proj_Laptop_E_Commerce_web.controller;


import org.springframework.web.bind.annotation.RestController;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;



// @Controller
// public class UserController {

// @RequestMapping("/")
// public String getHomepage() {
// return "hell from controller";
// }
// }

@RestController
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }



    @GetMapping("/")
    public String getHomepage() {
        return this.userService.handleHello();
    }
}
