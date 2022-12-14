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


    @Query(" UPDATE Post " +
            " SET totalView = (SELECT COUNT(id) FROM PostUser WHERE idPost = :id_post AND hadView = 1) ")
    void updateData(@Param("id_post") Integer idPost);
}