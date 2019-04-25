package livraria.core.regras.livro;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import livraria.core.regras.AbstractStrategy;

public class ValidarDimensoesLivro extends AbstractStrategy{
    
    public String validar(EntidadeDominio entidade) {
        Livro livro = (Livro)entidade;
        String msgRetorno = "";
        
        if(livro.getDimensoes() == null || livro.getDimensoes().getAltura() == null || livro.getDimensoes().getLargura() == null || livro.getDimensoes().getPeso() == null ||
            livro.getDimensoes().getProfundidade() == null){
            msgRetorno += "<li>Altura, Largura, Peso e Profundidade são obrigatórios</li>";
        }else if(livro.getDimensoes().getAltura() <= 0 || livro.getDimensoes().getLargura() <= 0 ||
            livro.getDimensoes().getPeso() <= 0 || livro.getDimensoes().getProfundidade() <= 0){
            msgRetorno += "<li>Altura, Largura, Peso e Profundidade devem ser maiores do que 0</li>";
        }
        
        return msgRetorno;
    }
}
