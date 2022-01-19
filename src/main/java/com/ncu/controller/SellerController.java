package com.ncu.controller;

import com.alipay.api.domain.ItemDeliveryDetail;
import com.ncu.base.BaseController;
import com.ncu.po.*;
import com.ncu.service.*;
import com.ncu.utils.Pager;
import com.ncu.utils.SystemContext;
import com.ncu.utils.UUIDUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author LMY
 * @version 1.0 2020/12/9
 */

/**
 * 商家的controller层
 */
@Controller
@RequestMapping("/seller")
public class SellerController extends BaseController {

    @Autowired
    private SellerService sellerService;

    @Autowired
    private ItemService itemService;


    @Autowired
    private ItemCategoryService itemCategoryService;

    @Autowired
    private ItemOrderService itemOrderService;

    @Autowired
    private OrderDetailService orderDetailService;


    @Autowired
    private CommentService commentService;


    /**
     * 显示个人信息
     */
    @RequestMapping("/findPersonInf")
    public String showInfo(Seller seller,Integer type,Model model,HttpSession session){
        System.out.println(type);
        if(type==0){
            //商家自己查看信息
            Seller loginSeller = (Seller) session.getAttribute("loginSeller");
            System.out.println(loginSeller);
            model.addAttribute("seller",loginSeller);
        }else if(type ==1){
            //管理员查看商家信息
            Seller byEntity = sellerService.load(seller.getId());
            model.addAttribute("seller",byEntity);
        }
        model.addAttribute("type",type);
        return "seller/personInf";
    }

    /**
     * 商家修改个人信息
     * @return
     */
    @RequestMapping("/exUpdatePersonInf")
    public String exUpdate(Seller seller,HttpSession session){
        Seller loginSeller = (Seller) session.getAttribute("loginSeller");
        if(loginSeller==null){
            return "redirect:/login/sLogin";
        }
        seller.setId(loginSeller.getId());
        sellerService.updateById(seller);
        session.setAttribute("loginSeller",seller);
        return "redirect:/seller/findPersonInf";
    }


