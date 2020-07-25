package com.user.domain;

import java.util.List;

public class CartModel {

    private List<Cart> carts;

    public CartModel(List<Cart> carts) {
        this.carts = carts;
    }

    public List<Cart> getCarts() {
        return carts;
    }

    public void setCarts(List<Cart> carts) {
        this.carts = carts;
    }
}
