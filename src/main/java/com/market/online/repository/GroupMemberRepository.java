package com.market.online.repository;

import com.market.online.entity.GroupMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.*;

public interface GroupMemberRepository extends JpaRepository<GroupMember, Integer> {

    List<GroupMember> findByIdGroup(Integer idGroup);

    @Query("SELECT idGroup AS idGroup, COUNT(id) AS total " +
            "FROM GroupMember " +
            "WHERE idUser = :id_u1 OR idUser = :id_u2 " +
            "GROUP BY idGroup " +
            "HAVING COUNT(id) > 1")
    List<Map<String, Object>> checkGroupByUser(@Param("id_u1") Integer idUser1, @Param("id_u2") Integer idUser2);
}
