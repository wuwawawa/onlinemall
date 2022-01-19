package com.ncu.controller;

import com.ncu.base.BaseController;
import com.ncu.po.Post;
import com.ncu.po.Reply;
import com.ncu.service.PostService;
import com.ncu.service.ReplyService;
import com.ncu.service.UserService;
import com.ncu.utils.Consts;
import com.ncu.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;


/**
 * @author LMY
 * @version 1.0 2020/12/16
 */
@Controller
@RequestMapping("/community")
public class PostController extends BaseController {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

    /**
     * 查询数据并返回社区主页
     * @param model
     * @return
     */
    @RequestMapping("/toPostIndex")
    public String toPostIndex(Model model,Post post,int code){

        String sql=null;
        sql="select * from post where isDelete = 0 ";
        if(!isEmpty(post.getContent())){
            sql+="and content like '%"+post.getContent()+"%' ";
        }
        if(code==0){
            sql+="order by addTime desc";
        }else if(code==1){
            sql+="order by click_amount desc";
        }else{
            sql+="order by addTime desc";
        }

        Pager<Post> pagers = postService.findBySqlRerturnEntity(sql);
        for (Post data : pagers.getDatas()) {
            data.setUser(userService.load(data.getUserId()));
        }
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",post);
        model.addAttribute("code",code);
        model.addAttribute("type",2);
        return "post/postIndex";
    }
    /**
     * 发帖
     */
    @RequestMapping("/addPost")
    public String addPost(HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }

        return "post/add";
    }

    /**
     * 执行操作发帖
     */
    @RequestMapping("/exAddPost")
    public String exAddPost(Post post, HttpSession session){
        post.setAddTime(new Date());
        Integer id = (Integer) session.getAttribute(Consts.USERID);
        post.setUserId(id);
        post.setIsDelete(0);
        post.setClickAmount(0);
        postService.insert(post);
        return "redirect:/community/toPostIndex?code=0";
    }
    /**
     * 浏览该贴
     */
    @RequestMapping("/viewPost")
    public String viewPost(Post post, Model model){
        Post byEnity = postService.load(post.getId());
        int count=byEnity.getClickAmount()+1;

        String SQL="update post set click_amount = "+count+" where id = "+byEnity.getId();
        postService.updateBysql(SQL);
        String sql="select * from reply where post_id = "+byEnity.getId();
        sql+=" order by id desc ";
        try{
            Pager<Reply> pagers = replyService.findBySqlRerturnEntity(sql);
            if(pagers!=null){
                model.addAttribute("pagers",pagers);
                for (Reply data : pagers.getDatas()) {
                    data.setUser(userService.load(data.getUserId()));
                }
            }
        }catch (NullPointerException ignored){
        }
        post.setUser(userService.load(post.getUserId()));
        model.addAttribute("post",byEnity);
        return "post/view";
    }

    /**
     * 用户评论帖子
     */
    @RequestMapping("/review")
    public String review(Integer id,Model model,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        model.addAttribute("postId",id);
        return "post/addReview";
    }
    /**
     * 添加评论
     */
    @RequestMapping("/exAddReview")
    public String exAddReview(Reply reply,HttpSession session){
        System.out.println(reply);
        Integer id = (Integer) session.getAttribute(Consts.USERID);
        reply.setUserId(id);
        reply.setAddTime(new Date());
        reply.setIsDelete(0);
        int i = replyService.insert(reply);
        System.out.println("插入了=>"+i);
        System.out.println("断点");
        return "redirect:/community/viewPost?id="+reply.getPostId();
    }
    /**
     * 查看自己的帖子
     */
    @RequestMapping("/myPost")
    public String myPost(HttpServletRequest request,Model model){

        Integer id = (Integer) request.getSession().getAttribute(Consts.USERID);
        if(id==null){
            return "redirect:/login/uLogin";
        }
        String sql="select * from post where user_id = "+id+" and isDelete = 0";
        Pager<Post> pagers = postService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        return "post/myPost";
    }

    /**
     * 评价
     */
    @RequestMapping("/estimate")
    public String estimate(Model model){
        model.addAttribute("type",4);
        return "post/estimate";
    }



}
