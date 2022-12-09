package com.market.online.repository;

import com.market.online.dto.CategoryDTO;
import com.market.online.dto.CategoryMetaDTO;
import com.market.online.entity.CategoryMeta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CategoryMetaRepository extends JpaRepository<CategoryMeta, Integer> {

    @Query(" SELECT cm FROM CategoryMeta cm WHERE " +
            " (:#{#search.idCategory} = 0 OR cm.idCategory = :#{#search.idCategory}) " +
            " AND (:#{#search.key} = '' OR cm.key = :#{#search.key}) ")
    List<CategoryMeta> getList(@Param("search") CategoryMetaDTO search);
}