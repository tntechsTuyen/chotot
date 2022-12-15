package com.market.online.repository;

import com.market.online.dto.ProductDTO;
import com.market.online.dto.UserDTO;
import com.market.online.entity.Product;
import com.market.online.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = " SELECT p.id AS id, p.name AS name, p.price AS price, p.priceVerify AS priceVerify, p.createdDate AS createdDate " +
            " , u1.id AS userId, u1.fullName AS userName, u2.id AS confirmerId, u2.fullName AS confirmerName " +
            " , c.id AS categoryId, c.name AS categoryName, s.id AS statusId, s.name AS statusName " +
            " FROM Product p " +
            " INNER JOIN User u1 ON p.idUser = u1.id " +
            " LEFT JOIN User u2 ON p.idConfirmer = u2.id " +
            " INNER JOIN Category c ON p.idCategory = c.id " +
            " INNER JOIN Status s ON p.idStatus = s.id " +
            " WHERE (:#{#search.idStatus} = 0 OR p.idStatus = :#{#search.idStatus}) " +
            " AND (:#{#search.idCategory} = 0 OR p.idCategory = :#{#search.idCategory}) "
            , countQuery = "SELECT COUNT(p.id) FROM Product p " +
            " WHERE (:#{#search.idStatus} = 0 OR p.idStatus = :#{#search.idStatus}) " +
            " AND (:#{#search.idCategory} = 0 OR p.idCategory = :#{#search.idCategory}) ")
    Page<Map<String, Object>> getDataPage(@Param("search") ProductDTO search, Pageable pageable);

    @Query("SELECT p.id AS id " +
            ", p.idCategory AS idCategory " +
            ", p.idUser AS idUser " +
            ", p.name AS name" +
            ", p.price AS price " +
            ", p.priceVerify AS priceVerify " +
            ", pt.totalView AS totalView " +
            ", pt.totalLike AS totalLike " +
            ", pt.totalFollow AS totalFollow " +
            ", pt.totalComment AS totalComment " +
            ", m.url AS thumb " +
            ", pu.hadView AS hadView " +
            ", pu.hadLike AS hadLike " +
            ", pu.hadFollow AS hadFollow " +
            " FROM Product p " +
            " INNER JOIN Post pt ON p.id = pt.idProduct " +
            " INNER JOIN PostMedia pm ON pt.id = pm.idPost AND pm.idType = 3 " +
            " LEFT JOIN PostUser pu ON pt.id = pu.idPost AND pu.idUser = :id_user " +
            " INNER JOIN Media m ON pm.idMedia = m.id " +
            " WHERE p.idStatus = 6 " +
            " ORDER BY pt.totalLike DESC ")
    List<Map<String, Object>> getDataFeaturedProducts(@Param("id_user") Integer idUser);

    @Query("SELECT p.id AS id " +
            ", p.idCategory AS idCategory " +
            ", p.idUser AS idUser " +
            ", p.name AS name" +
            ", p.price AS price " +
            ", p.priceVerify AS priceVerify " +
            ", pt.totalView AS totalView " +
            ", pt.totalLike AS totalLike " +
            ", pt.totalFollow AS totalFollow " +
            ", pt.totalComment AS totalComment " +
            ", m.url AS thumb " +
            ", pu.hadView AS hadView " +
            ", pu.hadLike AS hadLike " +
            ", pu.hadFollow AS hadFollow " +
            " FROM Product p " +
            " INNER JOIN Post pt ON p.id = pt.idProduct " +
            " INNER JOIN PostMedia pm ON pt.id = pm.idPost AND pm.idType = 3 " +
            " INNER JOIN Media m ON pm.idMedia = m.id " +
            " LEFT JOIN PostUser pu ON pt.id = pu.idPost AND pu.idUser = :id_user " +
            " WHERE p.idStatus = 6 " +
            " AND p.idCategory = :id_category " +
            " ORDER BY p.id DESC ")
    List<Map<String, Object>> getDataByIdCategory(@Param("id_category") Integer idCategory, @Param("id_user") Integer idUser);

    @Query("SELECT p.id AS id " +
            ", p.idCategory AS idCategory " +
            ", p.idUser AS idUser " +
            ", p.name AS name" +
            ", p.price AS price " +
            ", p.priceVerify AS priceVerify " +
            ", pt.totalView AS totalView " +
            ", pt.totalLike AS totalLike " +
            ", pt.totalFollow AS totalFollow " +
            ", pt.totalComment AS totalComment " +
            ", m.url AS thumb " +
            ", pu.hadView AS hadView " +
            ", pu.hadLike AS hadLike " +
            ", pu.hadFollow AS hadFollow " +
            " FROM Product p " +
            " INNER JOIN Post pt ON p.id = pt.idProduct " +
            " INNER JOIN PostMedia pm ON pt.id = pm.idPost AND pm.idType = 3 " +
            " INNER JOIN Media m ON pm.idMedia = m.id " +
            " INNER JOIN PostUser pu ON pt.id = pu.idPost AND pu.idUser = :id_user " +
            " WHERE p.idStatus = 6 " +
            " AND pu.hadView = 1 " +
            " ORDER BY pu.id DESC ")
    List<Map<String, Object>> getDataViewed(@Param("id_user") Integer idUser);

    @Query("SELECT p.id AS id " +
            ", p.idCategory AS idCategory " +
            ", p.idUser AS idUser " +
            ", p.name AS name" +
            ", p.price AS price " +
            ", p.priceVerify AS priceVerify " +
            ", p.idStatus AS idStatus " +
            ", pt.totalView AS totalView " +
            ", pt.totalLike AS totalLike " +
            ", pt.totalFollow AS totalFollow " +
            ", pt.totalComment AS totalComment " +
            ", m.url AS thumb " +
            " FROM Product p " +
            " INNER JOIN Post pt ON p.id = pt.idProduct " +
            " INNER JOIN PostMedia pm ON pt.id = pm.idPost AND pm.idType = 3 " +
            " INNER JOIN Media m ON pm.idMedia = m.id " +
            " WHERE p.idUser = :id_user " +
            " ORDER BY p.id DESC ")
    List<Map<String, Object>> getMyData(@Param("id_user") Integer idUser);

    @Query("SELECT p.id AS id " +
            ", p.idCategory AS idCategory " +
            ", p.idUser AS idUser " +
            ", p.name AS name" +
            ", p.price AS price " +
            ", p.priceVerify AS priceVerify " +
            ", pt.totalView AS totalView " +
            ", pt.totalLike AS totalLike " +
            ", pt.totalFollow AS totalFollow " +
            ", pt.totalComment AS totalComment " +
            ", m.url AS thumb " +
            ", pu.hadView AS hadView " +
            ", pu.hadLike AS hadLike " +
            ", pu.hadFollow AS hadFollow " +
            " FROM Product p " +
            " INNER JOIN Post pt ON p.id = pt.idProduct " +
            " INNER JOIN PostMedia pm ON pt.id = pm.idPost AND pm.idType = 3 " +
            " INNER JOIN Media m ON pm.idMedia = m.id " +
            " LEFT JOIN PostUser pu ON pt.id = pu.idPost AND pu.idUser = :#{#search.idUser} " +
            " WHERE p.idStatus = 6 " +
            " AND (:#{#search.idUser} = 0 OR p.idUser != :#{#search.idUser}) " +
            " ORDER BY p.id DESC ")
    List<Map<String, Object>> getList(@Param("search") ProductDTO search);
}