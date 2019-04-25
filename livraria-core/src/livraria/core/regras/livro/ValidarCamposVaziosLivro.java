package livraria.core.regras.livro;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import livraria.core.IStrategy;
import livraria.core.regras.AbstractStrategy;

public class ValidarCamposVaziosLivro extends AbstractStrategy{
    
    public String validar(EntidadeDominio entidade) {
        String msgRetorno = "";
        Livro livro = (Livro)entidade;

        if(livro.getCodigoBarras()== null|| livro.getAutor() == null || livro.getAno() == null ||
            livro.getTitulo() == null || livro.getEditora() == null || livro.getEditora().getNome() == null || 
            livro.getEdicao() == null || livro.getIsbn() == null || livro.getIsbn().getCodBarras()== null ||
            livro.getNumeroPaginas() == null || livro.getSinopse() == null || livro.getPreco() == null ||
            livro.getCodigoBarras().trim().isEmpty() || livro.getAutor().trim().isEmpty() || 
            livro.getAno().trim().isEmpty() || livro.getTitulo().trim().isEmpty() || 
            livro.getEditora().getNome().trim().isEmpty() ||livro.getEdicao().trim().isEmpty() ||
            livro.getIsbn().getCodBarras().trim().isEmpty() ||livro.getNumeroPaginas().trim().isEmpty() ||
            livro.getSinopse().trim().isEmpty()){
            msgRetorno += "<li>Todos os campos são obrigatórios!</li>";
        }else if(livro.getPreco() <= 0){
            msgRetorno += "<li>O preco deve ser maior do que 0!</li>";
        }
        
        return msgRetorno;
    }
}
