package com.codingdojo.auth.models;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import jakarta.annotation.Nullable;
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
    @Nullable
    private int height;
    @Nullable
    private int weight;
    @Nullable
    private String gender;
    @Nullable
    private int age;
    @Nullable
    private HashMap<Double,String> activityLevels;
    @Nullable
	private String activityLevel;
    @Nullable
	private HashMap<Integer,String> goals;
    @Nullable
	private String goal;
    @Nullable
	private String bmi;
    
    private Date createdAt;
    private Date updatedAt;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List <Role> roles;
	 
	 public User() {
		 activityLevels.put(1.2, "Sedentary");
			activityLevels.put(1.375, "Lightly active");
			activityLevels.put(1.46, "Lightly to moderately active");
			activityLevels.put(1.55, "Moderately active");
			activityLevels.put(1.725, "Very active");
			activityLevels.put(1.9, "Super active");
			goals.put(0, "Maintain weight");
			goals.put(1, "Lose weight");
			goals.put(2, "Gain weight");
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
	 public String getGoal() {
			return goal;
		}


	public void setGoal(Integer goal) {
		this.goal = goals.get(goal);
	}


	


	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getActivitylevel() {
		return activityLevel;
	}


	public void setActivitylevel(Double act) {
		this.activityLevel = activityLevels.get(act);
	}


	public String getBmi() {
		return bmi;
	}


	public void setBmi(String bmi) {
		this.bmi = bmi;
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


