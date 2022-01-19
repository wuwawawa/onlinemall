package com.ncu.controller;


import com.alibaba.fastjson.JSONObject;
import com.ncu.base.BaseController;
import com.ncu.po.*;
import com.ncu.service.*;
import com.ncu.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * 登录相关的控制器
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @Autowired
    private ManageService manageService;

    @Autowired
    private ItemCategoryService itemCategoryService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private UserService userService;

    @Autowired
    private SellerService sellerService;

    /**
     * 管理员登录前
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        return "/login/mLogin";
    }

    /**
     * 登录验证
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin(Manage manage, HttpServletRequest request){
       Manage byEntity = manageService.getByEntity(manage);
       if(byEntity==null){
           return "redirect:/login/mtuichu";
       }
       request.getSession().setAttribute(Consts.MANAGE,byEntity);
       return "/login/mIndex";
    }

    /**
     * 管理员退出
     */
    @RequestMapping("/mtuichu")
    public String mtuichu(HttpServletRequest request){
        request.getSession().setAttribute(Consts.MANAGE,null);
        return "/login/mLogin";
    }

    /**
     * 前端首页
     */
    @RequestMapping("/uIndex")
    public String uIndex(Model model, Item item,HttpServletRequest request){
        String sql1 = "select * from item_category where isDelete=0 and pid is null order by name";
        List<ItemCategory> fatherList = itemCategoryService.listBySqlReturnEntity(sql1);
        List<CategoryDto> list = new ArrayList<>();
        if(!CollectionUtils.isEmpty(fatherList)){
            for(ItemCategory ic:fatherList){
                CategoryDto dto = new CategoryDto();
                dto.setFather(ic);
                //查询二级类目
                String sql2 = "select * from item_category where isDelete=0 and pid="+ic.getId();
                List<ItemCategory> childrens = itemCategoryService.listBySqlReturnEntity(sql2);
                dto.setChildrens(childrens);
                list.add(dto);
                model.addAttribute("lbs",list);
            }
        }
        //折扣商品
        List<Item> zks = itemService.listBySqlReturnEntity("select * from item where isDelete=0 and zk is not null order by zk desc limit 0,10");
        model.addAttribute("zks",zks);

        //热销商品
        List<Item> rxs = itemService.listBySqlReturnEntity("select * from item where isDelete=0 order by gmNum desc limit 0,10");
        model.addAttribute("rxs",rxs);
        model.addAttribute("type",1);
        return "login/uIndex";
    }

    /**普通用户注册*/
    @RequestMapping("/res")
    public String res(Model model){
        model.addAttribute("type",7);
        return "login/res";
    }

    /**执行普通用户注册*/
    @RequestMapping("/toRes")
    public String toRes(User u){
        userService.insert(u);
        return "login/uLogin";
    }

    /**普通用户登录入口*/
    @RequestMapping("/uLogin")
    public String uLogin(Model model){
        model.addAttribute("type",6);
        return "login/uLogin";
    }

    /**执行普通用户登录*/
    @RequestMapping("/utoLogin")
    public String utoLogin(User u,HttpServletRequest request,HttpSession session,Model model){
        User byEntity = userService.getByEntity(u);
        if(byEntity==null){
            session.setAttribute("msg","用户名或密码错误！");
            return "redirect:/login/uLogin";
        }else {
            session.setAttribute("role",2);
            session.setAttribute(Consts.USERNAME,byEntity.getUserName());
            session.setAttribute(Consts.USERID,byEntity.getId());
            return "redirect:/login/uIndex";
        }
    }

    /**前端用户退出*/
    @RequestMapping("/uTui")
    public String uTui(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login/uIndex";
    }

    /**
     * 修改密码入口
     */
    @RequestMapping("/pass")
    public String pass(HttpServletRequest request,Model model){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User load = userService.load(userId);
        request.setAttribute("obj",load);
        model.addAttribute("type",7);
        return "login/pass";
    }

    /**
     * 修改密码操作
     */
    @RequestMapping("/upass")
    @ResponseBody
    public String upass(String password,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        JSONObject js = new JSONObject();
        if(attribute==null){
            js.put(Consts.RES,0);
            return js.toString();
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User load = userService.load(userId);
        load.setPassWord(password);
        userService.updateById(load);
        js.put(Consts.RES,1);
        return js.toString();
    }

    @RequestMapping("/sLogin")
    public String sLogin(Model model){
        model.addAttribute("type",5);
        return "login/sLogin";
    }


    @RequestMapping("/sres")
    public String sRes(Model model){
        model.addAttribute("type",8);
        return "login/sres";
    }

    /**
     *执行商家注册
     */
    @RequestMapping("/toSres")
    public String toSres(Seller seller , HttpServletRequest request , HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        sellerService.insert(seller);
        return "/login/sLogin";
    }


    /**
     * 执行商家登陆
     */
    @RequestMapping("/tosLogin")
    public String tosLogin(Seller seller,HttpSession session){
        Seller byEntity = sellerService.getByEntity(seller);
        if(byEntity==null){
           session.setAttribute("msg","用户名或密码错误");
            return "redirect:/login/sLogin";
        }
        session.setAttribute("loginSeller",byEntity);
        return "/login/sIndex";
    }

    /**
     * 商家退出登录
     */
    @RequestMapping("/sExit")
    public String sExit(HttpServletRequest req){
        req.getSession().invalidate();
        return "login/sLogin";
    }


}
