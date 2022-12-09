package com.market.online.repository;

import com.market.online.entity.PostUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostUserRepository extends JpaRepository<PostUser, Integer> {
}