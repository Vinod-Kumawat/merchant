package com.merchant.merchant.service;

import com.merchant.merchant.bean.Merchant;

import java.util.List;

public interface MerchantService {
    public Merchant addMerchant(Merchant merchant);
    public Merchant updateMerchant(Merchant merchant);
    public int deleteMerchant(int merchantId);
    public List<Merchant> viewMerchant();
    public Merchant viewMerchantByID(int merchantId);
    public List<Merchant> viewMerchantByCountry(String country);
    public Merchant getMerchantByEmail(String merchantMail);
}
