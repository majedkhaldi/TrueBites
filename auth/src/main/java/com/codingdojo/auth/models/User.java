package com.codingdojo.auth.models;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // NEW
    @Size(min=3)
    private String username;
    
    // NEW
    @Size(min=5)
    private String password;
    
    @Transient
    @NotEmpty()
	@Size(min = 8)
    private String passwordConfirmation;
    
    private Date createdAt;
    private Date updatedAt;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List <Role> roles;
	 
	 public User() {
	 }
	 
	 public Long getId() {
	     return id;
	 }
	 public void setId(Long id) {
	     this.id = id;
	 }
	 public String getUsername() {
	     return username;
	 }
	 public void setUsername(String username) {
	     this.username = username;
	 }
	 public String getPassword() {
	     return password;
	 }
	 public void setPassword(String password) {
	     this.password = password;
	 }
	 public String getPasswordConfirmation() {
	     return passwordConfirmation;
	 }
	 public void setPasswordConfirmation(String passwordConfirmation) {
	     this.passwordConfirmation = passwordConfirmation;
	 }
	 public Date getCreatedAt() {
	     return createdAt;
	 }
	 public void setCreatedAt(Date createdAt) {
	     this.createdAt = createdAt;
	 }
	 public Date getUpdatedAt() {
	     return updatedAt;
	 }
	 public void setUpdatedAt(Date updatedAt) {
	     this.updatedAt = updatedAt;
	 }
	 public List<Role> getRoles() {
	     return roles;
	 }
	 public void setRoles(Role role) {
	     this.roles = (List<Role>) role;
	 }
	 
	 @PrePersist
	 protected void onCreate(){
	     this.createdAt = new Date();
	 }
	 @PreUpdate
	 protected void onUpdate(){
	     this.updatedAt = new Date();
	 }
}


