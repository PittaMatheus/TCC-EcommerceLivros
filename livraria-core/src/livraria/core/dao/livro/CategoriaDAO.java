/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.livro;

import livraria.core.dao.AbstractDAO;
import ecommerce.dominio.livro.Categoria;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import livraria.core.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author matheus
 */
public class CategoriaDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Categoria categoria = (Categoria) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO categoria (nome) VALUES(?)");
            declaracao.setString(1, categoria.getNome());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("A categoria foi inserida com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir a categoria");
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
            Categoria categoria = (Categoria) entidade;
                        PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.nome "
                                + "FROM categoria c ");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Categoria cat = new Categoria();
                cat.setId(rs.getInt("id"));
                cat.setNome(rs.getString("nome"));
                entidades.add(cat);
            }
            // Fecha a conexao.
            conexao.close();
            resultado.setStatus(true);
            resultado.setAcao("listarCategoria");
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o cliente");
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
            Categoria categoria = (Categoria) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE categoria set nome = ? where id = ?");
            declaracao.setString(1, categoria.getNome());
            declaracao.setInt(2, categoria.getId());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("A categoria foi alterada com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao alterar a categoria");
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
            Categoria categoria = (Categoria) entidade;
            // Se o id do objeto cliente não estiver preenchido. A funcao consultar irá consultar o CPF e EMAIL
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id, c.nome "
                            + "FROM categoria c WHERE c.id = ?");
            declaracao.setInt(1, categoria.getId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                categoria.setNome(rs.getString("nome"));   
            }
            entidades.add(categoria);
            // Fecha a conexao.
            conexao.close();
            resultado.setMensagem("Listado com sucesso");
            resultado.setEntidades(entidades);
            resultado.setAcao("consultar");
            resultado.setStatus(true);
            }catch(ClassNotFoundException erro) {
                erro.printStackTrace();     
                resultado.setStatus(false);
                resultado.setMensagem("Houve algum erro ao listar o endereco");
            } catch (SQLException erro) {
                erro.printStackTrace();   
            }
           return resultado;            

    
    }
}
