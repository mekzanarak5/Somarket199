/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

/**
 *
 * @author Admin
 */
public class Util {
    public static <K,V extends Comparable<? super V>> List<Entry<K, V>>entriesSortedByValues(TreeMap<K,V> map){
        List<Entry<K,V>> sortedEntries = new ArrayList<Entry<K,V>>(map.entrySet());
        Collections.sort(sortedEntries, 
            new Comparator<Entry<K,V>>(){
                @Override
                public int compare(Entry<K,V> e1, Entry<K,V> e2) {
                    return e2.getValue().compareTo(e1.getValue());
                }
            }
        );
        return sortedEntries;
    }
}
