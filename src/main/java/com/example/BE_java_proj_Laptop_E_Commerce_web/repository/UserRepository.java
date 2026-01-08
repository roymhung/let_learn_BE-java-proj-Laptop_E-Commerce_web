package com.example.BE_java_proj_Laptop_E_Commerce_web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;


// crud: create, read, update, delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hung);

    List<User> findAll();

    User findById(long id);

    List<User> findByEmail(String email);

    List<User> findByEmailAndAddress(String email, String address);
}
