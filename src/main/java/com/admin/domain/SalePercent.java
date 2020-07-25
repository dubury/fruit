package com.admin.domain;

import java.io.Serializable;

public class SalePercent implements Serializable {

    private String fruit_name;
    private int money;

    public String getFruit_name() {
        return fruit_name;
    }

    public void setFruit_name(String fruit_name) {
        this.fruit_name = fruit_name;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
}
