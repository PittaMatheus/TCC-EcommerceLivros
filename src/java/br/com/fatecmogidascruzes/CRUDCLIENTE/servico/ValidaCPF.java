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
public class ValidaCPF extends AbstractStrategy {

    @Override
    public String validar(EntidadeDominio entidade) {
        Cliente cliente = (Cliente) entidade;
        if(cliente.getCpf().length() == 0)
            sb.append("CPF vazio");
        if(cliente.getCpf().length()!= 4)
            sb.append("CPF invalido");
        return ValidaMensagem();
    }
    
    
}
