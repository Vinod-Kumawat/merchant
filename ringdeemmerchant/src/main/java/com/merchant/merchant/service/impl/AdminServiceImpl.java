package com.merchant.merchant.service.impl;

import com.merchant.merchant.bean.Admin;
import com.merchant.merchant.dao.AdminRepository;
import com.merchant.merchant.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminRepository adminRepository;


    @Override
    public boolean loginAdmin(Admin admin) {

        Admin admin1= adminRepository.findByUserName(admin.getUserName());
        if(admin1!=null && admin1.getPassWord().equals(admin.getPassWord()))
        {

            System.out.println(admin1);
            return true;
        }
        return false;
    }
}
