package com.market.online.repository;

import com.market.online.dto.CategoryDTO;
import com.market.online.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

    @Query(value = " SELECT c FROM Category c WHERE (:#{#search.name} = '' OR c.name = :#{#search.name}) "
            , countQuery = "SELECT COUNT(c.id) FROM Category c WHERE (:#{#search.name} = '' OR c.name = :#{#search.name}) ")
    Page<Category> getDataPage(@Param("search") CategoryDTO search, Pageable pageable);

    @Query(" SELECT c FROM Category c WHERE (:#{#search.name} = '' OR c.name = :#{#search.name})" +
            " AND (:#{#search.id} = 0 OR c.id != :#{#search.id}) ")
    List<Category> verifyInfo(@Param("search") CategoryDTO categoryDTO);

    @Query(" SELECT c.id AS id, c.name AS name, c.content AS content, m.id AS idMedia, m.url AS thumb " +
            " FROM Category c " +
            " LEFT JOIN Media m ON c.idMedia = m.id " +
            " WHERE c.isLocked = 1 ")
    List<Map<String, Object>> getAllData();
}