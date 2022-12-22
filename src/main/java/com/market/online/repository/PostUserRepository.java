package com.market.online.repository;

import com.market.online.entity.PostUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Map;

public interface PostUserRepository extends JpaRepository<PostUser, Integer> {

    PostUser findByIdPostAndIdUser(Integer idPost, Integer idUser);

    @Query(" SELECT SUM(hadLike) AS like " +
            " , SUM(hadFollow) AS follow " +
            " FROM PostUser " +
            " WHERE idUser = :id_user ")
    Map<String, Object> countLikeAndFollow(@Param("id_user") Integer idUser);
}