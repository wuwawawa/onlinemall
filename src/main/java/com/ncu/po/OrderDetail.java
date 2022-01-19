package com.ncu.po;

import com.ncu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * 商品详情
 */
public class OrderDetail implements Serializable {


    /**
     * 主键
     */
    private Integer id;


    /**
     * 商品id
     */
    private Integer itemId;

    /**
     * 商家id
     */
    private Integer sellerId;


    /**
     * 购买时间
     */
    private Date orderTime;



    private Item item;

    /**
     * 订单id
     */
    private Integer orderId;


    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 用户姓名
     */
    private  String realName;

    /**
     * 用户手机号
     */
    private String phone;

    private User user;
    /**
     * 用户手机号
     */
    private String address;

    /**
     * 0.未退货 1已退货
     */
    private Integer status;

    /**
     * 数量
     */
    private Integer num;

    /**
     * 小计
     */
    private String total;

    public Integer getSellerId() {
        return sellerId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }



    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", sellerId=" + sellerId +
                ", orderTime=" + orderTime +
                ", item=" + item +
                ", orderId=" + orderId +
                ", userId=" + userId +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", num=" + num +
                ", total='" + total + '\'' +
                '}';
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public OrderDetail() {
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

}
