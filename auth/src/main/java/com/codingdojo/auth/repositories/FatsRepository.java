package com.codingdojo.auth.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Fat;

@Repository
public interface FatsRepository extends JpaRepository<Fat, Long> {
	 List<Fat> findByRecommended(int r);
	 List<Fat> findByTypeAndRecommended(String type, int r);
}
