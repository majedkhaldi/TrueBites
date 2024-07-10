package com.codingdojo.auth.repositories;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.auth.models.Role;


@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {
	
	Role findByName(String name);
	
}


// their version didn't work 
//@Repository
//public interface RoleRepository extends CrudRepository {
//    List<Role> findAll();
//    List<Role> findByName(String name);
//}