package com.market.online.repository;

import com.market.online.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Integer> {

    Optional<Post> findByIdProduct(Integer idProduct);

    @Modifying
    @Transactional
    @Query(" UPDATE Post " +
            " SET totalView = (SELECT COUNT(id) FROM PostUser WHERE idPost = :id_post AND hadView = 1) " +
            " , totalLike = (SELECT COUNT(id) FROM PostUser WHERE idPost = :id_post AND hadLike = 1) "+
            " , totalFollow = (SELECT COUNT(id) FROM PostUser WHERE idPost = :id_post AND hadFollow = 1) " +
            " WHERE id = :id_post ")
    void updateDataPostUser(@Param("id_post") Integer idPost);

    @Modifying
    @Transactional
    @Query(" UPDATE Post " +
            " SET totalComment = (SELECT COUNT(id) FROM Comment WHERE idPost = :id_post) " +
            " WHERE id = :id_post ")
    void updateDataComment(@Param("id_post") Integer idPost);
}