
  package com.codingdojo.auth.models;
 
  import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import
  jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
  
  //...
  
  @Entity
  
  @Table(name="diaries") public class Diary {
  
  @Id
  
  @GeneratedValue(strategy = GenerationType.IDENTITY) private Long id;
  
  
  
  
  @Column(updatable=false)
  private Date createdAt;
  private Date updatedAt;
  
  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable( name = "diaries_lunchItems",
  joinColumns = @JoinColumn(name ="diary_id"),
  inverseJoinColumns = @JoinColumn(name = "lunchitem_id")
  )
  private List <Lunch> lunchitems;
  
  
  @OneToOne(fetch=FetchType.LAZY)
  @JoinColumn(name="user_id")
  private User user;
      
  
  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable( name = "diaries_snackitems",
  joinColumns = @JoinColumn(name ="diary_id"),
  inverseJoinColumns = @JoinColumn(name = "snackitem_id") 
  )
  private List <Snack> snackitems;
  
  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable( name = "diaries_brinneritems",
  joinColumns = @JoinColumn(name ="diary_id"),
  inverseJoinColumns = @JoinColumn(name = "brinneritem_id")
  )
  private List <Brinner> brinneritems;
  
  
  
  
  
  public Diary(User user) {
	  this.user = user;
	  
	  
  
  }





public Long getId() {
	return id;
}





public void setId(Long id) {
	this.id = id;
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





public List<Lunch> getLunchitems() {
	return lunchitems;
}





public void setLunchitems(List<Lunch> lunchitems) {
	this.lunchitems = lunchitems;
}





public List<Snack> getSnackitems() {
	return snackitems;
}





public void setSnackitems(List<Snack> snackitems) {
	this.snackitems = snackitems;
}





public List<Brinner> getBrinneritems() {
	return brinneritems;
}





public void setBrinneritems(List<Brinner> brinneritems) {
	this.brinneritems = brinneritems;
}
  
  }
 
