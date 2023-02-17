package com.market.online.repository;

import com.market.online.dto.UserDTO;
import com.market.online.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsername(String username);

    @Query(value = " SELECT u " +
            " FROM User u " +
            " WHERE (:#{#search.username} = '' OR u.username = :#{#search.username}) " +
            " AND (:#{#search.phone} = '' OR u.phone = :#{#search.phone}) "+
            " AND (:#{#search.email} = '' OR u.email = :#{#search.email}) "
            , countQuery = "SELECT COUNT (u.id) FROM User u " +
            " WHERE (:#{#search.username} = '' OR u.username = :#{#search.username}) " +
            " AND (:#{#search.phone} = '' OR u.phone = :#{#search.phone}) "+
            " AND (:#{#search.email} = '' OR u.email = :#{#search.email}) ")
    Page<User> getDataPage(@Param("search") UserDTO search, Pageable pageable);

    @Query("SELECT AVG(rate) " +
            " FROM Order" +
            " WHERE idSeller = :id_seller " +
            " AND rate > 0 ")
    Double getUserRate(@Param("id_seller") Integer idSeller);
}
