/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras;

import livraria.core.IStrategy;
import ecommerce.dominio.EntidadeDominio;

/**
 *
 * @author matheus
 */
public abstract class AbstractStrategy implements IStrategy{
    
    protected StringBuilder sb = new StringBuilder();
    
    protected String ValidaMensagem(){
        if(sb.length() > 0){
            return sb.toString();
        }
        return null;
    }

}
