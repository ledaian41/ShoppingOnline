/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Product;
import com.sam.shoppingonline.repository.CategoryRepository;
import com.sam.shoppingonline.repository.ProductRepository;
import com.sam.shoppingonline.util.Constant;
import com.sam.shoppingonline.util.PagingUtil;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Le An
 */
@Controller
@RequestMapping(value = "/home")
public class HomeController {

    @Autowired
    ServletContext context;

    private static final Logger LOGGER = Logger
            .getLogger(HomeController.class.getName());
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(
            @RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "cate", required = false) Integer cateId,
            ModelMap mm) {
        if (page == null) {
            page = 0;
        } else {
            page--;
        }
        List<Product> listProduct;
        long totalPage = 1;
        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page,
                Constant.NUMBER_ELEMENT_IN_PAGE, sort);
        if (keyword == null || keyword.isEmpty()) {
            if (cateId == null) {
                listProduct = productRepository.paging(pageable);
                totalPage = PagingUtil.totalPage(productRepository.count());
                mm.remove("keyword");
                mm.remove("cateId");
            } else {
                listProduct = productRepository.searchByCategory(cateId,
                        pageable);
                totalPage = PagingUtil.totalPage(
                        productRepository.countProductByCategory(cateId));
                mm.put("cateId", cateId);
                mm.remove("keyword");
            }
        } else {
            listProduct = productRepository.findAndPaging(keyword,
                    pageable);
            totalPage = PagingUtil.totalPage(productRepository
                    .countResultForSearch(keyword));
            mm.put("keyword", keyword);
            mm.remove("cateId");
        }
        mm.put("page", page + 1);
        mm.put("totalPage", totalPage);
        mm.put("listCate", categoryRepository.findAll());
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/home/index", "listProduct", listProduct);
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(
            @RequestParam(value = "id", required = false) int id, ModelMap mm) {
        mm.put("listCate", categoryRepository.findAll());
        mm.put("product", productRepository.findOne(id));
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/home/details", mm);
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error() {
        return "/product/error";
    }
}
