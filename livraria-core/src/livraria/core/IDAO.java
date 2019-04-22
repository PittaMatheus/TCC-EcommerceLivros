package livraria.core;

import ecommerce.dominio.EntidadeDominio;

import livraria.core.aplicacao.Resultado;

public interface IDAO {

    public Resultado inserir(EntidadeDominio entidade);

    public Resultado listar(EntidadeDominio entidade);

    public Resultado alterar(EntidadeDominio entidade);

    public Resultado desativar(EntidadeDominio entidade);

    public Resultado ativar(EntidadeDominio entidade);
    
    public Resultado consultar(EntidadeDominio entidade);
}
