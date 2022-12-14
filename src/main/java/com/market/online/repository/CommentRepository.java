package com.market.online.repository;

import com.market.online.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.*;

public interface CommentRepository extends JpaRepository<Comment, Integer> {

    @Query("SELECT u.fullName AS name" +
            " , c.content AS content " +
            " , c.createdDate AS createdDate " +
            " FROM Comment c " +
            " INNER JOIN User u ON c.idUser = u.id " +
            " WHERE c.idPost = :id_post ")
    List<Map<String, Object>> getDataByIdPost(@Param("id_post") Integer idPost);
}