package com.market.online.repository;

import com.market.online.entity.PostUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Map;

public interface PostUserRepository extends JpaRepository<PostUser, Integer> {

    PostUser findByIdPostAndIdUser(Integer idPost, Integer idUser);

    @Query(" SELECT SUM(pu.hadLike) AS like " +
            " , SUM(pu.hadFollow) AS follow " +
            " FROM PostUser pu " +
            " INNER JOIN Post ps ON pu.idPost = ps.id " +
            " INNER JOIN Product p ON ps.idProduct = p.id " +
            " WHERE pu.idUser = :id_user " +
            " AND p.idStatus = 6 ")
    Map<String, Object> countLikeAndFollow(@Param("id_user") Integer idUser);
}