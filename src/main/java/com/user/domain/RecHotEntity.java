package com.user.domain;

import java.io.Serializable;

public class RecHotEntity implements Serializable {

    private int id;
    private String name;
    private byte[] main_pic;
    private String pic_path;
    private int price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getMain_pic() {
        return main_pic;
    }

    public void setMain_pic(byte[] main_pic) {
        this.main_pic = main_pic;
    }

    public String getPic_path() {
        return pic_path;
    }

    public void setPic_path(String pic_path) {
        this.pic_path = pic_path;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
