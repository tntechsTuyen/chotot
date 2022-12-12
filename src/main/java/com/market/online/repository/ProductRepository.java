package com.market.online.repository;

import com.market.online.dto.ProductDTO;
import com.market.online.dto.UserDTO;
import com.market.online.entity.Product;
import com.market.online.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Map;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = " SELECT p.id AS id, p.name AS name, p.price AS price, p.priceVerify AS priceVerify, p.createdDate AS createdDate " +
            " , u1.id AS userId, u1.fullName AS userName, u2.id AS confirmerId, u2.fullName AS confirmerName " +
            " , c.id AS categoryId, c.name AS categoryName, s.id AS statusId, s.name AS statusName " +
            " FROM Product p " +
            " INNER JOIN User u1 ON p.idUser = u1.id " +
            " INNER JOIN User u2 ON p.idConfirmer = u2.id " +
            " INNER JOIN Category c ON p.idCategory = c.id " +
            " INNER JOIN Status s ON p.idStatus = s.id " +
            " WHERE (:#{#search.idStatus} = 0 OR p.idStatus = :#{#search.idStatus}) " +
            " AND (:#{#search.idCategory} = 0 OR p.idCategory = :#{#search.idCategory}) "
            , countQuery = "SELECT COUNT(p.id) FROM Product p " +
            " WHERE (:#{#search.idStatus} = 0 OR p.idStatus = :#{#search.idStatus}) " +
            " AND (:#{#search.idCategory} = 0 OR p.idCategory = :#{#search.idCategory}) ")
    Page<Map<String, Object>> getDataPage(@Param("search") ProductDTO search, Pageable pageable);

}