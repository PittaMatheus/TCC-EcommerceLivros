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
public interface ICommand {
    public Resultado executar(EntidadeDominio entidade);
}
