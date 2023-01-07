package com.pos.pos.entities;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
public class Order {
    @Id
    @GeneratedValue
    private Long id;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

//    private Long idUser;
//
//    private String idProduct;

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

    @ManyToOne
    private Order manyToOne;

    public Order getManyToOne() {
        return manyToOne;
    }

    public void setManyToOne(Order manyToOne) {
        this.manyToOne = manyToOne;
    }

    @OneToMany
    private Collection<Product> oneToMany;

    public Collection<Product> getOneToMany() {
        return oneToMany;
    }

    public void setOneToMany(Collection<Product> oneToMany) {
        this.oneToMany = oneToMany;
    }
}
