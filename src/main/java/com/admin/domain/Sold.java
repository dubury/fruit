package com.admin.domain;

import java.io.Serializable;

public class Sold implements Serializable {

    int id;
    int sold_num;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSold_num() {
        return sold_num;
    }

    public void setSold_num(int sold_num) {
        this.sold_num = sold_num;
    }
}
