package livraria.core.regras.livro;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import livraria.core.IStrategy;
import livraria.core.regras.AbstractStrategy;

public class ValidarCamposVaziosLivro extends AbstractStrategy{
    
    public String validar(EntidadeDominio entidade) {
        String msgRetorno = "Todos os campos são obrigatórios!";
        Livro livro = (Livro)entidade;

        if(livro.getCodigoBarras()== null|| livro.getAutor() == null || livro.getAno() == null ||
            livro.getTitulo() == null || livro.getEditora() == null || livro.getEditora().getNome() == null || 
            livro.getEdicao() == null || livro.getIsbn() == null || livro.getIsbn().getCodBarras()== null ||
            livro.getNumeroPaginas() == null || livro.getSinopse() == null)
            return msgRetorno;


        if(livro.getCodigoBarras().trim().isEmpty() || livro.getAutor().trim().isEmpty() || 
            livro.getAno().trim().isEmpty() || livro.getTitulo().trim().isEmpty() || 
            livro.getEditora().getNome().trim().isEmpty() ||livro.getEdicao().trim().isEmpty() ||
            livro.getIsbn().getCodBarras().trim().isEmpty() ||livro.getNumeroPaginas().trim().isEmpty() ||
            livro.getSinopse().trim().isEmpty())
            return msgRetorno;

        return "";
    }
}
