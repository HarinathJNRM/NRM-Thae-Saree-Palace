package com.nrmpattusaries.model;

public class Saree {

    private int sareeId;
    private String name;
    private String description;
    private double price;
    private int stock;
    private String image;
    private Integer categoryId;

    public Saree() {}

    public Saree(String name, String description, double price,
                 int stock, String image, Integer categoryId) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.image = image;
        this.categoryId = categoryId;
    }

    public int getSareeId() { return sareeId; }
    public void setSareeId(int sareeId) { this.sareeId = sareeId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public Integer getCategoryId() { return categoryId; }
    public void setCategoryId(Integer categoryId) { this.categoryId = categoryId; }
}