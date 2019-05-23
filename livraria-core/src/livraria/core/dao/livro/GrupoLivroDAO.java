/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.livro;

import livraria.core.dao.AbstractDAO;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.GrupoLivro;
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
public class GrupoLivroDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            GrupoLivro grupoLivro = (GrupoLivro) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO grupolivro (nome_grupoLivro, margem_lucro) VALUES(?,?)");
            declaracao.setString(1, grupoLivro.getNome());
            declaracao.setDouble(2, grupoLivro.getMargemLucro());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("O grupo foi inserido com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o grupo ");
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
            GrupoLivro grupoLivro = (GrupoLivro) entidade;
                        PreparedStatement declaracao = conexao.prepareStatement("SELECT g.id, g.nome_grupolivro, g.margem_lucro "
                                + "FROM grupolivro g ");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                GrupoLivro gl = new GrupoLivro();
                gl.setId(rs.getInt("id"));
                gl.setNome(rs.getString("nome_grupolivro"));
                gl.setMargemLucro(rs.getDouble("g.margem_lucro"));
                entidades.add(gl);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarGrupoLivro");
            conexao.close();
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
            GrupoLivro grupoLivro = (GrupoLivro) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE grupolivro set nome_grupoLivro = ?, margem_lucro = ? where id = ?");
            declaracao.setString(1, grupoLivro.getNome());
            declaracao.setDouble(2, grupoLivro.getMargemLucro());
            declaracao.setInt(3, grupoLivro.getId());
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
            GrupoLivro grupoLivro = (GrupoLivro) entidade;
                        PreparedStatement declaracao = conexao.prepareStatement("SELECT g.id, g.nome_grupolivro, g.margem_lucro "
                                + "FROM grupolivro g WHERE id =? ");
            declaracao.setInt(1, grupoLivro.getId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                grupoLivro.setId(rs.getInt("id"));
                grupoLivro.setNome(rs.getString("nome_grupolivro"));
                grupoLivro.setMargemLucro(rs.getDouble("g.margem_lucro"));
                entidades.add(grupoLivro);
            }
            resultado.setStatus(true);
            resultado.setAcao("preAlterarGrupo");
            resultado.setMensagem("consulta feita com sucesso");
            conexao.close();
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
        
    
}
