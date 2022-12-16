package com.market.online.user.service;

import com.market.online.repository.OrderHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderHistoryService {

    @Autowired
    private OrderHistoryRepository orderHistoryRepository;

    public List<Map<String, Object>> getListByIdOrder(Integer idOrder){
        return orderHistoryRepository.getListByIdOrder(idOrder);
    }
}
