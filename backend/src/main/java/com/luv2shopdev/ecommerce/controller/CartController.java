package com.luv2shopdev.ecommerce.controller;

import com.luv2shopdev.ecommerce.entity.Cart;
import com.luv2shopdev.ecommerce.entity.CartItem;
import com.luv2shopdev.ecommerce.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cart")
@PreAuthorize("hasRole('CUSTOMER')")
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping
    public ResponseEntity<Cart> getCart(Authentication authentication) {
        Long userId = getUserIdFromAuthentication(authentication);
        Cart cart = cartService.getCartByUserId(userId);
        return ResponseEntity.ok(cart);
    }

    @PostMapping("/add")
    public ResponseEntity<CartItem> addItemToCart(@RequestParam Long productId, @RequestParam int quantity, Authentication authentication) {
        Long userId = getUserIdFromAuthentication(authentication);
        CartItem item = cartService.addItemToCart(userId, productId, quantity);
        return ResponseEntity.ok(item);
    }

    @PutMapping("/update")
    public ResponseEntity<CartItem> updateItemQuantity(@RequestParam Long productId, @RequestParam int quantity, Authentication authentication) {
        Long userId = getUserIdFromAuthentication(authentication);
        CartItem item = cartService.updateItemQuantity(userId, productId, quantity);
        return ResponseEntity.ok(item);
    }

    @DeleteMapping("/remove")
    public ResponseEntity<Void> removeItemFromCart(@RequestParam Long productId, Authentication authentication) {
        Long userId = getUserIdFromAuthentication(authentication);
        cartService.removeItemFromCart(userId, productId);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/clear")
    public ResponseEntity<Void> clearCart(Authentication authentication) {
        Long userId = getUserIdFromAuthentication(authentication);
        cartService.clearCart(userId);
        return ResponseEntity.ok().build();
    }

    private Long getUserIdFromAuthentication(Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        // Assuming UserDetailsImpl has getId method
        return ((com.luv2shopdev.ecommerce.security.UserDetailsImpl) userDetails).getId();
    }
}
