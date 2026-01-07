package com.example.BE_java_proj_Laptop_E_Commerce_web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.UserRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.UserService;



@Controller
public class UserController {

    // DI : dependency injection
    private final UserService userService;
    private final UserRepository userRepository;

    public UserController(UserService userService, UserRepository userRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
    }

    @RequestMapping("/")
    public String getHomepage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("roy", test);
        model.addAttribute("hung", "haha2026");
        return "hello";
    }

    @RequestMapping("/admin/user") // GET
    public String getUserpage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }


    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    public String createUserpage(Model model, @ModelAttribute("newUser") User royhung) {
        System.out.println(" Run here " + royhung);
        this.userRepository.save(royhung);

        return "hello";
    }
}


