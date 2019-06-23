/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.pedido.CupomTroca;
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
import livraria.core.util.Random;

/**
 *
 * @author matheus
 */
public class CupomTrocaDAO extends AbstractDAO {

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        // Abre uma conexao com o banco.
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            CupomTroca cTroca = (CupomTroca) entidade;
            Pedido pedido = new Pedido();
            PedidoDAO pDAO = new PedidoDAO();
            TrocaDAO trocaDAO = new TrocaDAO();
            Troca objTroca = new Troca();

            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO cupomTroca (id_cliente, id_pedido, codigo) VALUES (?, ?, ?)");
            declaracao.setInt(1, cTroca.getCliente().getId());
            declaracao.setInt(2, cTroca.getPedido().getId());
            declaracao.setString(3, Random.gerar(8));
            
            declaracao.execute();
            resultado.setAcao("CupomTrocaInserido");
            resultado.setMensagem("inseriu ");
            resultado.setStatus(true);
            
            pedido.setId(cTroca.getPedido().getId());
            pedido.getStatusPedido().setId(4);
            resultado = pDAO.alterar(pedido);
            
            
           // objTroca.set
            objTroca.setId(cTroca.getId());
            resultado = trocaDAO.alterar(objTroca);
            
            
            // Fecha a conexao.
            conexao.close();
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado desativar(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            CupomTroca cTroca = (CupomTroca) entidade;
            Pedido pedido = new Pedido();
            PedidoDAO pDAO = new PedidoDAO();
            TrocaDAO trocaDAO = new TrocaDAO();
            Troca objTroca = new Troca();

            pedido.setId(cTroca.getPedido().getId());
            pedido.getStatusPedido().setId(4);
            pedido.setAcao("reprovar");
            resultado = pDAO.alterar(pedido);
            
            
           // objTroca.set
            objTroca.setId(cTroca.getId());
            resultado = trocaDAO.alterar(objTroca);
            
            
            // Fecha a conexao.
            conexao.close();
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
    public Resultado ativar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado consultar(EntidadeDominio entidade) {
       List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            CupomTroca cTroca = (CupomTroca) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.id_cliente,c.id_pedido, c.dataGerado, c.codigo, "
                    + "c.status, p.ValorTotal\n" +
                "FROM cupomTroca c \n" +
                "left JOIN pedido p\n" +
                "ON c.id_cliente = ? AND c.id_pedido = p.id");
           declaracao.setInt(1, cTroca.getCliente().getId());
           ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                CupomTroca cupom = new CupomTroca();
                Cliente cliente = new Cliente();
                Pedido pedido = new Pedido();
                cupom.setId(rs.getInt("id"));
                cupom.getCliente().setId(rs.getInt("id_cliente"));
                cupom.getPedido().setId(rs.getInt("id_pedido"));
                cupom.setDataTroca(rs.getDate("dataGerado"));
                cupom.setStatus(rs.getInt("status"));
                cupom.setCodigo(rs.getString("codigo"));
                cupom.getPedido().getPagamento().setValorTotal(rs.getDouble("valorTotal"));
               
                entidades.add(cupom);	
            }
            resultado.setEntidades(entidades);
            resultado.setStatus(true);
            resultado.setMensagem("Listado com sucesso");
            resultado.setAcao("listar");
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o cupom de troca");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
    return resultado;
    }
    
}
