/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.analise;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Item;
import ecommerce.dominio.pedido.Pedido;

/**
 *
 * @author matheus
 */
public class Analise extends EntidadeDominio{
    String grafico;
    Livro livro;
    Pedido pedido;
    Item item;
    
    public Analise(){
        livro = new Livro();
        pedido = new Pedido();
        item = new Item();
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

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
    

    
    public String getGrafico() {
        return grafico;
    }

    public void setGrafico(String grafico) {
        this.grafico = grafico;
    }
    
    
}
