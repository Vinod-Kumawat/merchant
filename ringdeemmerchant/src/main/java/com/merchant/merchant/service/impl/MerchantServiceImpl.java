package com.merchant.merchant.service.impl;

import com.merchant.merchant.bean.Merchant;
import com.merchant.merchant.dao.MerchantRepository;
import com.merchant.merchant.service.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MerchantServiceImpl implements MerchantService {
    @Autowired
    MerchantRepository merchantRepository;


    @Override
    public Merchant addMerchant(Merchant merchant) {

        Merchant merchant1=merchantRepository.save(merchant);
        return merchant1;
    }

    @Override
    public Merchant updateMerchant(Merchant merchant) {
        return null;
    }

    @Override
    public int deleteMerchant(int merchantId) {
        return 0;
    }

    @Override
    public List<Merchant> viewMerchant() {
        List<Merchant> merchantList=merchantRepository.findAll();
        return merchantList;
    }

    @Override
    public Merchant viewMerchantByID(int merchantId) {
        System.out.println(merchantId);
        Merchant merchant=merchantRepository.findByMerchantId(merchantId);
        System.out.println(merchant.toString());
        return merchant;
    }



    @Override
    public List<Merchant> viewMerchantByCountry(String country) {
        return null;
    }

    @Override
    public Merchant getMerchantByEmail(String merchantMail) {
        System.out.println(merchantMail);
        Merchant merchant=merchantRepository.findByMerchantMail(merchantMail);
        return merchant;
    }
}
