/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Category;
import com.sam.shoppingonline.repository.CategoryRepository;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
@RequestMapping(value = "/cate")
public class CategoryController {

    private static final Logger LOGGER = Logger.getLogger(CategoryController.class.getName());
    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/cate/index", "listCate", categoryRepository.findAll());
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create() {
        return new ModelAndView("/cate/create", "cate", new Category());
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("cate") Category cate,
            BindingResult result, ModelMap model) {
        LOGGER.log(Level.INFO, "info:{0}");
        if (result.hasErrors()) {
            return "redirect:/cate/error";
        }
        categoryRepository.save(cate);
        return "redirect:/cate/index";
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam(value = "id", required = false) int id) {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/cate/details", "cate", categoryRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) int id) {
        return new ModelAndView("/cate/edit", "cate", categoryRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@Valid
            @ModelAttribute("cate") Category cate,
            BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "redirect:/cate/error";
        }
        categoryRepository.save(cate);
        return "redirect:/cate/index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) int id) {
        categoryRepository.delete(id);
        return "redirect:/cate/index";
    }
}
