package br.com.fatecmogidascruzes.controle;

import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import java.util.List;

/**
 *
 * @author matheus
 */
public interface IFachada {
    public Resultado inserir(EntidadeDominio entidade);
    public Resultado listar(EntidadeDominio entidade);
    public Resultado alterar(EntidadeDominio entidade);
    public Resultado consultarPorID(EntidadeDominio entidade);
    public Resultado desativar(EntidadeDominio entidade);
    public Resultado ativar(EntidadeDominio entidade);
}