package com.ncu.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author LMY
 * @version 1.0 2020/12/16
 */
public class Reply implements Serializable {
    /**
     * 回复编号
     */
    private Integer id;
    /**
     * 回复的帖子编号
     */
    private Integer postId;
    /**
     * 用户编号
     */
    private Integer userId;
    /**
     * 内容
     */
    private String content;
    /**
     * 添加时间
     */
    private Date addTime;
    /**
     * 是否删除
     */
    private Integer isDelete;

    private User user;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Reply() {
    }

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", postId=" + postId +
                ", userID=" + userId +
                ", content='" + content + '\'' +
                ", addTime=" + addTime +
                ", isDelete=" + isDelete +
                ", user=" + user +
                '}';
    }
}
