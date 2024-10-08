package com.codingdojo.auth.models;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.annotation.Nullable;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Email
    private String email;


	
    @Size(min=3)
    private String username;
    
    


    @Size(min=5)
    private String password;
 
    @Transient
    
	@Size(min = 5)
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
    private int eer;
    @Nullable
    @Column(columnDefinition = "TEXT")
    private String activityLevels;
    @Nullable

	private String activityLevel;
	@Nullable
	@Column(columnDefinition = "TEXT")
	private String goals;
	@Nullable
	private String goal;
	@Nullable
	private String bmi;
    
    private Date createdAt;
    private Date updatedAt;
    
    @OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Diary diary;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List <Role> roles;
    
    @Transient
    private Map<Double, String> activityLevelsMap = new HashMap<>();

    @Transient
    private Map<Integer, String> goalsMap = new HashMap<>();
	 
	public User() {
		 activityLevelsMap.put(1.2, "Sedentary");
		 activityLevelsMap.put(1.375, "Lightly active");
		 activityLevelsMap.put(1.46, "Lightly to moderately active");
		 activityLevelsMap.put(1.55, "Moderately active");
		 activityLevelsMap.put(1.725, "Very active");
		 activityLevelsMap.put(1.9, "Super active");
		 goalsMap.put(0, "Maintain weight");
		 goalsMap.put(1, "Lose weight");
		 goalsMap.put(2, "Gain weight");
	        try {
	            this.activityLevels = convertMapToJson(activityLevelsMap);
	            this.goals = convertMapToJson(goalsMap);
	        } catch (JsonProcessingException e) {
	            e.printStackTrace();
	        }
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
	 public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
		this.goal = goalsMap.get(goal);
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
		this.activityLevel = activityLevelsMap.get(act);
	}

	public int getEer() {
		return eer;
	}

	public void setEer(int eer) {
		this.eer = eer;
	}

	public String getBmi() {
		return bmi;
	}

	public void setBmi(String bmi) {
		this.bmi = bmi;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	
	public String getActivityLevels() {
		return activityLevels;
	}

	public void setActivityLevels(String activityLevels) {
		this.activityLevels = activityLevels;
	}

	public String getActivityLevel() {
		return activityLevel;
	}

	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}

	public String getGoals() {
		return goals;
	}

	public void setGoals(String goals) {
		this.goals = goals;
	}

	public Map<Double, String> getActivityLevelsMap() {
		return activityLevelsMap;
	}

	public void setActivityLevelsMap(Map<Double, String> activityLevelsMap) {
		this.activityLevelsMap = activityLevelsMap;
	}

	public Map<Integer, String> getGoalsMap() {
		return goalsMap;
	}

	public void setGoalsMap(Map<Integer, String> goalsMap) {
		this.goalsMap = goalsMap;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	private String convertMapToJson(Map<?, ?> map) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.writeValueAsString(map);
	}

	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}




}
