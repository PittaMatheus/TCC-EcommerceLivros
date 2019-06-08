package livraria.core;

import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import java.util.List;

/**
 *
 * @author matheus
 */
public interface IFachada {
    public Resultado inserir(EntidadeDominio entidade);
    public Resultado listar(EntidadeDominio entidade);
    public Resultado alterar(EntidadeDominio entidade);
    public Resultado consultar(EntidadeDominio entidade);
    public Resultado desativar(EntidadeDominio entidade);
    public Resultado ativar(EntidadeDominio entidade);
    public Resultado autenticar(EntidadeDominio entidade);
    public Resultado logout(EntidadeDominio entidade);
    public void RegrasDeNegocio(EntidadeDominio entidade, String operacao);
    public Resultado aplicarDesconto(EntidadeDominio entidade);

}
