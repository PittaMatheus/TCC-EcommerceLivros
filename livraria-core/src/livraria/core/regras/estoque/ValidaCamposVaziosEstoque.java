/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.estoque;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.estoque.Estoque;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author bocao
 */
public class ValidaCamposVaziosEstoque extends AbstractStrategy {

    @Override
    public String validar(EntidadeDominio entidade) {
        String msgRetorno = "";
        Estoque estoque = (Estoque)entidade;

        if(estoque.getItem() == null || estoque.getItem().getFornecedor() == null || estoque.getItem().getFornecedor().getCnpj() == null || 
                estoque.getItem().getFornecedor().getNome() == null || estoque.getItem().getFornecedor().getRazaoSocial() == null || 
                estoque.getItem().getFornecedor() == null || estoque.getItem().getLivro() == null || estoque.getItem().getLivro().getId() == null || 
                estoque.getItem().getCusto() == null ||estoque.getItem().getQuantidade() == null || 
                estoque.getItem().getFornecedor().getCnpj().trim().isEmpty() || estoque.getItem().getFornecedor().getNome().trim().isEmpty() ||
                estoque.getItem().getFornecedor().getRazaoSocial().trim().isEmpty() || estoque.getItem().getLivro().getId() == 0){
            msgRetorno += "<li>Todos os campos são obrigatórios!</li>";
        } 
        if(estoque.getItem().getCusto() <= 0){
            msgRetorno += "<li>O preco deve ser maior do que 0!</li>";
        }
        if(estoque.getItem().getQuantidade() <= 0){
            msgRetorno += "<li>A quantiadade deve ser maior do que 0!</li>";
        }

        return msgRetorno;
    }
    
}