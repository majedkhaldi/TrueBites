package com.codingdojo.auth.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.auth.models.Snack;

@Repository
public interface SnackRepository extends JpaRepository<Snack, Long> {
    List<Snack> findByRecommendedTrue(int r);
    List<Snack> findByTypeAndRecommendedTrue(String type);
}

