package com.nrmpattusaries.model;

public class CartItem {

    private Saree saree;
    private int quantity;

    public CartItem() {}

    public CartItem(Saree saree, int quantity) {
        this.saree = saree;
        this.quantity = quantity;
    }

    public Saree getSaree() {
        return saree;
    }

    public void setSaree(Saree saree) {
        this.saree = saree;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}