package com.merchant.merchant.bean;

import javax.persistence.*;
import java.util.Map;

@Entity
@Table(name="product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer productId;

    @Column
    private Integer mechantID;
    @Column
    private String productName;
    @Column
    private int productPoint;
    @Column
    private String image;
    @Column
    private String showOnDay;
    @Column
    private  String description;
    @Column
    private String otherInfo;
    @Column
    private String status;


    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getMechantID() {
        return mechantID;
    }

    public void setMechantID(Integer mechantID) {
        this.mechantID = mechantID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPoint() {
        return productPoint;
    }

    public void setProductPoint(int productPoint) {
        this.productPoint = productPoint;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getShowOnDay() {
        return showOnDay;
    }

    public void setShowOnDay(String showOnDay) {
        this.showOnDay = showOnDay;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOtherInfo() {
        return otherInfo;
    }

    public void setOtherInfo(String otherInfo) {
        this.otherInfo = otherInfo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", mechantID=" + mechantID +
                ", productName='" + productName + '\'' +
                ", productPoint=" + productPoint +
                ", image='" + image + '\'' +
                ", showOnDay='" + showOnDay + '\'' +
                ", description='" + description + '\'' +
                ", otherInfo='" + otherInfo + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
