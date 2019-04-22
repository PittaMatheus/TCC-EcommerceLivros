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
public class CommandAtivar extends AbstractCommand{

    @Override
    public Resultado executar(EntidadeDominio entidade) {
        return fachada.ativar(entidade);
    }
    
}
