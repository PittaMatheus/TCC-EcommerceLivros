/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.estoque;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;

/**
 *
 * @author matheus
 */
public class Item extends EntidadeDominio {
	
        private Integer quantidade;
	private Livro livro;
        private Float custo;
        private Fornecedor fornecedor;
        
        public Item(){
        livro = new Livro();
        fornecedor = new Fornecedor();
        }

    public Float getCusto() {
        return custo;
    }

    public void setCusto(Float custo) {
        this.custo = custo;
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }
	

    public Integer getQuantidade() {
            return quantidade;
    }
    public void setQuantidade(Integer quantidade) {
            this.quantidade = quantidade;
    }
    public Livro getLivro() {
            return livro;
    }
    public void setLivro(Livro livro) {
            this.livro = livro;
    }
	
}