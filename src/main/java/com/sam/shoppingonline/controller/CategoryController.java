/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Category;
import com.sam.shoppingonline.entity.Product;
import com.sam.shoppingonline.repository.CategoryRepository;
import com.sam.shoppingonline.repository.ProductRepository;
import com.sam.shoppingonline.util.Constant;
import com.sam.shoppingonline.util.PagingUtil;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

    private static final Logger LOGGER = Logger
            .getLogger(CategoryController.class.getName());
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(
            @RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "keyword", required = false) String keyword,
            ModelMap mm) {
        if (page == null) {
            page = 0;
        } else {
            page--;
        }
        List<Category> listCate;
        long totalPage;
        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, Constant.NUMBER_ELEMENT_IN_PAGE, sort);
        if (keyword == null || keyword.isEmpty()) {
            listCate = categoryRepository.paging(pageable);
            totalPage = PagingUtil.totalPage(categoryRepository.count());
            mm.remove("keyword");
        } else {
            listCate = categoryRepository.findAndPaging(keyword, pageable);
            totalPage = PagingUtil.totalPage(categoryRepository.countResultForSearch(keyword));
            mm.put("keyword", keyword);
        }
        mm.put("page", page + 1);
        mm.put("totalPage", totalPage);
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/cate/index", "listCate", listCate);
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
            return "/cate/create";
        }
        categoryRepository.save(cate);
        return "redirect:/cate/index";
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(
            @RequestParam(value = "id", required = false) int id) {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/cate/details", "cate",
                categoryRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(
            @RequestParam(value = "id", required = false) int id) {
        return new ModelAndView("/cate/edit", "cate",
                categoryRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@Valid
            @ModelAttribute("cate") Category cate,
            BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "/cate/edit";
        }
        categoryRepository.save(cate);
        return "redirect:/cate/index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) int id) {
        List<Product> products = productRepository.searchByCategory(id, null);
        for (Product product : products) {
            product.setCategory(null);
        }
        productRepository.save(products);
        categoryRepository.delete(id);
        return "redirect:/cate/index";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error() {
        return "/cate/error";
    }
}
