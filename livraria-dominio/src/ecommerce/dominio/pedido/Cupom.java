/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import java.util.Date;

/**
 *
 * @author matheus
 */

public class Cupom extends EntidadeDominio {
        private Integer id;
	private String nome;
	private Double valorDesconto;
        private String codigo;
        private Date validade;
        
        public Cupom(){
        }
        
        public Cupom(String nome, Double valorDesconto, Integer id){
            super();
            this.id = id;
            this.nome = nome;
            this.valorDesconto = valorDesconto;
            this.codigo = codigo;
            this.validade = validade;
        }

        public Date getValidade() {
            return validade;
        }

        public void setValidade(Date validade) {
            this.validade = validade;
        }


	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Double getValorDesconto() {
		return valorDesconto;
	}
	public void setValorDesconto(Double valorDesconto) {
		this.valorDesconto = valorDesconto;
	}

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        public String getCodigo() {
            return codigo;
        }

        public void setCodigo(String codigo) {
            this.codigo = codigo;
        }
        

	@Override
	public String toString() {
		return String.format("Cupom %s no valor de R$%.2f", getNome(), getValorDesconto());
	}
}

