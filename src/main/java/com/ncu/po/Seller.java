package com.ncu.po;

import java.io.Serializable;

/**
 * @author LMY
 * @version 1.0 2020/12/8
 */
public class Seller implements Serializable {

    /**
     *
     * 主键商家id
     */
    private Integer id;


    /**
     *商家名
     */
    private String sellerName;

    /**
     * 用户名
     */
    private String userName;
    /**
     * 密码
     */
    private String passWord;

    /**
     * 手机号
     */

    private String phone;
    /**
     * 真实姓名
     */
    private String realName;
    /**
     * 身份证号
     */
    private String idNum;
    /**
     * 性别
     */
    private String sex;
    /**
     * 地址
     */
    private String address;

    /**
     * 电子邮箱
     */
    private String email;

    private Integer isDelete;


    public Seller(Integer id, String sellerName, String userName, String passWord, String phone, String realName, String idNum, String sex, String address, String email) {
        this.id = id;
        this.sellerName = sellerName;
        this.userName = userName;
        this.passWord = passWord;
        this.phone = phone;
        this.realName = realName;
        this.idNum = idNum;
        this.sex = sex;
        this.address = address;
        this.email = email;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Seller() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdNum() {
        return idNum;
    }

    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Seller{" +
                "sellerId=" + id +
                ", sellerName='" + sellerName + '\'' +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", phone='" + phone + '\'' +
                ", realName='" + realName + '\'' +
                ", IdNum='" + idNum + '\'' +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
