package com.pos.pos.common;

public class ProductDto {
    Long barCode;
    String name;
    String price;
    int stock;
    String description;
    String type;

    public ProductDto(Long barCode, String name, String price, int stock, String description, String type) {
        this.barCode = barCode;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.type = type;
    }

    public Long getBarCode() {
        return barCode;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    public String getDescription() {
        return description;
    }

    public String getType() {
        return type;
    }
}