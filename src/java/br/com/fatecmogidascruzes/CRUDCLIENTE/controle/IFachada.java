package br.com.fatecmogidascruzes.CRUDCLIENTE.controle;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
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
}
