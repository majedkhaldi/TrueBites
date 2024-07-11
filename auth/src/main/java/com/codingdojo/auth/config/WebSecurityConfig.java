package com.codingdojo.auth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

// imports removed for brevity
@Configuration
public class WebSecurityConfig {
	
	@Autowired HandlerMappingIntrospector introspector;
	
	private UserDetailsService userDetailsService;
  
  // Add BCrypt Bean
	  @Bean
	  public BCryptPasswordEncoder bCryptPasswordEncoder() {
	    return new BCryptPasswordEncoder();
	  }
    
    
  @Bean
  protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{		
    http
	.authorizeHttpRequests(
	  auth -> auth.requestMatchers(
		new MvcRequestMatcher(introspector, "/admin/**")
		).hasRole("ADMIN")
	  .requestMatchers(
		new MvcRequestMatcher(introspector, "/profile"),
		new MvcRequestMatcher(introspector, "/home"),
		new MvcRequestMatcher(introspector, "/more")
		).authenticated()
	  .anyRequest().permitAll()
	  )
	.formLogin(
	  form -> form.loginPage("/login")
	  .defaultSuccessUrl("/home")
	  .permitAll()
	  )
	.logout(
	  logout -> logout.permitAll()
	);

    return http.build();
  }
    
    // removed for brevity
}

