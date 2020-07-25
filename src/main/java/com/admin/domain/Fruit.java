package com.admin.domain;

import java.util.Arrays;

public class Fruit {

    Integer id;
    String name;
    Integer quantity;
    Integer purchase;
    Integer sell;
    String status;
    String kind;
    private byte[] main_pic;
    private byte[] sub_pic1;
    private byte[] sub_pic2;
    private byte[] sub_pic3;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getPurchase() {
        return purchase;
    }

    public void setPurchase(Integer purchase) {
        this.purchase = purchase;
    }

    public Integer getSell() {
        return sell;
    }

    public void setSell(Integer sell) {
        this.sell = sell;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public byte[] getMain_pic() {
        return main_pic;
    }

    public void setMain_pic(byte[] main_pic) {
        this.main_pic = main_pic;
    }

    public byte[] getSub_pic1() {
        return sub_pic1;
    }

    public void setSub_pic1(byte[] sub_pic1) {
        this.sub_pic1 = sub_pic1;
    }

    public byte[] getSub_pic2() {
        return sub_pic2;
    }

    public void setSub_pic2(byte[] sub_pic2) {
        this.sub_pic2 = sub_pic2;
    }

    public byte[] getSub_pic3() {
        return sub_pic3;
    }

    public void setSub_pic3(byte[] sub_pic3) {
        this.sub_pic3 = sub_pic3;
    }

    @Override
    public String toString() {
        return "Fruit{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", quantity=" + quantity +
                ", purchase=" + purchase +
                ", sell=" + sell +
                ", status='" + status + '\'' +
                ", kind='" + kind + '\'' +
                ", main_pic=" + Arrays.toString(main_pic) +
                ", sub_pic1=" + Arrays.toString(sub_pic1) +
                ", sub_pic2=" + Arrays.toString(sub_pic2) +
                ", sub_pic3=" + Arrays.toString(sub_pic3) +
                '}';
    }
}
