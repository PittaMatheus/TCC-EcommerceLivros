package br.com.fatecmogidascruzes.dados;

import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;

public interface IDAO {

    public Resultado inserir(EntidadeDominio entidade);

    public Resultado listar(EntidadeDominio entidade);
    
    public Resultado consultarPorID(EntidadeDominio entidade);

    public Resultado alterar(EntidadeDominio entidade);

    public Resultado desativar(EntidadeDominio entidade);

    
}
