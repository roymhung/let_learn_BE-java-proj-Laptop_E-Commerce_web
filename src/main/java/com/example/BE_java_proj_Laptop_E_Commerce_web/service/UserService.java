package com.example.BE_java_proj_Laptop_E_Commerce_web.service;

import org.springframework.stereotype.Service;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User user) {
        User mhung = this.userRepository.save(user);
        System.out.println(mhung);
        return mhung;
    }
}
