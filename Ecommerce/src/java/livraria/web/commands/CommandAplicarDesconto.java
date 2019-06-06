/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.commands;

import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;

/**
 *
 * @author matheus
 */
public class CommandAplicarDesconto extends AbstractCommand{

    @Override
    public Resultado executar(EntidadeDominio entidade) {
        String str = "";
        fachada.RegrasDeNegocio(entidade,"");
        Resultado resultado = new Resultado();
        return resultado;
    }
    
}
