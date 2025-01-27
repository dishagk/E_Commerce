package com.SpringBoot.E_Commerce.service;


import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import com.SpringBoot.E_Commerce.entity.User;
import com.SpringBoot.E_Commerce.respository.JWTTokenRepository;
import com.SpringBoot.E_Commerce.respository.UserRepository;
import com.SpringBoot.roleEnum.Role;

import java.util.Optional;

@Service
public class AdminUserService {
	 private final UserRepository userRepository;
	    private final JWTTokenRepository jwtTokenRepository;

	    public AdminUserService(UserRepository userRepository, JWTTokenRepository jwtTokenRepository) {
	        this.userRepository = userRepository;
	        this.jwtTokenRepository = jwtTokenRepository;
	    }
	    
	    
	    @Transactional
	    public User modifyUser(Integer userId, String username, String email, String role) {
	    	 // Check if the user exists
	        Optional<User> userOptional = userRepository.findById(userId);
	        if (userOptional.isEmpty()) {
	            throw new IllegalArgumentException("User not found");
	        }
	        User existingUser = userOptional.get();
	        // Update user fields
	        if (username != null && !username.isEmpty()) {
	            existingUser.setUsername(username);
	        }
	        if (email != null && !email.isEmpty()) {
	            existingUser.setEmail(email);
	        }
	        if (role != null && !role.isEmpty()) {
	            try {
	                existingUser.setRole(Role.valueOf(role));
	            } catch (IllegalArgumentException e) {
	                throw new IllegalArgumentException("Invalid role: " + role);
	            }
	        }

	        // Delete associated JWT tokens
	        jwtTokenRepository.deleteByUserId(userId);

	        // Save updated user
	        return userRepository.save(existingUser);
    }

    public User getUserById(Integer userId) {
        return userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
    }
}