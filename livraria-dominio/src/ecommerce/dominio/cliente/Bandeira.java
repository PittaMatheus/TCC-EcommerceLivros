/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.cliente;

import ecommerce.dominio.EntidadeDominio;

/**
 *
 * @author matheus
 */
public class Bandeira extends EntidadeDominio{
    
    	private String nome;
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}    
}