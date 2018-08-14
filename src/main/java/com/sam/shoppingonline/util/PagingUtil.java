/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.util;

import com.sam.shoppingonline.entity.Category;
import java.util.List;

/**
 *
 * @author Le An
 */
public class PagingUtil {

    public static long totalPage(long size) {
        if (size != 0) {
            long totalPage = size / Constant.NUMBER_ELEMENT_IN_PAGE;
            if (size % 5 != 0) {
                totalPage++;
            }
            return totalPage;
        }
        return 1;
    }
}
