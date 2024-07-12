package com.codingdojo.auth.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codingdojo.auth.models.Diary;

public interface DiaryRepository extends JpaRepository<Diary, Long> {

}
