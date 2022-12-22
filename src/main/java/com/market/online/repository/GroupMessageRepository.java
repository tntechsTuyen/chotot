package com.market.online.repository;


import com.market.online.entity.GroupMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface GroupMessageRepository extends JpaRepository<GroupMessage, Integer> {

    @Query("SELECT gms.id AS id " +
            " , u.fullName AS name " +
            " , m.idUser AS idUser " +
            " , m.createdDate AS createdDate " +
            " , m.content AS content " +
            " , m.read AS read " +
            " , 0 AS totalUnRead " +
            " FROM GroupMember gm " +
            " INNER JOIN User u ON gm.idUser = u.id " +
            " INNER JOIN GroupMessage gms ON gm.idGroup = gms.id " +
            " LEFT JOIN Message m ON gms.id = m.idGroup " +
            " WHERE gm.idGroup IN (SELECT idGroup FROM GroupMember WHERE idUser = :id_user) " +
            " AND gm.idUser != :id_user " +
            " AND m.id IN (SELECT MAX(id) FROM Message GROUP BY idGroup)" +
            " GROUP BY gm.id, u.fullName, gms.updatedDate ")
    List<Map<String, Object>> getMyList(@Param("id_user") Integer idUser);
}
