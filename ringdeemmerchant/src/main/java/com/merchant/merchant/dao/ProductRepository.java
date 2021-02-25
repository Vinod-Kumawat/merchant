package com.merchant.merchant.dao;

import com.merchant.merchant.bean.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
        List<Product> findAll();
        Product save(Product product);
        Product findByProductId(Integer id);
        List<Product> findByMechantID(Integer merchantId);
        void delete(Product product);
    }

