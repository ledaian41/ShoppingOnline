/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.User;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Le An
 */
@Controller
@RequestMapping(value = "/auth")
public class AuthenticationController {

    @RequestMapping(value = "/login")
    public ModelAndView getLoginForm(
            @RequestParam(required = false) String authfailed, String logout, String denied) {
        String message = "";
        if (authfailed != null) {
            message = "Invalid username or password, please try again!";
        } else if (logout != null) {
            message = "Logget out successfully";
        } else if (denied != null) {
            message = "Access denied for this user";
        }
        return new ModelAndView("/auth/login", "message", message);
    }

    @RequestMapping(value = "/403page")
    public String get403denied() {
        return "redirect:/auth/login?denied";
    }
    
    @RequestMapping(value = "/register")
    public String register() {
        return "/auth/register";
    }
    
//    public ModelAndView registerUserAccount(@Valid @ModelAttribute("user") User user, BindingResult result) {
//        
//    }
}
