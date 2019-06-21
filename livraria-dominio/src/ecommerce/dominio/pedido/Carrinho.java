/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.livro.Livro;
import java.util.ArrayList;
import java.util.List;

public class Carrinho extends EntidadeDominio{
    private Integer id;
    private int qt_itens;
    private List<Livro> livros;
    private ArrayList<Livro> liv = new ArrayList<Livro>();
    private ArrayList<ItemPedido> itens = new ArrayList<ItemPedido>();

    private Livro livro;
    private Cliente cliente;
    
    
    public Carrinho(){
         livro = new Livro();
         cliente = new Cliente();
    }

    public ArrayList<ItemPedido> getItens() {
        return itens;
    }

    public void setItens(ArrayList<ItemPedido> itens) {
        this.itens = itens;
    }
    public void addItens(ItemPedido item){
        itens.add(item);
    }

    
    public void addLivro(Livro livro){
        liv.add(livro);
    }
    
    public void removeLivro(Livro livro){
        liv.remove(livro);
    }
    public ArrayList<Livro> getLivs() {
        return liv;
    }

    
    
    public Carrinho(Integer id, int qt_itens,  List<Livro> livros){
        this.id = id;
        this.qt_itens = qt_itens;
        this.livros = livros;
               
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }
    

    public List<Livro> getLivros() {
        return livros;
    }

    public void setLivros(List<Livro> livros) {
        this.livros = livros;
    }
    private double subTotal;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getQt_itens() {
        return qt_itens;
    }

    public void setQt_itens(int qt_itens) {
        this.qt_itens = qt_itens;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    
    
}
