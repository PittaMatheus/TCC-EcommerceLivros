/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.estoque.Estoque;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.ItemPedido;
import ecommerce.dominio.pedido.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.util.BancoDadosOracle;

/**
 *
 * @author matheus
 */
public class EstoqueDAO extends AbstractDAO{ 

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Estoque estoque = (Estoque) entidade;
            
            // Inserindo a editora e recuperando ID para colocar na inserção do LIVRO
             PreparedStatement declaracao = conexao.prepareStatement(
                    "INSERT INTO fornecedor "
                    + "(nome_fornecedor, cnpj, razao_social) VALUES (?,?,?)", Statement.RETURN_GENERATED_KEYS);
             declaracao.setString(1, estoque.getItem().getFornecedor().getNome());
             declaracao.setString(2, estoque.getItem().getFornecedor().getCnpj());
             declaracao.setString(3, estoque.getItem().getFornecedor().getRazaoSocial());
             declaracao.execute();
             ResultSet rs = declaracao.getGeneratedKeys(); 
             estoque.getItem().getFornecedor().setId((rs.next())?rs.getInt(1):0);
            
            PreparedStatement declaracao2 = conexao.prepareStatement("INSERT INTO estoque (id_livro, id_fornecedor, quantidade, valor_custo) VALUES(?,?,?,?)");
            declaracao2.setInt(1, estoque.getItem().getLivro().getId());
            declaracao2.setInt(2, estoque.getItem().getFornecedor().getId());
            declaracao2.setInt(3, estoque.getItem().getQuantidade());
            declaracao2.setDouble(4, estoque.getItem().getCusto());
            declaracao2.execute();
            resultado.setStatus(true);
            resultado.setMensagem("O estoque foi inserido com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o estoque");
        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return resultado;
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Estoque estoque = (Estoque) entidade;
                        PreparedStatement declaracao = conexao.prepareStatement("SELECT e.id, e.id_livro, e.id_fornecedor, e.quantidade, e.valor_custo, e.dt_entrada "
                                + "FROM estoque e ");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Estoque est = new Estoque();
                est.setId(rs.getInt("id"));
                est.getItem().getLivro().setId(rs.getInt("id_livro"));
                est.getItem().getFornecedor().setId(rs.getInt("id_fornecedor"));
                est.getItem().setQuantidade(rs.getInt("quantidade"));
                est.getItem().setCusto(rs.getFloat("valor_custo"));
                est.setDataCadastro(rs.getDate("dt_entrada"));
                entidades.add(est);
            }
            resultado.setEntidades(entidades);
            resultado.setStatus(true);
            resultado.setAcao("listarEstoque");
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o estoque");
        }catch (SQLException erro) {
            erro.printStackTrace();   
        }
        
       return resultado;
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Estoque estoque = (Estoque) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE estoque set quantidade = ? where id = ?");
            declaracao.setInt(1, estoque.getItem().getQuantidade());
            declaracao.setInt(2, estoque.getId());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("O estoque foi alterado com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao alterar o estoque");
        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return resultado;
    }

    @Override
    public Resultado desativar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado ativar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado consultar(EntidadeDominio entidade) {
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Estoque estoque = (Estoque) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT e.id, e.id_livro, e.id_fornecedor, e.quantidade, e.valor_custo, e.dt_entrada "
                            + "FROM estoque e WHERE e.id = ?");
            declaracao.setInt(1, estoque.getId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Estoque est = new Estoque();
                est.setId(rs.getInt("id"));
                est.getItem().getLivro().setId(rs.getInt("id_livro"));
                est.getItem().getFornecedor().setId(rs.getInt("id_fornecedor"));
                est.getItem().setQuantidade(rs.getInt("quantidade"));
                est.getItem().setCusto(rs.getFloat("valor_custo"));
                est.setDataCadastro(rs.getDate("dt_entrada"));
                entidades.add(est);
            }
            
            resultado.setMensagem("Listado com sucesso");
            resultado.setEntidades(entidades);
            resultado.setAcao("alterarEstoque");
            resultado.setStatus(true);
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o estoque");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        return resultado;
    }
    
    public Resultado consultarLivros(EntidadeDominio entidade){
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            Pedido pedido = (Pedido) entidade;
            Connection conexao = BancoDadosOracle.getConexao();
            for(ItemPedido itemPed: pedido.getItems()){
                PreparedStatement declaracao = conexao.prepareStatement("SELECT quantidade, id, id_livro FROM estoque WHERE id_livro = ?");
                declaracao.setInt(1, itemPed.getLivro().getId());
                declaracao.execute();
                ResultSet rs =  declaracao.executeQuery();
                while(rs.next()) {
                    Estoque est = new Estoque();
                    est.setId(rs.getInt("id"));
                    est.getItem().getLivro().setId(rs.getInt("id_livro"));
                    est.getItem().setQuantidade(rs.getInt("quantidade"));
                    //est.getItem().setCusto(rs.getFloat("valor_custo"));
                    //est.setDataCadastro(rs.getDate("dt_entrada"));
                    entidades.add(est);
                }
                resultado.setEntidades(entidades);
                resultado.setAcao("LivroConsultado");
                resultado.setStatus(true);  
            }
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao consultar o estoque");
        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return resultado;
    }
    
    public Resultado baixaLivro(EntidadeDominio entidade){
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Estoque estoque = (Estoque) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE estoque set quantidade = ? where id = ?");
            declaracao.setInt(1, (estoque.getItem().getQuantidade()) - Integer.parseInt(estoque.getAcao()));
            declaracao.setInt(2, estoque.getId());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("Baixa no estoque OK");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao dar baixa no estoque");
        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return resultado;
    
    }
}
    