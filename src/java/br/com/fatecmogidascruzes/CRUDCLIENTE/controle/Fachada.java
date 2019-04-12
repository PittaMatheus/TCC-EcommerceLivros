/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.controle;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.CartaoDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.CategoriaDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.ClienteDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.EnderecoDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.GrupoLivroDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Endereco;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.IDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.LivroDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cartao;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Usuario;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.IStrategy;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaCPF;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaCamposObrigatorios;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaClienteExistente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaConfirmarSenha;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaData;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaEspacosVazios;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaSenha;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN.ValidaSenhaForte;
import java.util.List;


/**
 *
 * @author matheus
 */
public class Fachada implements IFachada{
    private Resultado resultado = new Resultado();
    private Map<String, IDAO> dao;
    private StringBuilder sb = new StringBuilder();
    private Map<String, Map<String,List<IStrategy>>> RN;
    
    public Fachada(){
        
        // DAO
        dao = new HashMap<String, IDAO>(); 
        dao.put(Cliente.class.getName(),new ClienteDAO());
        dao.put(Endereco.class.getName(),new EnderecoDAO());
        dao.put(Cartao.class.getName(),new CartaoDAO());
        dao.put(Livro.class.getName(),new LivroDAO());
        dao.put(Categoria.class.getName(), new CategoriaDAO());
        dao.put(GrupoLivro.class.getName(), new GrupoLivroDAO());
        
        // Lista das regras de negocio de acordo com as acoes
        List<IStrategy> RNClienteSalvar = new ArrayList<IStrategy>();
        List<IStrategy> RNClienteAutenticar = new ArrayList<IStrategy>();
        
        // Listas das Regras de negocio do comando insert
        RNClienteSalvar.add(new ValidaCamposObrigatorios());
        RNClienteSalvar.add(new ValidaSenhaForte());
        RNClienteSalvar.add(new ValidaConfirmarSenha());
        RNClienteSalvar.add(new ValidaEspacosVazios());
        RNClienteSalvar.add(new ValidaCPF());
        RNClienteSalvar.add(new ValidaData());
        RNClienteSalvar.add(new ValidaClienteExistente());
        
        // Regras de negocio de autenticacao
        RNClienteAutenticar.add(new ValidaSenha());

        // Regras de negocio do cliente
        Map<String, List<IStrategy>> regrasCliente = new HashMap<String, List<IStrategy>>();
        
         // Regras de negocio do usuario
        Map<String, List<IStrategy>> regrasUsuario = new HashMap<String, List<IStrategy>>();
        
        // Regra salvar
        regrasCliente.put(Cliente.class.getName(), RNClienteSalvar);
        regrasUsuario.put(Cliente.class.getName(), RNClienteAutenticar);
        // Todas listas de regras de negocio
        RN = new HashMap<String,Map<String,List<IStrategy>>>();
	RN.put("salvar", regrasCliente);
        RN.put("autenticar", regrasUsuario);
    } 
    
    
    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        RegrasDeNegocio(entidade, "salvar");
        try {
            if(resultado.getMensagem().length() == 0) {
                resultado = dao.get(entidade.getClass().getName()).inserir(entidade);
                resultado.setAcao("inserir");
                resultado.setStatus(true);
                } else {
                resultado.setStatus(false);
                resultado.setAcao("falhaInserir");
                }	
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
    public Resultado consultar(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        try {
            resultado = dao.get(entidade.getClass().getName()).consultar(entidade);
            
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
    
    
    private void RegrasDeNegocio(EntidadeDominio entidade, String operacao) {
        List<IStrategy> regras = RN.get(operacao).get(entidade.getClass().getName());
        String resposta = "";
        if(regras != null) {
            for(IStrategy r:regras) {
                if(r != null) {
                    resposta += r.validar(entidade);
                    resultado.setMensagem(resposta);
                }
            }
        } else {
            resultado.setMensagem(new String());
        }
    }
    
    @Override
    public Resultado autenticar(EntidadeDominio entidade) {
        RegrasDeNegocio(entidade,"autenticar");
        try {
            if(resultado.getMensagem().length() == 0) {

                resultado = dao.get(entidade.getClass().getName()).consultar(entidade);
                resultado.setStatus(true);
                resultado.setAcao("logar");
                resultado.setMensagem("Usuario foi autenticado");
                } else {
                resultado.setStatus(false);
                resultado.setAcao("nao-logado");
                }	
        } catch(Exception e) {
            resultado.setStatus(false);
            resultado.setAcao("nao-logado");
            e.printStackTrace();
        }
    return resultado;
    }

    @Override
    public Resultado logout(EntidadeDominio entidade) {
        resultado.setStatus(false);
        resultado.setAcao("logout");
        resultado.setMensagem("fechando a sessao");  
        return resultado;
    }
    
    
}

