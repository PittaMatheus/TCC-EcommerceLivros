/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.util;

import java.math.BigDecimal;

/**
 *
 * @author matheus
 */
public class PrecoUtils {
    
     public static Double arredondarPreco(Double preco){
        if(preco == null)
            return null;

        BigDecimal bd = new BigDecimal(preco);
        return bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

    }
}
