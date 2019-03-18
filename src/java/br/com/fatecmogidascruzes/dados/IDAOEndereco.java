/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.dados;

import br.com.fatecmogidascruzes.dominio.Endereco;
import br.com.fatecmogidascruzes.excecao.ExcecaoAcessoDados;
import java.util.List;

/**
 *
 * @author matheus
 */
public interface IDAOEndereco {
    
    void alterar(Endereco endereco) throws ExcecaoAcessoDados;

    Endereco consultarPorId(int id) throws ExcecaoAcessoDados;

    List<Endereco> consultarTodos() throws ExcecaoAcessoDados;

    void excluir(int id) throws ExcecaoAcessoDados;

    void inserir(Endereco endereco) throws ExcecaoAcessoDados;
    
    
}
