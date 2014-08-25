/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) {
        List<Product> l = Product.showProduct();
        for (Product product : l) {
            System.out.println(product.getProductNO());
        }
    }
}
