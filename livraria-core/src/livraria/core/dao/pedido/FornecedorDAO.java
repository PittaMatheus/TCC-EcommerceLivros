/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.estoque.Fornecedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.util.BancoDadosOracle;

/**
 *
 * @author bocao
 */
public class FornecedorDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Fornecedor fornecedor = (Fornecedor) entidade;
            
            // Inserindo a editora e recuperando ID para colocar na inserção do LIVRO
            PreparedStatement declaracao = conexao.prepareStatement(
                   "INSERT INTO fornecedor "
                   + "(nome_fornecedor, cnpj, razao_social) VALUES (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            declaracao.setString(1, fornecedor.getNome());
            declaracao.setString(2, fornecedor.getCnpj());
            declaracao.setString(3, fornecedor.getRazaoSocial());
            declaracao.execute();
            ResultSet rs = declaracao.getGeneratedKeys(); 
            
            resultado.setStatus(true);
            resultado.setMensagem("O fornecedor foi inserido com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o fornecedor");
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
            Fornecedor categoria = (Fornecedor) entidade;
            
            PreparedStatement declaracao = conexao.prepareStatement("SELECT f.id, f.nome_fornecedor, f.cnpj, f.razao_social "
                    + "FROM fornecedor f ");
            
            ResultSet rs =  declaracao.executeQuery();
            
            while(rs.next()) {
                Fornecedor forn = new Fornecedor();
                forn.setId(rs.getInt("id"));
                forn.setNome(rs.getString("nome_fornecedor"));
                forn.setCnpj(rs.getString("cnpj"));
                forn.setRazaoSocial(rs.getString("razao_social"));
                entidades.add(forn);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarFornecedor");
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o fornecedor");
        }catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setEntidades(entidades);
       return resultado;
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Fornecedor fornecedor = (Fornecedor) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE fornecedor set (nome_fornecedor = ?, cnpj = ?, razao_social = ?)  where id = ?");
            declaracao.setString(1, fornecedor.getNome());
            declaracao.setString(2, fornecedor.getCnpj());
            declaracao.setString(3, fornecedor.getRazaoSocial());
            declaracao.setInt(4, fornecedor.getId());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("O fornecedor foi alterada com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao alterar a fornecedor");
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
            Fornecedor fornecedor = (Fornecedor) entidade;
            // Se o id do objeto cliente não estiver preenchido. A funcao consultar irá consultar o CPF e EMAIL
            PreparedStatement declaracao = conexao.prepareStatement("SELECT f.id, f.nome_fornecedor, f.cnpj, f.razao_social "
                            + "FROM fornecedor f WHERE f.id = ?");
            declaracao.setInt(1, fornecedor.getId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Fornecedor forn = new Fornecedor();
                forn.setId(rs.getInt("id"));
                forn.setNome(rs.getString("nome_fornecedor"));
                forn.setCnpj(rs.getString("cnpj"));
                forn.setRazaoSocial(rs.getString("razao_social"));  
                entidades.add(fornecedor);
            }
            
            resultado.setMensagem("Listado com sucesso");
            resultado.setEntidades(entidades);
            resultado.setAcao("consultar");
            resultado.setStatus(true);
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o fornecedor");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        return resultado;
    }
    
    
    
}