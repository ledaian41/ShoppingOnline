/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.FileModel;
import com.sam.shoppingonline.entity.Product;
import com.sam.shoppingonline.repository.CategoryRepository;
import com.sam.shoppingonline.repository.ProductRepository;
import com.sam.shoppingonline.util.UploadFileUtil;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Le An
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    ServletContext context;

    private static final Logger LOGGER = Logger
            .getLogger(ProductController.class.getName());
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/product/index", "listProduct",
                productRepository.findAll());
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(ModelMap modelMap) {
        LOGGER.log(Level.INFO, "info:{0}");
        modelMap.put("product", new Product());
        modelMap.put("listCate", categoryRepository.findAll());
        return new ModelAndView("/product/create", modelMap);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("product") Product product,
            @Validated FileModel file, BindingResult result, ModelMap model)
            throws IOException {
        LOGGER.log(Level.INFO, "info:{0}");
        if (result.hasErrors()) {
            return "redirect:/product/error";
        }
        if (!file.getFile().isEmpty()) {

            //upload file
            MultipartFile mf = UploadFileUtil.uploadFile(file, context);
            String fileName = mf.getOriginalFilename();

            //set thumnail is file path on server
            product.setThumnail(fileName);
        }

        //save product
        productRepository.save(product);
        return "redirect:/product/index";
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(
            @RequestParam(value = "id", required = false) int id) {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/product/details", "product",
                productRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(
            @RequestParam(value = "id", required = false) int id,
            ModelMap modelMap) {
        modelMap.put("product", productRepository.findOne(id));
        modelMap.put("listCate", categoryRepository.findAll());
        return new ModelAndView("/product/edit", modelMap);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@Valid @ModelAttribute("product") Product product,
            @Validated FileModel file, BindingResult result,
            ModelMap model) throws IOException {
        if (result.hasErrors()) {
            System.err.println(result);
            return "redirect:/product/error";
        }
        if (!file.getFile().isEmpty()) {

            //upload file
            MultipartFile mf = UploadFileUtil.uploadFile(file, context);
            String fileName = mf.getOriginalFilename();

            //set thumnail is file path on server
            product.setThumnail(fileName);
        }

        productRepository.save(product);
        return "redirect:/product/index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) int id) {
        productRepository.delete(id);
        return "redirect:/product/index";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error() {
        return "/product/error";
    }
}
