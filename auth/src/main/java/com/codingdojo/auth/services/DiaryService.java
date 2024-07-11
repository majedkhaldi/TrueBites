package com.codingdojo.auth.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Diary;
import com.codingdojo.auth.repositories.BrinnerRepository;
import com.codingdojo.auth.repositories.DiaryRepository;

@Service
public class DiaryService {

	   @Autowired
	    private BrinnerRepository binnerrepository;
	   @Autowired
	    private DiaryRepository diaryrepository;
	   
	   
	   
	   public Diary saveDiary(Diary diary) {
			return diaryrepository.save(diary);
			
		}

	   
	   
	   public List<Brinner> searchBrinner(String query) {
	        return binnerrepository.findByFoodContainingIgnoreCase(query);
	    }
	   
	   
	   
	   public void addBrinnerItem(Diary diary ,  Brinner brinner) {
			diary.getBrinneritems().add(brinner);
			diaryrepository.save(diary);	

			
			
			
		}
	   
	   public Brinner findBrinner(Long id){
			Optional<Brinner> theOptional = binnerrepository.findById(id);
			if (theOptional.isPresent()) {
				return theOptional.get();
			}
			return  null;
			
		}
	   
	   public Diary findDiary(Long id){
			Optional<Diary> theOptional = diaryrepository.findById(id);
			if (theOptional.isPresent()) {
				return theOptional.get();
			}
			return  null;
			
		}

	   
	   
	   
	   
}
