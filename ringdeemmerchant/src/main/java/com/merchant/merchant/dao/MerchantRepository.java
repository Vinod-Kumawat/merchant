package com.merchant.merchant.dao;

import com.merchant.merchant.bean.Merchant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface MerchantRepository extends JpaRepository<Merchant, Integer> {

    Merchant save(Merchant merchant);
    List<Merchant> findAll();
    Merchant findByMerchantId(Integer id);
    Merchant findByMerchantMail(String merchantMail);
  /*  Integer update(Merchant merchant);*/
    /*
    Merchant save(Merchant merchant);

    Integer update(Merchant merchant);
    void delete(Merchant merchant);
*/
}
