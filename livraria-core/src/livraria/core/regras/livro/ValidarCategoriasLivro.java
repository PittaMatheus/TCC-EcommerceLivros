package livraria.core.regras.livro;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import livraria.core.regras.AbstractStrategy;

public class ValidarCategoriasLivro extends AbstractStrategy{
    
    public String validar(EntidadeDominio entidade) {
        Livro livro = (Livro)entidade;
        String msgRetorno = "";

        if(livro.getCategorias() != null && livro.getCategorias().isEmpty())
            msgRetorno += "<li>Selecione ao menos uma categoria!</li>";

        return msgRetorno;
    }
}
