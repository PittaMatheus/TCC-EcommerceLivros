/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.cliente;

import livraria.core.dao.AbstractDAO;
import ecommerce.dominio.cliente.Bandeira;
import ecommerce.dominio.cliente.Cartao;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import livraria.core.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author matheus
 */
public class CartaoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
         try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cartao cartao = (Cartao) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO cartao "
                    + "(nome, dtVencimento, id_bandeira, numero, codSeguranca, id_cliente)"
                                    + " VALUES(?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

                    declaracao.setString(1, cartao.getNome());
                    declaracao.setDate(2, new java.sql.Date(cartao.getDtVencimento().getTime()));
                    declaracao.setInt(3, cartao.getBandeira().getId());
                    declaracao.setString(4, cartao.getNumeroCartao());
                    declaracao.setString(5, cartao.getCodSeguranca());
                    declaracao.setInt(6, cartao.getCliente().getId());

               
            declaracao.execute();
            System.out.print("EXECUTEI A QUERY");
            ResultSet rs = declaracao.getGeneratedKeys();
            // Seta o ID cliente com o ID autoincrement que foi gerado no banco de dados
            cartao.setId((rs.next())?rs.getInt(1):0);                
            resultado.setStatus(true);
            resultado.setMensagem("O Cliente foi inserido com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao inserir o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }



    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado desativar(EntidadeDominio entidade) {
        int status = 0;

        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cartao cartao = (Cartao) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE cartao set status = 0"
						+ " WHERE id=?");
           
            System.out.println("ID CARTAO: " + cartao.getCliente().getId());
            declaracao.setInt(1, cartao.getCliente().getId());
            declaracao.executeUpdate();

            resultado.setStatus(true);
            resultado.setMensagem("O Cartao foi excluido com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao excluir o cartao");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
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
            Cartao cartao = (Cartao) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.nome,c.dtVencimento, "
                    + "id_bandeira, numero, codSeguranca, id_cliente "
                    + "FROM cartao c WHERE c.id_cliente = ?");
           declaracao.setInt(1, cartao.getCliente().getId());
           ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Cartao cart = new Cartao();
                Bandeira bandeira = new Bandeira();
                cart.setId(rs.getInt("id"));
                cart.setNome(rs.getString("nome"));
                cart.setDtVencimento(rs.getDate("dtVencimento"));
//                bandeira.setNome(rs.getString("bandeira"));
//                cart.setBandeira(bandeira);
                cart.getBandeira().setId(rs.getInt("id_bandeira"));
                cart.setNumeroCartao(rs.getString("numero"));
                cart.setCodSeguranca(rs.getString("codSeguranca"));
                cart.getCliente().setId(rs.getInt("id_cliente"));
                entidades.add(cart);	
            }
            resultado.setEntidades(entidades);
            resultado.setStatus(true);
            resultado.setMensagem("Listado com sucesso");
            resultado.setAcao("listar");
            conexao.close();
            if(!cartao.isStatus()){
               resultado.setAcao("confirma");
           }
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
