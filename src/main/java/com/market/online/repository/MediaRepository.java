package com.market.online.repository;

import com.market.online.entity.Media;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MediaRepository extends JpaRepository<Media, Integer> {

    @Query("SELECT m " +
            " FROM Media m " +
            " INNER JOIN PostMedia pm ON m.id = pm.idMedia " +
            " WHERE pm.idPost = :id_post ")
    List<Media> getByIdPost(@Param("id_post") Integer idPost);

}