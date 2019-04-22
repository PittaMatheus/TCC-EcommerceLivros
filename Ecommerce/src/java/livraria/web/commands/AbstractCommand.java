/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.commands;

import livraria.core.controle.Fachada;
import livraria.core.IFachada;

/**
 *
 * @author matheus
 */
public abstract class AbstractCommand implements ICommand {

	protected IFachada fachada = new Fachada();
}