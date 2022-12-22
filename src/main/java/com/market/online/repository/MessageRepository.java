package com.market.online.repository;

import com.market.online.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

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

    @Query("SELECT COUNT(id) " +
            "FROM Message " +
            "WHERE idGroup IN (SELECT idGroup FROM GroupMember WHERE idUser = :id_user) " +
            "AND idUser != :id_user " +
            "AND read = 0")
    Integer countMessageNotRead(@Param("id_user") Integer idUser);

    @Query("SELECT idGroup AS idGroup " +
            ", COUNT(id) AS total " +
            " FROM Message " +
            " WHERE idGroup IN (SELECT idGroup FROM GroupMember WHERE idUser = :id_user) " +
            " AND idUser != :id_user " +
            " AND read = 0 " +
            " GROUP BY idGroup ")
    List<Map<String, Object>> countMessageNotReadByGroup(@Param("id_user") Integer idUser);

    @Modifying
    @Transactional
    @Query("UPDATE Message " +
            " SET read = 1 " +
            " WHERE idGroup = :id_group " +
            " AND idUser != :id_user ")
    void updateReadMessage(@Param("id_group") Integer idGroup, @Param("id_user") Integer idUser);
}