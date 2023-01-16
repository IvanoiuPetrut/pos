package com.pos.pos.common;

public class OrderDetailsDto {
    Long id;
    String paymentType;
    boolean refounded;
    String date;
    String totalPrice;
    Long userId;

    public OrderDetailsDto(Long userId, String paymentType, boolean refounded, String date, String totalPrice) {
        this.userId = userId;
        this.paymentType = paymentType;
        this.refounded = refounded;
        this.date = date;
        this.totalPrice = totalPrice;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public boolean isRefounded() {
        return refounded;
    }

    public void setRefounded(boolean refounded) {
        this.refounded = refounded;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }
}
