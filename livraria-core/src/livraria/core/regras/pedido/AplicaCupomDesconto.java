/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Pedido;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class AplicaCupomDesconto extends AbstractStrategy {

    @Override
    public String validar(EntidadeDominio entidade) {
        String str="";
        Pedido pedido = (Pedido) entidade;
        ValidaCupomDesconto validaCupom = new ValidaCupomDesconto();
        str = validaCupom.validar(pedido);
        return str;
    }
    
}
