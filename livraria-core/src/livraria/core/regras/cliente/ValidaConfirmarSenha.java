/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.cliente;

import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class ValidaConfirmarSenha extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        Cliente cliente = (Cliente) entidade;
        
        if(!cliente.getSenha().equals(cliente.getConfirmarSenha())){
            return "<li>Os campos de senham não correspondem</li>";
        }
        return "";
    }
    
}
