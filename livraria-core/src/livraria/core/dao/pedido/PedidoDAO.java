/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.pedido.Pagamento;
import ecommerce.dominio.pedido.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.dao.cliente.EnderecoDAO;
import livraria.core.util.BancoDadosOracle;

/**
 *
 * @author matheus
 */
public class PedidoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
         try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Pedido pedido = (Pedido) entidade;
            EnderecoDAO enderecoDAO = new EnderecoDAO();
            PagamentoDAO pagamentoDAO = new PagamentoDAO();
            
            Endereco endereco = new Endereco();
            endereco.setClienteId(pedido.getCliente().getId());
            resultado = enderecoDAO.consultar(endereco);
            //pedido.getEndereco().setClienteId(resultado.getEntidades().get(0).getId());
            int id_endereco = resultado.getEntidades().get(0).getId();
            Pagamento pagamento = new Pagamento();
            pagamento.getCartao().setId(pedido.getPagamento().getCartao().getId());
            resultado = pagamentoDAO.inserir(pagamento);
            pedido.getPagamento().setId(Integer.parseInt(resultado.getAcao()));
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO pedido (id_cliente, id_pagamento, "
                    + "id_endereco) VALUES(?, ?, ?)");
            declaracao.setInt(1, pedido.getCliente().getId());
            declaracao.setInt(2, pedido.getPagamento().getId());
            declaracao.setInt(3, id_endereco);
            
            declaracao.execute();
            resultado.setStatus(true);
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
