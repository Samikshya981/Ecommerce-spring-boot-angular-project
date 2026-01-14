package com.luv2shopdev.ecommerce.service;

import com.luv2shopdev.ecommerce.dto.LoginDto;
import com.luv2shopdev.ecommerce.dto.UserRegistrationDto;
import com.luv2shopdev.ecommerce.dto.JwtResponseDto;

public interface UserService {

    String registerUser(UserRegistrationDto registrationDto);

    JwtResponseDto authenticateUser(LoginDto loginDto);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);
}
