package com.example.BE_java_proj_Laptop_E_Commerce_web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }


    public User handleSaveUser(User user) {
        User mhung = this.userRepository.save(user);
        System.out.println(mhung);
        return mhung;
    }

    // c1: public Optional<User> getUserById(Long id) {
    // return this.userRepository.findById(id);
    // }

    public User getUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

}
