package com.market.online.repository;

import com.market.online.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Integer> {

    Optional<Post> findByIdProduct(Integer idProduct);
}