/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.FileModel;
import com.sam.shoppingonline.entity.Role;
import com.sam.shoppingonline.entity.User;
import com.sam.shoppingonline.repository.RoleRepository;
import com.sam.shoppingonline.repository.UserRepository;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Le An
 */
@Controller
@RequestMapping(value = "/auth")
public class AuthenticationController {

    private static final Logger LOGGER = Logger
            .getLogger(ProductController.class.getName());

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping(value = "/login")
    public ModelAndView getLoginForm(
            @RequestParam(required = false) String authfailed, String logout, String denied) {
        String message = "";
        if (authfailed != null) {
            message = "Invalid username or password, please try again!";
        } else if (logout != null) {
            message = "Log out successfully";
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
    public ModelAndView register(ModelMap modelMap) {
        LOGGER.log(Level.INFO, "info:{0}");
        modelMap.put("user", new User());
        return new ModelAndView("/auth/register", modelMap);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid @ModelAttribute("product") User user,
            BindingResult result, @Validated FileModel file, ModelMap model) {
        User findUser = userRepository.searchByUsername(user.getUsername());
        if (findUser != null) {
            model.addAttribute("error", "Username is existed!");
            return "/auth/register";
        } else {
            userRepository.save(user);
            Role role = new Role();
            role.setUsername(user);
            roleRepository.save(role);
            return "redirect:/auth/login";
        }
    }
}
