package com.codingdojo.auth.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.codingdojo.auth.models.User;


@Component
public class UserValidator implements Validator {
    
    //    1
    @Override
    public boolean supports(Class<?> c) {
        return User.class.equals(c);
    }
    
    // 2
    // Creating our custom validation, we can add errors via .rejectValue(String, String).
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
        	// the 1st argument is the member variable of our Domain model that we are validating. 
        	// The 2nd argument is a code for us to use to set an error message.
            errors.rejectValue("passwordConfirmation", "Match");
        }         
    }
}

