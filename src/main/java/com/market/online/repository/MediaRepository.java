package com.market.online.repository;

import com.market.online.entity.Media;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MediaRepository extends JpaRepository<Media, Integer> {
}