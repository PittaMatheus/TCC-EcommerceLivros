/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.cliente;

import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.regras.AbstractStrategy;

import java.util.Date;

/**
 *
 * @author matheus
 */
public class ValidaData extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
            String str = "";
        Cliente cliente = (Cliente) entidade;
        Date dataAtual = new Date(System.currentTimeMillis());
        Date dataLimite = new Date("01/01/2011");
        
        // Verifica se é posterior a data atual(modificar para verificar se o cliente tem no minimo 10 anos)
        if(cliente.getData_nascimento().after(dataAtual)){
            return str+="<li>Data invalida</li>";
        }else if(cliente.getData_nascimento().after(dataLimite)){
            return str+="<li>Data invalida</li>";
        }

           
        
        
        return str;
    }
    
}
