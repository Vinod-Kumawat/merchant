package com.merchant.merchant.restcontroller;

import com.merchant.merchant.bean.Admin;
import com.merchant.merchant.bean.Merchant;
import com.merchant.merchant.bean.Product;
import com.merchant.merchant.service.AdminService;
import com.merchant.merchant.service.MerchantService;
import com.merchant.merchant.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Controller
public class AdminRestController {

    @Autowired
    AdminService adminService;

    @Autowired
    MerchantService merchantService;

    @Autowired
    ProductService productService;

    HttpSession session=null;

    public boolean checkAdminSession(HttpServletRequest request)
    {
        boolean flag=false;
        session=request.getSession();
        if(null!=session && null!=session.getAttribute("admin")){
            Admin admin=(Admin) session.getAttribute("admin");
            session.setAttribute("admin",admin);
            System.out.println("in session");
            flag=true;
        }
        return flag;
    }

    @RequestMapping("/")
    public String Test(Model model,HttpServletRequest request)
    {
        String url="login";
        if(checkAdminSession(request)){
            url="admin/home";
        }
        else {
            model.addAttribute("loginForm", new Admin());
            System.out.println("Login");
        }
        return url;
    }

    @PostMapping("/login")
    public String Login(@ModelAttribute("loginForm") Admin loginForm, HttpServletRequest request)
    {
        session=request.getSession();
        if(checkAdminSession(request)){
            // do nothing
        }else {
            if (adminService.loginAdmin(loginForm)) {
                System.out.println("login Successfull");
                session.setAttribute("admin", loginForm);

            }
            else {
                return "login";
            }
        }
        System.out.println("Login"+loginForm.getUserName()+" "+loginForm.getPassWord());
        return "admin/home";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,Model model)
    {
        session=request.getSession();
        if(null!=session && null!=session.getAttribute("admin"))
        {
         //   session.setAttribute("admin",null);
            session.removeAttribute("admin");
            session.invalidate();;
            model.addAttribute("loginForm", new Admin());
        }
        return "login";
    }

    @RequestMapping("admin/home")
    public String Test1()
    {
        System.out.println("Home");
        return "admin/home";
    }

    @RequestMapping("/addMerchant")
    public String addMerchant(Model model)
    {
        model.addAttribute("merchantForm", new Merchant());
        System.out.println("Add M");
        return "admin/addmerchant";
    }

    @RequestMapping("/saveMerchant")
    public String saveMerchant(@ModelAttribute("merchantForm") Merchant merchantForm,Model model)
    {

        Merchant merchant=null;
        try {
             merchant=merchantService.addMerchant(merchantForm);
            System.out.println(merchantForm.getCompanyName());

            // model.addAttribute("merchantForm", new Merchant());
            System.out.println("Add M: "+merchant);

            if(null==merchantForm.getMerchantId())
            {
                model.addAttribute("message","Merchant added with merchantID "+merchant.getMerchantId());
            }
            else {
                model.addAttribute("message","Merchant Updated with merchantID "+merchant.getMerchantId());
            }

            model.addAttribute("merchantForm", new Merchant());


        }
        catch (Exception ex)
        {
            model.addAttribute("merchantForm", null!=merchant?merchant: new Merchant());
            model.addAttribute("message","Merchant added with merchantID "+merchant.getMerchantId());

        }
                return "admin/addmerchant";
    }

    @RequestMapping(value="/editMerchant/{id}")
    public String editMerchant(@PathVariable Integer id , Model model) {
        Merchant merchant=merchantService.viewMerchantByID(id);
        System.out.println(merchant.toString());
        model.addAttribute("merchantForm",merchant);
        System.out.println("Edit M");

        return "admin/editMerchant";
    }

    @RequestMapping("/deleteMerchant")
    public String deleteMerchant() {
        System.out.println("Delete M");
        return "admin/merchantDetail";
    }

    @RequestMapping("/viewMerchant")
    public String viewMerchant(Model model){

        List<Merchant> merchantList=merchantService.viewMerchant();
        model.addAttribute("merchantList",merchantList);
        System.out.println("view M");
        return "admin/merchantDetail";
    }

    @RequestMapping("/viewProduct")
    public String viewProduct(Model model) {
        List<Product> productList=productService.viewProduct();
        model.addAttribute("productList",productList);

        System.out.println("view P");
        return "admin/productDetail";
    }

    @RequestMapping("/viewTransaction")
    public String viewTransaction() {
        System.out.println("view T");
        return "admin/transactionDetail";
    }

    @RequestMapping("/viewTotalSell")
    public String viewTotalSell() {
        System.out.println("view T S");
        return "admin/totalSellDetail";
    }

    @RequestMapping("/viewPoint")
    public String viewPoint() {
        System.out.println("view c point");
        return "admin/comsumePointByMerchant";
    }

    @RequestMapping("viewProductByMerchant/{id}")
    public String viewProductByMerchant(@PathVariable Integer id,Model model){
        List<Product> productList=productService.viewProductByMerchantID(id);
        model.addAttribute("productList",productList);
        System.out.println("view P");
        return "admin/productDetail";
    }


}
