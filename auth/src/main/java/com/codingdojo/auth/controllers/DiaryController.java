package com.codingdojo.auth.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.auth.models.Brinner;
import com.codingdojo.auth.models.Diary;
import com.codingdojo.auth.services.DiaryService;

@Controller
public class DiaryController {

    @Autowired
    private DiaryService diaryService;
    
    
   

    @GetMapping("/searchBrinner")
    public String searchBrinner(@RequestParam("query") String query, @RequestParam("type") String type, Model model) {
        List<Brinner> results = diaryService.searchBrinner(query);
        model.addAttribute("results", results);
        model.addAttribute("type", type);
        model.addAttribute("query", query);
        return "foodDiary.jsp";
    }
    
    @PostMapping("/addToDiary")
    public String addToDiary(@RequestParam("foodId") Long foodId, @RequestParam("diaryId") Long diaryId) {
        Diary diary = diaryService.findDiary(diaryId);
        Brinner brinner = diaryService.findBrinner(foodId);
        diaryService.addBrinnerItem(diary, brinner);
        return "redirect:/foodDiary";
    }
    
}
