/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.controle;

import livraria.core.IFachada;
import livraria.core.dao.cliente.CartaoDAO;
import livraria.core.dao.livro.CategoriaDAO;
import livraria.core.dao.cliente.ClienteDAO;
import livraria.core.dao.cliente.EnderecoDAO;
import livraria.core.dao.livro.GrupoLivroDAO;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import livraria.core.IDAO;
import livraria.core.dao.livro.LivroDAO;
import ecommerce.dominio.cliente.Cartao;
import ecommerce.dominio.livro.Categoria;
import ecommerce.dominio.livro.GrupoLivro;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.Usuario;
import ecommerce.dominio.livro.Dimensoes;
import ecommerce.dominio.livro.Editora;
import ecommerce.dominio.livro.ISBN;
import ecommerce.dominio.pedido.Carrinho;
import livraria.core.IStrategy;
import livraria.core.regras.cliente.ValidaCPF;
import livraria.core.regras.cliente.ValidaCamposObrigatorios;
import livraria.core.regras.cliente.ValidaClienteExistente;
import livraria.core.regras.cliente.ValidaConfirmarSenha;
import livraria.core.regras.cliente.ValidaData;
import livraria.core.regras.cliente.ValidaEspacosVazios;
import livraria.core.regras.cliente.ValidaSenha;
import livraria.core.regras.cliente.ValidaSenhaForte;
import java.util.List;
import livraria.core.dao.livro.DimensoesDAO;
import livraria.core.dao.livro.EditoraDAO;
import livraria.core.dao.livro.IsbnDAO;
import livraria.core.dao.pedido.CarrinhoDAO;
import livraria.core.regras.livro.ValidarCamposVaziosLivro;
import livraria.core.regras.livro.ValidarCategoriasLivro;
import livraria.core.regras.livro.ValidarDimensoesLivro;
import livraria.core.regras.livro.ValidarGrupoPrecificacao;


public class Fachada implements IFachada{
    private Resultado resultado = new Resultado();
    private Map<String, IDAO> dao;
    private StringBuilder sb = new StringBuilder();
    private Map<String, Map<String,List<IStrategy>>> RN;
    
    public Fachada(){
        
        dao = new HashMap<String, IDAO>();
        
        
        // DAO de clientes
        dao.put(Cliente.class.getName(),new ClienteDAO());
        dao.put(Endereco.class.getName(),new EnderecoDAO());
        dao.put(Cartao.class.getName(),new CartaoDAO());
        
        //DAO de livros
        dao.put(Livro.class.getName(), new LivroDAO());
        dao.put(Categoria.class.getName(), new CategoriaDAO());
        dao.put(GrupoLivro.class.getName(), new GrupoLivroDAO());
        dao.put(Dimensoes.class.getName(), new DimensoesDAO());
        dao.put(ISBN.class.getName(), new IsbnDAO());
        dao.put(Editora.class.getName(), new EditoraDAO());
        
        // DAO de pedidos
        dao.put(Carrinho.class.getName(), new CarrinhoDAO());
        
        RN = new HashMap<String,Map<String,List<IStrategy>>>();
        
        //Regras do cliente
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
        
        // Regras de negocio geral
      	RN.put("salvar", regrasCliente);
        RN.put("autenticar", regrasUsuario);
        
        // Regras do livro
        List<IStrategy> regrasSalvarLivro = new ArrayList<IStrategy>();
        
        regrasSalvarLivro.add(new ValidarCamposVaziosLivro());
        regrasSalvarLivro.add(new ValidarCategoriasLivro());
        regrasSalvarLivro.add(new ValidarGrupoPrecificacao());
        regrasSalvarLivro.add(new ValidarDimensoesLivro());
        
        Map<String, List<IStrategy>> regrasLivro = new HashMap<String, List<IStrategy>>();
        
        regrasLivro.put(Livro.class.getName(), regrasSalvarLivro);
        regrasLivro.put(Livro.class.getName(), regrasSalvarLivro);

        RN.put("salvar", regrasLivro);
        RN.put("alterar", regrasLivro);
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

