package com.codingdojo.auth.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.codingdojo.auth.models.User;
import com.codingdojo.auth.repositories.UserRepository;


@Component
public class UserValidator implements Validator {
	@Autowired
	UserRepository userRepository;
    
    //    1
    @Override
    public boolean supports(Class<?> c) {
        return User.class.equals(c);
    }
    
    // 2
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }
        if (userRepository.findByUsername(user.getUsername()) != null)
        {
           errors.rejectValue("username", "Unique", "Username is already taken");
       }

       if (userRepository.findByEmail(user.getEmail()) != null) {
           errors.rejectValue("email", "Unique", "Email is already registered");
       }
       
    }
    
}

