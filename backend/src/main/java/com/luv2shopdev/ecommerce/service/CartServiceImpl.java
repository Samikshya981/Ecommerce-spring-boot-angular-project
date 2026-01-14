package com.luv2shopdev.ecommerce.service;

import com.luv2shopdev.ecommerce.dao.CartItemRepository;
import com.luv2shopdev.ecommerce.dao.CartRepository;
import com.luv2shopdev.ecommerce.dao.ProductRepository;
import com.luv2shopdev.ecommerce.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Optional;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    @Transactional
    public Cart getCartByUserId(Long userId) {
        return cartRepository.findByUserId(userId).orElseGet(() -> createCartForUser(userId));
    }

    @Override
    @Transactional
    public CartItem addItemToCart(Long userId, Long productId, int quantity) {
        Cart cart = getCartByUserId(userId);
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        Optional<CartItem> existingItem = cartItemRepository.findByCartIdAndProductId(cart.getId(), productId);

        if (existingItem.isPresent()) {
            CartItem item = existingItem.get();
            item.setQuantity(item.getQuantity() + quantity);
            item.setTotalPrice(item.getUnitPrice().multiply(BigDecimal.valueOf(item.getQuantity())));
            return cartItemRepository.save(item);
        } else {
            CartItem newItem = new CartItem();
            newItem.setCart(cart);
            newItem.setProduct(product);
            newItem.setQuantity(quantity);
            newItem.setUnitPrice(product.getUnitPrice());
            newItem.setTotalPrice(product.getUnitPrice().multiply(BigDecimal.valueOf(quantity)));
            cart.addCartItem(newItem);
            cartRepository.save(cart);
            return newItem;
        }
    }

    @Override
    @Transactional
    public void removeItemFromCart(Long userId, Long productId) {
        Cart cart = getCartByUserId(userId);
        Optional<CartItem> item = cartItemRepository.findByCartIdAndProductId(cart.getId(), productId);
        if (item.isPresent()) {
            cart.removeCartItem(item.get());
            cartRepository.save(cart);
        }
    }

    @Override
    @Transactional
    public CartItem updateItemQuantity(Long userId, Long productId, int quantity) {
        Cart cart = getCartByUserId(userId);
        Optional<CartItem> item = cartItemRepository.findByCartIdAndProductId(cart.getId(), productId);
        if (item.isPresent()) {
            CartItem cartItem = item.get();
            cartItem.setQuantity(quantity);
            cartItem.setTotalPrice(cartItem.getUnitPrice().multiply(BigDecimal.valueOf(quantity)));
            cartRepository.save(cart);
            return cartItem;
        }
        throw new RuntimeException("Item not found in cart");
    }

    @Override
    @Transactional
    public void clearCart(Long userId) {
        Cart cart = getCartByUserId(userId);
        cart.getCartItems().clear();
        cart.setTotalPrice(BigDecimal.ZERO);
        cart.setTotalQuantity(0);
        cartRepository.save(cart);
    }

    private Cart createCartForUser(Long userId) {
        Cart cart = new Cart();
        User user = new User();
        user.setId(userId);
        cart.setUser(user);
        return cartRepository.save(cart);
    }
}
