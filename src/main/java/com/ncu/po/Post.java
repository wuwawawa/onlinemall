package com.ncu.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author LMY
 * @version 1.0 2020/12/16
 */
public class Post implements Serializable {

    /**
     * 帖子编号
     */
    private Integer id;
    /**
     * 发帖用户id
     */
    private Integer userId;
    /**
     * 标题
     */
    private String title;
    /**
     * 帖子内容
     */
    private String content;
    /**
     * 时间
     */
    private Date addTime;

    /**
     * 是否删除
     */
    private Integer isDelete;

    /**
     * 点击量
     */
    private Integer clickAmount;

    /**
     * 用户
     */
    private User user;

    public Integer getId() {
        return id;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getClickAmount() {
        return clickAmount;
    }

    public void setClickAmount(Integer clickAmount) {
        this.clickAmount = clickAmount;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post() {
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", addTime=" + addTime +
                ", user=" + user +
                '}';
    }
}
