/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core;

import ecommerce.dominio.EntidadeDominio;

/**
 *
 * @author matheus
 */
public interface IStrategy {
    public String validar(EntidadeDominio entidade);
}
