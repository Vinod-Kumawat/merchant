package com.merchant.merchant.service.impl;

import com.merchant.merchant.bean.Product;
import com.merchant.merchant.dao.ProductRepository;
import com.merchant.merchant.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepository productRepository;

    @Override
    public Product addProduct(Product product) {
        Product product1=productRepository.save(product);
        return product1;
    }

    @Override
    public Product updateProduct(Product product) {
        return null;
    }

    @Override
    public int deleteProduct(int id) {
        return 0;
    }

    @Override
    public List<Product> viewProduct() {
        List<Product> productList=productRepository.findAll();
        return productList;
    }

    @Override
    public Product viewProductByID(Integer id) {
        Product product=productRepository.findByProductId(id);
        return product;
    }

    @Override
    public List<Product> viewProductByMerchantID(Integer merchantID) {
        List<Product> productList=productRepository.findByMechantID(merchantID);
        return productList;
    }

    @Override
    public void deleteProductByID(Integer id) {
        Product product=productRepository.findByProductId(id);
        System.out.println(product.toString());
        productRepository.delete(product);
    }
}
