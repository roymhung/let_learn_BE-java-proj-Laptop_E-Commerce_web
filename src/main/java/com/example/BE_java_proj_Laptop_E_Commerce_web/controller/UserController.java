package com.example.BE_java_proj_Laptop_E_Commerce_web.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("h@gmail.com");
        System.out.println(arrUsers);
        model.addAttribute("roy", "test");
        model.addAttribute("hung", "haha2026");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("Check path id = " + id);
        // c1: User user = userService.getUserById(id).orElse(null);
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        System.out.println(user);
        return "admin/user/show";
    }


    @RequestMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User royhung) {
        this.userService.handleSaveUser(royhung);
        return "redirect:/admin/user";
    }
}


