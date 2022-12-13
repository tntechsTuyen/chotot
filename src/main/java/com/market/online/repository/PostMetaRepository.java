package com.market.online.repository;

import com.market.online.entity.PostMeta;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PostMetaRepository extends JpaRepository<PostMeta, Integer> {

    List<PostMeta> findByIdPost(Integer idPost);
}