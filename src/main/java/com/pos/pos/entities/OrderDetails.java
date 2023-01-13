package com.pos.pos.entities;

import jakarta.persistence.*;

@Entity
public class OrderDetails {
    @Id
    @GeneratedValue
    private Long id;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    @Basic

    private String paymentType;

    private boolean refounded;

    private String date;

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

}
