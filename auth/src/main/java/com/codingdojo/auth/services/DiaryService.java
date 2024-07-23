package com.codingdojo.auth.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Diary;
import com.codingdojo.auth.models.Lunch;
import com.codingdojo.auth.models.Snack;
import com.codingdojo.auth.repositories.BrinnerRepository;
import com.codingdojo.auth.repositories.DiaryRepository;
import com.codingdojo.auth.repositories.LunchRepository;
import com.codingdojo.auth.repositories.SnackRepository;

@Service
public class DiaryService {

	   @Autowired
	    private BrinnerRepository binnerrepository;
	   @Autowired
	    private DiaryRepository diaryrepository;
	   @Autowired
	    private LunchRepository lunchrepository;
	   @Autowired
	    private SnackRepository snackrepository;
	   
	   
	   
	   
	   
	   public Diary saveDiary(Diary diary) {
			return diaryrepository.save(diary);
			
		}

	   
	   
	   public List<Brinner> searchBrinner(String query) {
	        return binnerrepository.findByFoodContainingIgnoreCase(query);
	    }
	   public List<Lunch> searchLunch(String query) {
	        return lunchrepository.findByFoodContainingIgnoreCase(query);
	    }
	   public List<Snack> searchSnack(String query) {
	        return snackrepository.findByFoodContainingIgnoreCase(query);
	    }
	   
	   
	   
	   public void addBrinnerItem(Diary diary ,  Brinner brinner) {
			diary.getBrinneritems().add(brinner);
			diaryrepository.save(diary);	

			
			
			
		}
	   
	   public void addLunchItem(Diary diary ,  Lunch lunch) {
			diary.getLunchitems().add(lunch);
			diaryrepository.save(diary);	

			
			
		
		}
	   
	   public void addSnackItem(Diary diary ,  Snack snack) {
				diary.getSnackitems().add(snack);
				diaryrepository.save(diary);	

				
				
				
			}
	   
	   
	   
	   
	   public void removeBrinnerItem(Diary diary ,  Brinner brinner) {
			diary.getBrinneritems().remove(brinner);
			diaryrepository.save(diary);	

			
			
			
		}
	   public void removelunchItem(Diary diary ,  Lunch lunch) {
			diary.getLunchitems().remove(lunch);
			diaryrepository.save(diary);	

			
			
			
		}
	   public void removeSnackItem(Diary diary ,  Snack snack) {
				diary.getSnackitems().remove(snack);
				diaryrepository.save(diary);	

				
				
				
			}
	   
	   
	   public Brinner findBrinner(Long id){
			Optional<Brinner> theOptional = binnerrepository.findById(id);
			if (theOptional.isPresent()) {
				return theOptional.get();
			}
			return  null;
			
		}
	   
	   
	   public Lunch findLunch(Long id){
			Optional<Lunch> theOptional = lunchrepository.findById(id);
			if (theOptional.isPresent()) {
				return theOptional.get();
			}
			return  null;
			
		}
	   
	   public Snack findSnack(Long id){
			Optional<Snack> theOptional = snackrepository.findById(id);
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
	   
	   public void reset(Diary d) {
		d.setLunchitems(null);
		d.setSnackitems(null);
		d.setBrinneritems(null);
		d.setCaloriesin(0);
		
	}
	   
		/*
		 * public List<Brinner> joinedBrinner(Diary diary){ return
		 * binnerrepository.findAllByDiary(diary); }
		 */

	   
	   
	   
	   
}
