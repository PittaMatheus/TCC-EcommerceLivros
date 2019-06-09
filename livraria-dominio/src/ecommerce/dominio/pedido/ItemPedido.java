/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.livro.Livro;

/**
 *
 * @author matheus
 */
public class ItemPedido extends Item{
    private Pedido pedido;
    private Livro livro;
    
    public ItemPedido(){
        livro = new Livro();
        pedido = new Pedido();
        
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }
    
}
