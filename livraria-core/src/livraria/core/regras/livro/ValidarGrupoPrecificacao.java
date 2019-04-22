/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.livro;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author bocao
 */
public class ValidarGrupoPrecificacao extends AbstractStrategy{
    
    public String validar(EntidadeDominio entidade) {
        Livro livro = (Livro)entidade;

        if(livro.getGrupoLivro() != null && livro.getGrupoLivro().getId()  <= 0)
            return "Selecione um Grupo de Precificação!";

        return "";
    }
}
