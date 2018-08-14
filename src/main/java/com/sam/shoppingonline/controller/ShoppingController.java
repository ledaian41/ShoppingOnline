/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Cart;
import com.sam.shoppingonline.entity.Product;
import com.sam.shoppingonline.repository.ProductRepository;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping(value = "/shop")
public class ShoppingController {

    private static final Logger LOGGER = Logger.getLogger(
            ShoppingController.class.getName());

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(HttpSession session, ModelMap mm) {
        HashMap<Integer, Integer> cartMapping
                = (HashMap<Integer, Integer>) session.getAttribute("cart");
        ArrayList<Cart> myCart = fetchDataShoppingCart(cartMapping);
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/shop/index", "myCart", myCart);
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order(@RequestParam int id, @RequestParam int quantity,
            HttpSession session) {
        HashMap<Integer, Integer> cartMapping
                = (HashMap<Integer, Integer>) session.getAttribute("cart");
        if (cartMapping == null) {
            cartMapping = new HashMap<>();
            cartMapping.put(id, quantity);
        } else {
            if (cartMapping.get(id) == null) {
                cartMapping.put(id, quantity);
            } else {
                int amount = cartMapping.get(id) + quantity;
                if (amount != 0) {
                    cartMapping.put(id, amount);
                } else {
                    cartMapping.remove(id);
                }
            }
        }
        session.setAttribute("cart", cartMapping);
        return "redirect:index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam int id, HttpSession session) {
        HashMap<Integer, Integer> cartMapping
                = (HashMap<Integer, Integer>) session.getAttribute("cart");
        if (cartMapping != null) {
            cartMapping.remove(id);
        }
        session.setAttribute("cart", cartMapping);
        return "redirect:index";
    }

    private ArrayList<Cart> fetchDataShoppingCart(
            HashMap<Integer, Integer> cartMapping) {
        ArrayList<Cart> myCart = new ArrayList<>();
        if (cartMapping != null) {
            for (Map.Entry<Integer, Integer> entry : cartMapping.entrySet()) {
                Product product = productRepository.findOne(entry.getKey());
                if (product != null) {
                    myCart.add(new Cart(product, entry.getValue()));
                }
            }
        }
        return myCart;
    }
}
