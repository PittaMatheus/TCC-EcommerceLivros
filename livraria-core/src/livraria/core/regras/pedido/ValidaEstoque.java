/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.estoque.Estoque;
import ecommerce.dominio.pedido.Carrinho;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.controle.Fachada;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class ValidaEstoque extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
       String str ="";
       boolean flgTemEstoque = false;
       
        Carrinho carrinho = (Carrinho) entidade;
        Resultado resultado = new Resultado();
        Estoque estoque = new Estoque();
        Fachada fachada = new Fachada();
        resultado = fachada.listar(estoque);
        // Objeto resultado foi preenchido com uma lista de resposta da query que verifica se 
        // livro está disponivel  no estoque
        List<Estoque> estoques = (List) resultado.getEntidades();
        if(estoques.isEmpty()) {
             str +="<li>Não há livros no estoque</li>";
        } else {
            for (Estoque est : estoques) {
                // O id do livro que está no carrinho é igual a algum id_livro no estoque?
                // Se sim, esse id_livro no estoque é maior do que 1?
                int carrinho_idLivro = carrinho.getLivro().getId();
                int estoque_idLivro = est.getItem().getLivro().getId();
                
                if(carrinho.getLivro().getId().equals(est.getItem().getLivro().getId()) 
                        && (est.getItem().getLivro().getId()) >= 1){
                    flgTemEstoque = true;
                    break;
                }else
                    flgTemEstoque = false;
            }
            if(flgTemEstoque)
                str +="";
            else
                str +="<li>O livro está em falta no estoque</li>";
       } 
        return str;
    }
    
}
