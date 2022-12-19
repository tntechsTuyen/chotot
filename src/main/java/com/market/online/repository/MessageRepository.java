package com.market.online.repository;

import com.market.online.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.*;

public interface MessageRepository extends JpaRepository<Message, Integer> {

    @Query("SELECT m.id AS id " +
            ", m.idGroup AS idGroup " +
            ", m.idUser AS idUser " +
            ", m.content AS content " +
            ", u.fullName AS name " +
            ", m.createdDate AS createdDate " +
            " FROM Message m " +
            " INNER JOIN User u ON m.idUser = u.id " +
            " WHERE m.idGroup = :id_group")
    List<Map<String, Object>> getByGroup(@Param("id_group") Integer idGroup);
}