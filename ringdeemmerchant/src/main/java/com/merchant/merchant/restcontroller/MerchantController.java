package com.merchant.merchant.restcontroller;

import com.merchant.merchant.bean.Merchant;
import com.merchant.merchant.bean.Product;
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
import java.util.List;

@Controller
public class MerchantController {

    @Autowired
    MerchantService merchantService;

    @Autowired
    ProductService productService;

    HttpSession session;

    @RequestMapping("/merchant/")
    public String Test(Model model)
    {
        model.addAttribute("merchantLoginForm", new Merchant());
        System.out.println("Login");
        return "merchant/login";
    }

    @PostMapping("merchant/login")
    public String Login(@ModelAttribute("merchantLoginForm") Merchant merchantLoginForm, HttpServletRequest request)
    {
        Merchant merchant=merchantService.getMerchantByEmail(merchantLoginForm.getMerchantMail());
        if(merchant.getPassword().equals(merchantLoginForm.getPassword()))
        {
            //if(null==request.getSession()){
                session= request.getSession();
                session.setAttribute("merchant", merchant);
            //}
          System.out.println("login Successfull");
        }
       // System.out.println("Login"+loginForm.getUserName()+" "+loginForm.getPassWord());
        return "merchant/home";
    }

    @RequestMapping(value="/merchant/editMerchant/{id}")
    public String editMerchant(@PathVariable Integer id , Model model) {
        Merchant merchant=merchantService.viewMerchantByID(id);
        System.out.println(merchant.toString());
        model.addAttribute("merchantForm",merchant);
        System.out.println("Edit M");

        return "merchant/editMerchant";
    }

    @RequestMapping("merchant/viewMerchant")
    public String viewMerchant(Model model){

        List<Merchant> merchantList=merchantService.viewMerchant();
        model.addAttribute("merchantList",merchantList);
        System.out.println("view M");
        return "merchant/merchantDetail";
    }

    @RequestMapping("merchant/viewProduct")
    public String viewProduct(Model model,HttpServletRequest request) {
        Integer mid=getMerchantIDBySession(request);
        if(mid>0) {
            List<Product> productList = productService.viewProductByMerchantID(mid);
            model.addAttribute("productList", productList);
        }
        System.out.println("view P");
        return "merchant/productDetail";
    }

    @RequestMapping("merchant/addProduct")
    public String addProduct(Model model,HttpServletRequest request) {
        Product product=new Product();
        model.addAttribute("productForm", product);
        System.out.println("Add P");
        return "merchant/addProduct";
    }

    @RequestMapping("merchant/saveProduct")
    public String saveProduct(@ModelAttribute("productForm") Product productForm,Model model)
    {
        Product product=null;
        try {
            product=productService.addProduct(productForm);
            if(null==product.getProductId())
            {
                model.addAttribute("message","Product added with ProductID "+product.getProductId());
            }
            else {
                model.addAttribute("message","Product Updated with productID "+product.getProductId());
            }
            model.addAttribute("productForm", new Product());
        }
        catch (Exception ex)
        {
            model.addAttribute("productForm", null!=product?product: new Product());
            model.addAttribute("message","Product added with productID "+product.getProductId());

        }
        return "merchant/addProduct";
    }

    @RequestMapping(value="merchant/editProduct/{id}")
    public String editProduct(@PathVariable Integer id , Model model) {
        Product product=productService.viewProductByID(id);
        System.out.println(product.toString());
        model.addAttribute("productForm",product);
        System.out.println("Edit P");
        return "merchant/editProduct";
    }

    @RequestMapping(value = "merchant/deleteProduct/{id}")
    public String deleteProduct(@PathVariable Integer id,Model model,HttpServletRequest request)
    {
        System.out.println("delete product"+ id);
        productService.deleteProductByID(id);
        Integer mid=getMerchantIDBySession(request);
        if(mid>0) {
            List<Product> productList = productService.viewProductByMerchantID(mid);
            model.addAttribute("productList", productList);
        }
        System.out.println("view P");
        return "merchant/productDetail";
    }

    /*

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
    public String viewProduct() {
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
    }*/

    public  Integer getMerchantIDBySession(HttpServletRequest request){
        Integer merchantID;
        session=request.getSession();
        if(null!=session.getAttribute("merchant")){
            Merchant merchant=(Merchant) session.getAttribute("merchant");
            merchantID=merchant.getMerchantId();
        }
        else
        {
            merchantID=0;
        }
        return merchantID;
    }


}
