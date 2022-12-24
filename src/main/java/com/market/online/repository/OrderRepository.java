package com.market.online.repository;

import com.market.online.dto.OrderDTO;
import com.market.online.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.*;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    @Query("SELECT o.id AS id " +
            ", p.title AS name " +
            ", o.price AS price " +
            ", t.name AS type " +
            ", s.name AS status " +
            ", o.createdDate AS createdDate" +
            ", o.updatedDate AS updatedDate " +
            ", o.idRedirect AS idRedirect " +
            ", m.url AS thumb " +
            " FROM Order o " +
            " INNER JOIN Status s ON o.idStatus = s.id " +
            " INNER JOIN Type t ON o.idType = t.id " +
            " INNER JOIN Post p ON o.idProduct = p.idProduct " +
            " INNER JOIN PostMedia pm ON p.id = pm.idPost AND pm.idType = 3 " +
            " INNER JOIN Media m ON pm.idMedia = m.id " +
            " WHERE (:#{#search.idSeller} = 0 OR o.idSeller = :#{#search.idSeller}) " +
            " AND (:#{#search.idBuyer} = 0 OR o.idBuyer = :#{#search.idBuyer}) " +
            " AND o.idRedirect = 0 " +
            " ORDER BY o.updatedDate DESC ")
    List<Map<String, Object>> getMyList(@Param("search") OrderDTO orderDTO);

    Optional<Order> findByIdRedirect(Integer idRedirect);
}