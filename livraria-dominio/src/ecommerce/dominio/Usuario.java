/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio;

import ecommerce.dominio.EntidadeDominio;

/**
 *
 * @author matheus
 */
public class Usuario extends EntidadeDominio{
    
    private Integer id;
    private String papel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPapel() {
        return papel;
    }

    public void setPapel(String papel) {
        this.papel = papel;
    }
    
    
    
}
