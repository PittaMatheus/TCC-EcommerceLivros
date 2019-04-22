/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.cliente;

import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class ValidaSenhaForte extends AbstractStrategy{
    // Minimo 8 caracteres
    // Minimo 1 Letra Maiuscula
    // Mínimo 1 caracter especial
    @Override
    public String validar(EntidadeDominio entidade) {
        
        String charEsp = "~`!@#$%^&*()-_=+\\|[{]};:'\\\",<.>/?";
		String str = "";
		Boolean flgMaiuscula = false;
		Boolean flgCharEsp = false;
		
		Cliente cliente = (Cliente) entidade;
		
		if(cliente.getSenha().length() < 8) 
			str += "<li>A senha deve conter ao menos 8 dígitos</li>";
		for (int i = 0; i < cliente.getSenha().length(); i++) {
			if(Character.isUpperCase((cliente.getSenha().charAt(i))))
				flgMaiuscula = true;
			if(charEsp.contains(String.valueOf(cliente.getSenha().charAt(i))))
				flgCharEsp = true;
		}
		
		if(!flgMaiuscula)
			str += "<li>Senha deve ter pelo menos uma letra maiuscula</li>";
		if(!flgCharEsp)
			str += "<li>Senha deve ter pelo menos um caracter especial</li>";
		
		return str;
    }
    
}
