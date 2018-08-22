/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Category;
import com.sam.shoppingonline.entity.Report;
import com.sam.shoppingonline.repository.CategoryRepository;
import com.sam.shoppingonline.repository.ProductRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Le An
 */
@Controller
@RequestMapping(value = "/report")
public class ReportController {
    
    private static final Logger LOGGER = Logger.getLogger(ReportController.class.getName());
    @Autowired
    private CategoryRepository categoryRepository;
    
    @Autowired
    private ProductRepository productRepository;
    
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView getProductReport(ModelMap mm) {
        List<Category> listCate = categoryRepository.findAll();
        List<Report> listReport = new ArrayList<>();
        for (Category c : listCate) {
            Integer countProduct = productRepository.countProductByCategory(c.getId());
            Double maxPrice = productRepository.maxPriceWithCategory(c.getId());
            Double minPrice = productRepository.minPriceWithCategory(c.getId());
            Double totalPrice = productRepository.totalPriceWithCategory(c.getId());
            Double averagePrice = productRepository.averagePriceWithCategory(c.getId());
            if (countProduct == null) {
                countProduct = 0;
            }
            if (maxPrice == null) {
                maxPrice = 0.0;
            }
            if (minPrice == null) {
                minPrice = 0.0;
            }
            if (totalPrice == null) {
                totalPrice = 0.0;
            }
            if (averagePrice == null) {
                averagePrice = 0.0;
            }
            Report report = new Report();
            report.setGroup(c.getName());
            report.setCount(countProduct);
            report.setSum(totalPrice);
            report.setMin(minPrice);
            report.setMax(maxPrice);
            report.setAvg(averagePrice);
            listReport.add(report);
        }
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/report/product", "listReport", listReport);
    }
    
}
