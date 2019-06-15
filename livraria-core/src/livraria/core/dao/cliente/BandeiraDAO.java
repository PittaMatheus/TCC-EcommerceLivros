/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.cliente;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Bandeira;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.util.BancoDadosOracle;

/**
 *
 * @author bocao
 */
public class BandeiraDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Bandeira bandeira = (Bandeira) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO bandeira "
                    + "(nome_bandeira)"
                                    + " VALUES(?)", Statement.RETURN_GENERATED_KEYS);

                    declaracao.setString(1, bandeira.getNome());
               
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("A bandeira foi inserido com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao inserir a bandeira");
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
            Bandeira bandeira = (Bandeira) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT b.id_bandeira, b.nome_bandeira "
                    + "FROM bandeira b");
           
           ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                
                Bandeira bandeiras = new Bandeira();
                bandeiras.setId(rs.getInt("id_bandeira"));
                bandeiras.setNome(rs.getString("nome_bandeira"));
                entidades.add(bandeiras);	
            }
            resultado.setEntidades(entidades);
            resultado.setStatus(true);
            resultado.setMensagem("Listado com sucesso");
            resultado.setAcao("listar");
            conexao.close();
            
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar a bandeira");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        return resultado;
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
            Bandeira bandeira = (Bandeira) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT b.id_bandeira, b.nome_bandeira "
                    + "FROM bandeira b WHERE b.id_bandeira = ?");
           declaracao.setInt(1, bandeira.getId());
           ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                
                Bandeira bandeiras = new Bandeira();
                bandeiras.setId(rs.getInt("id_bandeira"));
                bandeiras.setNome(rs.getString("nome_bandeira"));
                entidades.add(bandeiras);	
            }
            resultado.setEntidades(entidades);
            resultado.setStatus(true);
            resultado.setMensagem("Listado com sucesso");
            resultado.setAcao("listar");
            conexao.close();
            
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar a bandeira");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
    return resultado;
    }
    
}