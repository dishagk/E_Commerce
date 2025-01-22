package com.SpringBoot.E_Commerce.respository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SpringBoot.E_Commerce.entity.User;



public interface UserRepository extends JpaRepository<User, Integer> 
{
   Optional<User> findByEmail(String email);
   Optional<User> findByUsername(String username);
}
