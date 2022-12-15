package com.market.online.repository;

import com.market.online.entity.Order;
import com.market.online.entity.OrderHistory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderHistoryRepository extends JpaRepository<OrderHistory, Integer> {
}