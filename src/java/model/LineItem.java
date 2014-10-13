/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Objects;

/**
 *
 * @author INT303
 */
public class LineItem {
    private Product product;
    private int unit=1;

    public LineItem() {
    }

    public LineItem(Product p) {
        this.product = p;
    }

    public LineItem(Product p, int unit) {
        this.product = p;
        this.unit = unit;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product p) {
        this.product = p;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    @Override
    public String toString() {
        return "LineItem{" + "product=" + product.getProductNO()+","+product.getName() +","+product.getDescription() + "(unit = " + unit + " )" + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final LineItem other = (LineItem) obj;
        if (!Objects.equals(this.product, other.product)) {
            return false;
        }
        return true;
    }
    
    public double getTotal(){
        return unit * (product.getPrice());
    }
}
