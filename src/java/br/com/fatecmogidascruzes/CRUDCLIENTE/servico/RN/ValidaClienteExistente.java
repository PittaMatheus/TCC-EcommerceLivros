/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN;

import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.CommandConsultarPorID;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class ValidaClienteExistente extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        String str ="";
        Cliente cliente = (Cliente) entidade;
        CommandConsultarPorID consultar = new CommandConsultarPorID();
        consultar.executar(cliente);
            
        return str;
    }
    
}
