/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;

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
