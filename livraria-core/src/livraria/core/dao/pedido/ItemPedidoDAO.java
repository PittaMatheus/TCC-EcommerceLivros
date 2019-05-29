/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.ItemPedido;
import ecommerce.dominio.pedido.Pedido;
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
public class ItemPedidoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
       try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            // Instancias
            Pedido pedido = (Pedido) entidade;
            // Loop para inserir todos os items
            for(ItemPedido itemPed: pedido.getItems()){
                PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO itemPedido (quantidade, id_livro, id_pedido) "
                        + "VALUES (?,?,?)");
                declaracao.setInt(1, itemPed.getQuantidade());
                declaracao.setInt(2, itemPed.getLivro().getId());
                declaracao.setInt(3, pedido.getId());
                declaracao.execute();
                resultado.setAcao("iTemPedidoInserido");
                resultado.setStatus(true);
                
            }
            // Fecha a conexao.
                conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o Item ");
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
