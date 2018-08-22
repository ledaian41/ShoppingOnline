/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.repository;

import com.sam.shoppingonline.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Le An
 */
public interface UserRepository extends JpaRepository<User, Integer> {

}
