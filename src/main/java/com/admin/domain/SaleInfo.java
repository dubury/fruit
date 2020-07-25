package com.admin.domain;

import java.io.Serializable;

public class SaleInfo implements Serializable {

    private String fruit_name;
    private int sold_num;

    public String getFruit_name() {
        return fruit_name;
    }

    public void setFruit_name(String fruit_name) {
        this.fruit_name = fruit_name;
    }

    public int getSold_num() {
        return sold_num;
    }

    public void setSold_num(int sold_num) {
        this.sold_num = sold_num;
    }
}
