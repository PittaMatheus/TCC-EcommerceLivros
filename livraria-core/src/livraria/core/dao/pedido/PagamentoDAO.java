/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Pagamento;
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.util.BancoDadosOracle;

/**
 *
 * @author matheus
 */
public class PagamentoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
         try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Pedido pedido = (Pedido) entidade;
            PagamentoCartaoCredito pgCartao = new PagamentoCartaoCredito();
            double id_cartao;
            
            for(PagamentoCartaoCredito pgto: pedido.getPagamento().getPagamentosCartao()){
                 PreparedStatement declaracao = conexao.prepareStatement(
                    "INSERT INTO pagamentoCartao "
                    + "(id_pedido, id_cartao, valor) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
                declaracao.setInt(1, pedido.getId());
                declaracao.setInt(2, pgto.getCartaoCredito().getId());
                declaracao.setDouble(3, 200);
                declaracao.execute();
            }

         
            // Seta o ID cliente com o ID autoincrement que foi gerado no banco de dados
            resultado.setStatus(true);
            resultado.setMensagem("O pagamento foi inserido com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o carrinho");
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
