/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.controle;

import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;

/**
 *
 * @author matheus
 */
public class CommandAutenticar extends AbstractCommand {

    @Override
    public Resultado executar(EntidadeDominio entidade) {
        return fachada.autenticar(entidade);
    }
    
}
