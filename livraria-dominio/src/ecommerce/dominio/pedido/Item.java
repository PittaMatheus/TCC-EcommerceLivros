/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;

/**
 *
 * @author matheus
 */
public class Item extends EntidadeDominio {
    private Integer quantidade;
    private Livro livro;
    
    public Item(){
        livro = new Livro();
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
