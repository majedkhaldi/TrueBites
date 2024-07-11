package com.codingdojo.auth.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.auth.models.Fat;

@Repository
public interface FatsRepository extends JpaRepositoryy<Fat, Long> {
    List<Fat> findByRecommendedTrue();
    List<Fat> findByTypeAndRecommendedTrue(String type);
}
