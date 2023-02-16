package com.market.online.repository;

import com.market.online.entity.Order;
import com.market.online.entity.OrderHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

public interface OrderHistoryRepository extends JpaRepository<OrderHistory, Integer> {

    @Query("SELECT oh.id AS id " +
            " , u.fullName AS name " +
            " , s.name AS status " +
            " , oh.createdDate AS createdDate " +
            " FROM OrderHistory oh " +
            " INNER JOIN User u ON oh.idUser = u.id " +
            " INNER JOIN Status s ON oh.idStatus = s.id " +
            " WHERE oh.idOrder = :id_order ")
    List<Map<String, Object>> getListByIdOrder(@Param("id_order") Integer idOrder);

    @Modifying
    @Transactional
    @Query("DELETE FROM OrderHistory WHERE idOrder = :id_order")
    void deleteByIdOrder(@Param("id_order") Integer idOrder);
}