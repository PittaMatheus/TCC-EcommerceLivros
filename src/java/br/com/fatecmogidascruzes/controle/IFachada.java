package br.com.fatecmogidascruzes.controle;

import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;

/**
 *
 * @author matheus
 */
public interface IFachada {
    public Resultado inserir(EntidadeDominio entidade);
    public Resultado autenticar(EntidadeDominio entidade);
    
    //public Resultado excluir(EntidadeDominio entidade);
   // public Resultado alterar(EntidadeDominio entidade);
    //public Resultado consultar(EntidadeDominio entidade);
}