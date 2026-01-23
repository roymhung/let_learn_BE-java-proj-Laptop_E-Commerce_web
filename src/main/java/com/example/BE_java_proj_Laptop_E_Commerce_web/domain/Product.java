package com.example.BE_java_proj_Laptop_E_Commerce_web.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;


@Entity
@Table(name = "products")

public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private long id;

    @Size(min = 3, max = 255, message = "Tên sản phẩm không được để trống phải từ 3 đến 255 ký tự")
    private String name;

    @DecimalMin(value = "0", inclusive = false, message = "Giá phải lớn hơn 0")
    private double price;

    // Lưu tên file, không bắt buộc
    private String image;

    @Size(min = 10, message = "Mô tả chi tiết không được để trống phải có ít nhất 10 ký tự")
    private String detailDesc;


    @Size(min = 5, max = 255,
            message = "Mô tả ngắn không được để trống phải có ít nhất từ 5 đến 255 ký tự")
    private String shortDesc;


    @Min(value = 0, message = "Số lượng không được nhỏ hơn 0")
    private long quantity;

    @Min(value = 0, message = "Số lượng đã bán không được nhỏ hơn 0")
    private long sold = 0L;

    private String factory;

    private String target;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image
                + ", detailDesc=" + detailDesc + ", shortDesc=" + shortDesc + ", quantity="
                + quantity + ", sold=" + sold + ", factory=" + factory + ", target=" + target + "]";
    }



}
