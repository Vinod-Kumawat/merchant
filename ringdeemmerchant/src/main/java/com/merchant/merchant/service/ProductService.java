package com.merchant.merchant.service;

import com.merchant.merchant.bean.Product;

import java.util.List;

public interface ProductService {
    public Product addProduct(Product product);
    public Product updateProduct(Product product);
    public int deleteProduct(int id);
    public List<Product> viewProduct();
    public Product viewProductByID(Integer id);
    public List<Product> viewProductByMerchantID(Integer merchantID);
    public void deleteProductByID(Integer id);
 //   public List<Product> viewProductByCountry(String country);
  //  public Product getProductByEmail(String merchantMail);
}
