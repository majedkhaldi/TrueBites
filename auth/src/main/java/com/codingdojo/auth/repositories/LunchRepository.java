package com.codingdojo.auth.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Lunch;

@Repository
public interface LunchRepository extends JpaRepository<Lunch, Long> {
    List<Lunch> findByRecommendedTrue();
    List<Lunch> findByTypeAndRecommendedTrue(String type);
    List<Lunch> findByFoodContainingIgnoreCase(String food);

}
