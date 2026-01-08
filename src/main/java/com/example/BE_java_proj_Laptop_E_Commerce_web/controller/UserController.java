package com.example.BE_java_proj_Laptop_E_Commerce_web.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.UserService;



@Controller
public class UserController {

    // DI : dependency injection
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomepage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("h@gmail.com");
        System.out.println(arrUsers);
        model.addAttribute("roy", "test");
        model.addAttribute("hung", "haha2026");
        return "hello";
    }

    @RequestMapping("/admin/user") // GET
    public String getHomeUserpage(Model model) {
        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/create") // GET
    public String getCreateUserpage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserpage(Model model, @ModelAttribute("newUser") User royhung) {
        System.out.println(" Run here " + royhung);
        this.userService.handleSaveUser(royhung);
        return "admin/user/users";
    }
}


