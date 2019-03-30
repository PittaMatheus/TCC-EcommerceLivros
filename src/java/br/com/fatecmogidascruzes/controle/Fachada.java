/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.controle;

import br.com.fatecmogidascruzes.dados.CartaoDAO;
import br.com.fatecmogidascruzes.dados.ClienteDAO;
import br.com.fatecmogidascruzes.dados.EnderecoDAO;
import br.com.fatecmogidascruzes.dominio.Cliente;
import br.com.fatecmogidascruzes.dominio.Endereco;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import br.com.fatecmogidascruzes.dados.IDAO;
import br.com.fatecmogidascruzes.dominio.Cartao;
import java.util.List;


/**
 *
 * @author matheus
 */
public class Fachada implements IFachada{
    private Resultado resultado = new Resultado();
    private Map<String, IDAO> dao;
    
    
    public Fachada(){
        // DAO
        dao = new HashMap<String, IDAO>(); 
        dao.put(Cliente.class.getName(),new ClienteDAO());
        dao.put(Endereco.class.getName(),new EnderecoDAO());
        dao.put(Cartao.class.getName(),new CartaoDAO());
        // Regras de negocio
        
    }
    
    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        try {
            resultado = dao.get(entidade.getClass().getName()).inserir(entidade);
            resultado.setAcao("inserir");
            resultado.setStatus(true);

        } catch(Exception e) {
            resultado.setStatus(false);
            resultado.setAcao("inserir");
            e.printStackTrace();
        }
    return resultado;
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
         resultado.setEntidades(new ArrayList<EntidadeDominio>());
        try {
            resultado = dao.get(entidade.getClass().getName()).listar(entidade);
            resultado.setStatus(true);
            resultado.setMensagem("Listado com sucesso");


        } catch(Exception e) {
            resultado.setStatus(false);
            resultado.setMensagem("Erro ao listar");
            e.printStackTrace();
        }
    return resultado;
    }

    @Override
    public Resultado consultarPorID(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        try {
            resultado = dao.get(entidade.getClass().getName()).consultarPorID(entidade);
            resultado.setStatus(true);
            resultado.setMensagem("Listado com sucesso");
            
        } catch(Exception e) {
            resultado.setStatus(false);
            resultado.setMensagem("Erro ao consultar por ID");
            e.printStackTrace();
        }
    return resultado;
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        try {
            resultado = dao.get(entidade.getClass().getName()).alterar(entidade);
            resultado.setStatus(true);
            resultado.setMensagem("Alterado com sucesso");
            resultado.setAcao("alterar");
        } catch(Exception e) {
            resultado.setStatus(false);
            resultado.setMensagem("Erro ao alterar");
            e.printStackTrace();
        }
    return resultado;
    }

    @Override
    public Resultado desativar(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        try {
            resultado = dao.get(entidade.getClass().getName()).desativar(entidade);
            resultado.setStatus(true);
            resultado.setMensagem("desativado com sucesso");
            resultado.setAcao("desativar");
        } catch(Exception e) {
            resultado.setStatus(false);
            resultado.setMensagem("Erro ao desativar");
            e.printStackTrace();
        }
    return resultado;
    }

    @Override
    public Resultado ativar(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        try {
            resultado = dao.get(entidade.getClass().getName()).ativar(entidade);
            resultado.setStatus(true);
            resultado.setMensagem("ativado com sucesso");
            resultado.setAcao("ativar");
        } catch(Exception e) {
            resultado.setStatus(false);
            resultado.setMensagem("Erro ao ativar");
            e.printStackTrace();
        }
    return resultado;
    }
}