    /**
     * 查看商家所有商品
     */
    @RequestMapping("/findAllItems")
    public String findAllItems(HttpSession session, Model model,Item item,int code) {
        Seller loginSeller = (Seller) session.getAttribute("loginSeller");
        String sellerId = (loginSeller.getId()).toString();
        String sql = null;
        if (code == 0) {
            //查询未被删除商品
            sql = "select * from item where sId = " + sellerId + " and isDelete = 0";
            if (!isEmpty(item.getName())) {
                sql += " and name like '%" + item.getName() + "%' ";
            }
        } else if (code == 1) {
            //查询已被删除商品
            sql = "select * from item where sId = " + sellerId + " and isDelete = 1";
            if (!isEmpty(item.getName())) {
                sql += " and name like '%" + item.getName() + "%' ";
            }
        }
        sql+=" order by id";
        Pager<Item> pagers = itemService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);
        model.addAttribute("obj", item);
        model.addAttribute("code",code);
        return "seller/allItems";
    }

    /**
     * 商家为本店添加商品,跳转到添加商品页面
     */
    @RequestMapping("/add")
    public String add(Model model){
        String sql = "select * from item_category where isDelete = 0 and pid is not null order by id";
        List<ItemCategory> listBySqlReturnEntity = itemCategoryService.listBySqlReturnEntity(sql);
        model.addAttribute("types",listBySqlReturnEntity);
        return "seller/add";
    }

    /**
     * 执行添加商品操作
     * @return
     */
    @RequestMapping("/exAdd")
    public String exAdd(Item item, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        itemCommon(item, files, request);
        item.setGmNum(0);
        item.setIsDelete(0);
        item.setScNum(0);
        itemService.insert(item);
        return "redirect:/seller/findAllItems?code=0";
    }

    /**
     * 新增和更新的公共方法
     */
    private void itemCommon(Item item, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        if(files.length>0) {
            for (int s = 0; s < files.length; s++) {
                String n = UUIDUtils.create();
                String path = SystemContext.getRealPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename();
                File newFile = new File(path);
                //通过CommonsMultipartFile的方法直接写文件
                files[s].transferTo(newFile);
                if (s == 0) {
                    item.setUrl1(request.getContextPath()+"\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 1) {
                    item.setUrl2(request.getContextPath()+"\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 2) {
                    item.setUrl3(request.getContextPath()+"\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 3) {
                    item.setUrl4(request.getContextPath()+"\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 4) {
                    item.setUrl5(request.getContextPath()+"\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
            }
        }
        ItemCategory byId = itemCategoryService.getById(item.getCategoryIdTwo());
        item.setCategoryIdOne(byId.getPid());
    }

    /**
     * 商品进行更新跳转到更新页面
     */

    @RequestMapping("/update")
    public String update(@Param("id") Integer id,Model model){
        Item obj = itemService.load(id);
        String sql = "select * from item_category where isDelete = 0 and pid is not null order by id";
        List<ItemCategory> listBySqlReturnEntity = itemCategoryService.listBySqlReturnEntity(sql);
        model.addAttribute("types",listBySqlReturnEntity);
        model.addAttribute("obj",obj);
        return "seller/update";

    }

    /**
     * 执行商品的更新
     */
    @RequestMapping("/exUpdateItem")
    public String exUpdateItem(Item item, @RequestParam("file")CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        itemCommon(item, files, request);
        itemService.updateById(item);
        return "redirect:/seller/findAllItems?code=0";
    }

    /**
     * 执行商品的下架
     */
    @RequestMapping("/deleteItem")
    public String delete(Integer id){
        Item obj = itemService.load(id);
        obj.setIsDelete(1);
        itemService.updateById(obj);
        return "redirect:/seller/findAllItems?code=0";
    }

    @RequestMapping("/unsealItem")
    public String unsealItem(Item item){
        item.setIsDelete(0);
        itemService.updateById(item);
        return "redirect:/seller/findAllItems?code=1";
    }


    /**
     * 查询所有的订单
     */
    @RequestMapping("/findAllOrders")
    public String findAllOrders(HttpSession session,OrderDetail orderDetail, Model model){
        Seller loginSeller = (Seller) session.getAttribute("loginSeller");
        Integer sellerId = loginSeller.getId();

        //分页查询
        String sql = "select * from order_detail where seller_id = "+sellerId;
        if(!isEmpty(orderDetail.getId())){
            sql+=" and id like '%"+orderDetail.getId()+"%'";
        }
        sql += " order by id desc";
        Pager<OrderDetail> pagers = orderDetailService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        System.out.println(pagers);
        //存储查询条件
        model.addAttribute("obj",orderDetail);
        return "seller/itemOrder";

    }


    /**
     * 查询购买的商品
     */
    @RequestMapping("/itemList")
    public String itemList(OrderDetail orderDetail, Model model) {
        //分页查询
        String sql = "select * from order_detail  where order_id=" + orderDetail.getOrderId();
        Pager<OrderDetail> pagers = orderDetailService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);
        model.addAttribute("obj", orderDetail);
        return "orderDetail/ulist";
    }

    /**
     * 发货
     */
    @RequestMapping("/fh")
    public String fh(Integer id,Model model){
        OrderDetail obj=orderDetailService.load(id);
        String sql="update order_detail set status = 2 where id = "+id;
        obj.setStatus(2);
        orderDetailService.updateBysql(sql);
        model.addAttribute("obj",obj);
        return "redirect:/seller/findAllOrders";
    }
    /**
     * 用户收货
     */
    @RequestMapping("/sh")
    public String sh(Integer id,Model model){
        OrderDetail obj =orderDetailService.load(id);
        String sql="update order_detail set status = 3 where id = "+id;
        obj.setStatus(3);
        orderDetailService.updateBysql(sql);
        model.addAttribute("obj",obj);
        return "redirect:/itemOrder/my";
    }
    /**
     * 用户取消订单
     */
    @RequestMapping("/qx")
    public String qx(Integer id,Model model){
        OrderDetail obj =orderDetailService.load(id);
        String sql="update order_detail set status = 1 where id = "+id;
        obj.setStatus(1);
        orderDetailService.updateBysql(sql);
        model.addAttribute("obj",obj);
        return "redirect:/itemOrder/my";
    }


    /**
     * 用户评价入口
     */
    @RequestMapping("/pj")
    public String pj(Integer id,Model model){
        model.addAttribute("id",id);
        return "itemOrder/pj";
    }

    /**
     * 查询本店所有用户的评论
     */
    @RequestMapping("/findAllReviews")
    public String findAllReviews(HttpSession session,Model model,Comment comment){
        Seller loginSeller = (Seller) session.getAttribute("loginSeller");
        Integer sellerId = loginSeller.getId();
        String sql = "select * from comment where seller_id = "+sellerId;
        if(!isEmpty(comment.getContent())){
            sql+=" and content like '%"+comment.getContent()+"%'";

        }
        sql+=" order by id desc";
        Pager<Comment> pagers = commentService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        for (Comment data : pagers.getDatas()) {
            data.setItem(itemService.load(data.getItemId()));
        }
        //存储查询条件
        model.addAttribute("obj",comment);
        return "seller/allReviews";
    }

    /**
     * 管理员查看所有商家
     * @param model
     * @param seller
     * @param code
     * @return
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model,Seller seller,int code){
        String sql=null;
        System.out.println(code);
        if(code==0){
            //查找未被删除的用户
             sql="select * from seller where isDelete = 0 ";
            if(!isEmpty(seller.getSellerName() )){
                sql+=" and sellerName like '%"+seller.getSellerName()+"%' ";
            }
        }else if (code ==1){
            //查找未被删除的用户
             sql="select * from seller where isDelete = 1 ";
            if(!isEmpty(seller.getSellerName() )){
                sql+=" and sellerName like '%"+seller.getSellerName()+"%' ";
            }
        }
        sql+=" order by id";
        Pager<Seller> pagers = sellerService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",seller);
        model.addAttribute("code",code);
        return "seller/allSellers";
    }

    /**
     * 管理员删除用户
     * @param
     * @return
     */
    @RequestMapping("/deleteSeller")
    public String deleteSeller(Seller seller){
        seller.setIsDelete(1);
        sellerService.updateById(seller);
        return "redirect:/seller/findBySql?code=0";
    }


    @RequestMapping("/unsealSeller")
    public String unsealSeller(Seller seller){
        seller.setIsDelete(0);
        sellerService.updateById(seller);
        return "redirect:/seller/findBySql?code=1";
    }




}
