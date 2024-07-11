package com.codingdojo.auth.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Fat;
import com.codingdojo.auth.models.Lunch;
import com.codingdojo.auth.models.Snack;

@Repository
public interface BrinnerRepository extends JpaRepository<Brinner, Long> {

	
	
    List<Brinner> findByRecommended(int r);
    List<Brinner> findByTypeAndRecommended(String type, int r);
    List<Brinner> findByFoodContainingIgnoreCase(String food);
    


}





