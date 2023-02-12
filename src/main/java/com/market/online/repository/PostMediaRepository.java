package com.market.online.repository;

import com.market.online.entity.PostMedia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface PostMediaRepository extends JpaRepository<PostMedia, Integer> {

    @Query("SELECT pm FROM PostMedia AS pm WHERE pm.idPost = :id_post")
    List<PostMedia> selectByIdPost(@Param("id_post") Integer idPost);

    @Modifying
    @Transactional
    @Query("DELETE FROM PostMedia WHERE idPost = :id_post")
    void deleteByIdPost(@Param("id_post") Integer idPost);
}