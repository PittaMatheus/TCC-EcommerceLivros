/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.controle;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.CartaoDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.ClienteDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.EnderecoDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Endereco;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.IDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cartao;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.IStrategy;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.ValidaCamposCliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.ValidaConfirmarSenha;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.ValidaSenhaForte;
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
        
        // Lista de de negocio do comando insert
        List<IStrategy> RNClienteSalvar = new ArrayList<IStrategy>();
        
        // Listas das Regras de negocio do comando insert
        RNClienteSalvar.add(new ValidaCamposCliente());
        RNClienteSalvar.add(new ValidaSenhaForte());
        RNClienteSalvar.add(new ValidaConfirmarSenha());
        
        
        // Regras de negocio do cliente
        Map<String, List<IStrategy>> regrasCliente = new HashMap<String, List<IStrategy>>();
        // Regra salvar
        regrasCliente.put(Cliente.class.getName(), RNClienteSalvar);
        
        // Todas listas de regras de negocio
        RN = new HashMap<String,Map<String,List<IStrategy>>>();
	RN.put("salvar", regrasCliente);
        
    }
    
    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        resultado.setEntidades(new ArrayList<EntidadeDominio>());
        executaRegras(entidade,"salvar");
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
    
    private void executaRegras(EntidadeDominio entidade, String operacao) 
	{
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
    
    
    
}

