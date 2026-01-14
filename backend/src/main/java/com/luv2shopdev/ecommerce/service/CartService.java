package com.luv2shopdev.ecommerce.service;

import com.luv2shopdev.ecommerce.entity.Cart;
import com.luv2shopdev.ecommerce.entity.CartItem;

public interface CartService {

    Cart getCartByUserId(Long userId);

    CartItem addItemToCart(Long userId, Long productId, int quantity);

    void removeItemFromCart(Long userId, Long productId);

    CartItem updateItemQuantity(Long userId, Long productId, int quantity);

    void clearCart(Long userId);
}
