/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Pedido;
import ecommerce.dominio.pedido.Troca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.util.BancoDadosOracle;

/**
 *
 * @author matheus
 */
public class TrocaDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Troca troca = (Troca) entidade;
            
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO solicitacaoTroca (id_cliente, id_pedido) VALUES (?,?)");
            declaracao.setInt(1, troca.getCliente().getId());
            declaracao.setInt(2, troca.getPedido().getId());
            declaracao.execute();
            resultado.setAcao("solicitacaoTroca");
            resultado.setMensagem("solicitou ");
            resultado.setStatus(true);
            // Fecha a conexao.
            conexao.close();
            declaracao.close();
        } catch (ClassNotFoundException erro) {
            
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao solicitar a troca ");
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
            Troca troca = (Troca) entidade;
                        PreparedStatement declaracao = conexao.prepareStatement("SELECT t.id, t.id_cliente ,t.id_pedido, t.status "
                                + "FROM solicitacaoTroca t ");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Troca tr = new Troca();
                tr.setId(rs.getInt("id"));
                tr.getCliente().setId(rs.getInt("id_cliente"));
                tr.getPedido().setId(rs.getInt("id_pedido"));
                tr.setStatus(rs.getString("status"));
                entidades.add(tr);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarSolicitacaoTroca");
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar a solicitacao de troca");
        }catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setEntidades(entidades);
       return resultado;
        
        
        
        
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Troca troca = (Troca) entidade;
            // Instancia das entidades relacionadas
   
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE solicitacaoTroca SET status = 1 WHERE id=?");
            declaracao.setInt(1, troca.getId());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("A solicitacao de troca foi alterarada com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao alterar a solicitacao");
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
