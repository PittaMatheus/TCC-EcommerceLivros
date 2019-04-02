/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;

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
