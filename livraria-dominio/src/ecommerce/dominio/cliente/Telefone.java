/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.cliente;

/**
 *
 * @author matheus
 */
public class Telefone {
    private String ddd;
    private String numero;
    private String tipo;

	
	public Telefone( String ddd, String numero, String tipo) {
		super();
		this.ddd = ddd;                
		this.numero = numero;
		this.tipo = tipo;
	}
        public Telefone(){
            
        }
	
	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String	 getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
}