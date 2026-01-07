package com.example.BE_java_proj_Laptop_E_Commerce_web.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;

// crud: create, read, update, delete
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User save(User hung);
}
