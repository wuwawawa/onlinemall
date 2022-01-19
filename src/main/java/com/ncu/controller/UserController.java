package com.ncu.controller;

import com.alibaba.fastjson.JSONObject;
import com.ncu.base.BaseController;
import com.ncu.po.User;
import com.ncu.service.UserService;
import com.ncu.utils.Consts;
import com.ncu.utils.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
/**
 *
 * @author LMY
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findBySql")
    public String findBySql(Model model,User user){
        String sql = "select * from user where 1=1 ";
        if(!isEmpty(user.getUserName())){
            sql += " and userName like '%"+user.getUserName()+"%' ";
        }
        sql+=" order by id";
        Pager<User> pagers = userService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",user);
        return "user/user";
    }

    /**
     * 查看用户信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/view")
    public String view(Model model, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User obj = userService.load(userId);
        model.addAttribute("obj",obj);
        model.addAttribute("type",7);
        return "user/view";
    }

    /**
     * 执行修改用户信息的操作
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(User user,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        user.setId(Integer.valueOf(attribute.toString()));
        userService.updateById(user);
        return "redirect:/user/view";
    }
    /**
     * 管理员查看个人信息
     */
    @RequestMapping("/findPersonInf")
    public String findPersonInf(User user,Model model){
        User byEnity = userService.load(user.getId());
        model.addAttribute("user",byEnity);
        return "user/personInf";
    }
    /**
     * 管理员修改信息
     */
    @RequestMapping("/exUpdatePersonInf")
    public String exUpdatePersonInf(User user){
        userService.updateById(user);
        return "redirect:/user/findBySql";
    }

    /**
     * 查看用户名是否有重复
     */
    @RequestMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(@Param("username") String username, HttpServletRequest request){
        System.out.println("---进入了---");
        JSONObject js = new JSONObject();
        // 用户名为空
        System.out.println(username);

        if(username == null) {
            js.put(Consts.RES, 0);
            return js.toJSONString();
        }
        String sql = "select * from user where userName =  '" + username +"' ";
        User user = userService.getBySqlReturnEntity(sql);
        // 可以输入的用户
        if(user == null) {
            js.put(Consts.RES, 1);

            return js.toJSONString();
        }
        // 用户已经存在
        js.put(Consts.RES, 2);
        System.out.println(js);
        return js.toJSONString();
    }



}
