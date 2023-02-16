package com.market.online.repository;

import com.market.online.entity.PostMeta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface PostMetaRepository extends JpaRepository<PostMeta, Integer> {

    List<PostMeta> findByIdPost(Integer idPost);

    @Modifying
    @Transactional
    @Query("DELETE FROM PostMeta WHERE idPost = :id_post")
    void deleteByIdPost(@Param("id_post") Integer idPost);
}