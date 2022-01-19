package com.ncu.controller;

import com.alibaba.fastjson.JSONObject;
import com.ncu.base.BaseController;
import com.ncu.po.Message;
import com.ncu.service.MessageService;
import com.ncu.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 留言管理
 * @author Lmy
 */
@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {

    @Autowired
    private MessageService messageService;

    /**
     * 留言列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Message message, Model model){
        String sql = "select * from message where 1=1 ";
        if(!isEmpty(message.getName())){
            sql += " and name like '%"+message.getName()+"%'";
        }
        sql += " order by id desc";
        Pager<Message> pagers = messageService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",message);
        return "message/message";
    }

    /**
     * 删除留言
     */
    @RequestMapping("/delete")
    public String delete(Integer id){
        messageService.deleteById(id);
        return "redirect:/message/findBySql";
    }

    /**
     * 发表留言进入
     */
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("type",3);
        return "message/add";
    }

    /**
     * 发表留言
     */
    @RequestMapping("/exAdd")
    @ResponseBody
    public String exAdd(Message message){
        messageService.insert(message);
        JSONObject js = new JSONObject();
        js.put("message","添加成功");
        return js.toString();
    }


}
