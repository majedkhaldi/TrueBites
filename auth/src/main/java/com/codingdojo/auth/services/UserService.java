package com.codingdojo.auth.services;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.codingdojo.auth.models.Diary;
import com.codingdojo.auth.models.User;
import com.codingdojo.auth.repositories.DiaryRepository;
import com.codingdojo.auth.repositories.RoleRepository;
import com.codingdojo.auth.repositories.UserRepository;
 
@Service
public class UserService {
    private UserRepository userRepository;
    private DiaryRepository diaryRepository;
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
   
    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    
    // 1
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        Diary diary = new Diary();
        diary.setUser(user);
        user.setDiary(diary);
        diaryRepository.save(diary);
        userRepository.save(user);
    }
     
    // 2 
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }    
    
    // 3
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    public User findById(Long id) {
    	Optional<User> potential = userRepository.findById(id);
    	if(potential.isPresent()) {
    		return potential.get();
    	}
    	return null;
    }
    
    public User updateUser(User user) {
    	return userRepository.save(user);
    }
    
//    public User updateUser(User user, BindingResult result) {
//    	return userRepository.save(user);
//    } 
}


