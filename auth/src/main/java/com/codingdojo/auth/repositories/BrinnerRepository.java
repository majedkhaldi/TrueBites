package com.codingdojo.auth.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Diary;

@Repository
public interface BrinnerRepository extends JpaRepository<Brinner, Long> {

	
	
    List<Brinner> findByRecommended(int r);
    List<Brinner> findByTypeAndRecommended(String type, int r);
    List<Brinner> findByFoodContainingIgnoreCase(String food);
	/*
	 * List<Brinner> findAllByDiary(Diary diary);
	 */    


}





