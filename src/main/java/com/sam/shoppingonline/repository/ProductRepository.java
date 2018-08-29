/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.repository;

import com.sam.shoppingonline.entity.Product;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Le An
 */
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = "SELECT p FROM Product p")
    public List<Product> paging(Pageable pageable);

    @Query(value = "SELECT p FROM Product p WHERE LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%')")
    public List<Product> findAndPaging(@Param("name") String name, Pageable pageable);
    
    @Query(value = "SELECT COUNT(p) FROM Product p WHERE LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%')")
    public Integer countResultForSearch(@Param("name") String name);
    
    @Query(value = "SELECT p FROM Product p WHERE LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%') AND p.category.id = :cateId")
    public List<Product> searchByCateAndKeyWord(@Param("name") String name,@Param("cateId") Integer cateId, Pageable pageable);
    
    @Query(value = "SELECT COUNT(p) FROM Product p WHERE LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%') AND p.category.id = :cateId")
    public Integer countResultForSearchByCateAndKeyWord(@Param("name") String name,@Param("cateId") Integer cateId);

    @Query(value = "SELECT p FROM Product p WHERE p.category.id = :cateId")
    public List<Product> searchByCategory(@Param("cateId") Integer cateId, Pageable pageable);

    @Query(value = "SELECT COUNT(p) FROM Product p WHERE p.category.id = :cateId")
    public Integer countProductByCategory(@Param("cateId") Integer cateId);
    
    @Query(value = "SELECT MAX(p.price) FROM Product p WHERE p.category.id = :cateId")
    public Double maxPriceWithCategory(@Param("cateId") Integer cateId);
    
    @Query(value = "SELECT MIN(p.price) FROM Product p WHERE p.category.id = :cateId")
    public Double minPriceWithCategory(@Param("cateId") Integer cateId);
    
    @Query(value = "SELECT SUM(p.price) FROM Product p WHERE p.category.id = :cateId")
    public Double totalPriceWithCategory(@Param("cateId") Integer cateId);
    
    @Query(value = "SELECT AVG(p.price) FROM Product p WHERE p.category.id = :cateId")
    public Double averagePriceWithCategory(@Param("cateId") Integer cateId);
}
