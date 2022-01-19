package com.ncu.controller;

import com.ncu.base.BaseController;
import com.ncu.po.Comment;
import com.ncu.service.CommentService;
import com.ncu.service.ItemService;
import com.ncu.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 评论
 * @author LMY
 */
@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private ItemService itemService;

    /**
     * 添加执行
     */
    @RequestMapping("/exAdd")
    public String exAdd(Comment comment, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/toLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        comment.setAddTime(new Date());
        comment.setUserId(userId);
        comment.setItem(itemService.load(comment.getItemId()));
        comment.setSellerId(itemService.load(comment.getItemId()).getsId());
        commentService.insert(comment);
        return "redirect:/itemOrder/my";
    }

}
