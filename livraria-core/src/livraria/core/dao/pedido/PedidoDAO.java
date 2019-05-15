/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Pagamento;
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.dao.cliente.EnderecoDAO;
import livraria.core.dao.livro.DimensoesDAO;
import livraria.core.dao.livro.EditoraDAO;
import livraria.core.dao.livro.IsbnDAO;
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
            PagamentoCartaoCredito pgCartao = new PagamentoCartaoCredito();
            Pagamento pagamento = new Pagamento();
            
            
            Endereco endereco = new Endereco();
            endereco.setClienteId(pedido.getCliente().getId());
            resultado = enderecoDAO.consultar(endereco);
            //pedido.getEndereco().setClienteId(resultado.getEntidades().get(0).getId());
            int id_endereco = resultado.getEntidades().get(0).getId();
            
           
            
            
            
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO pedido(id_cliente, "
                    + "id_endereco) VALUES(?, ?)", Statement.RETURN_GENERATED_KEYS);
            declaracao.setInt(1, pedido.getCliente().getId());
            declaracao.setInt(2, id_endereco);
            declaracao.execute();
            ResultSet rs = declaracao.getGeneratedKeys();
            pedido.setId((rs.next())?rs.getInt(1):0);
            
             // Setar os dados de pagamento
            pagamento.getPedido().setId(pedido.getId());
            pagamento.setPagamentosCartao(pedido.getPagamento().getPagamentosCartao());
            pagamento.setValorTotal(pedido.getPagamento().getValorTotal());
            pagamento.getCartao().setId(pedido.getPagamento().getCartao().getId());
            resultado = pagamentoDAO.inserir(pagamento);
            
            
            
            
            resultado.setAcao("pedidoGerado");
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
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Pedido pedido = (Pedido) entidade;
                       PreparedStatement declaracao = conexao.prepareStatement("select p.id, p.id_cliente, p.id_pagamento, pag.valor_total,\n" +
                    "car.bandeira, c.tipo_usuario, car.dtVencimento, car.numero, p.id_statusPedido, p.id_endereco, p.dt_pedido,\n" +
                    "pag.dt_pagamento, c.email, c.cpf, c.data_nascimento, c.id, c.nome, c.ranking, c.rg, c.sexo, c.email, c.sobrenome,\n" +
                    "e.bairro, e.cep, e.cidade, e.complemento, e.logradouro, e.nomeEndereco, e.numero, e.referencia,\n" +
                    "e.tipoEndereco, e.tipoLogradouro, e.uf\n" +
                    "from pedido p\n" +
                    "inner join cliente c\n" +
                    "inner join endereco e\n" +
                    "inner join cartao car \n" +
                    "inner join pagamento pag \n" +
                    "where pag.id = p.id_pagamento \n" +
                    "AND c.id = p.id_cliente AND p.id_endereco = e.id AND car.id = pag.id_cartao;");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Pedido ped = new Pedido();
                // Setando dados do pedido
                ped.setId(rs.getInt("id"));
                ped.setDtPedido(rs.getDate("dt_pedido"));
                ped.getStatusPedido().setId(rs.getInt("id_statusPedido"));
                // Setando dados do cliente
                ped.getCliente().setId(rs.getInt("id_cliente"));
                ped.getCliente().setEmail(rs.getString("email"));
                ped.getCliente().setNome(rs.getString("nome"));
                String tipoUsuario = rs.getString("tipo_usuario");
                ped.getCliente().getPapel().setId(Integer.parseInt(tipoUsuario));
                
                // Setando dados do pagamento
                ped.getPagamento().setId(rs.getInt("id_pagamento"));
                ped.getPagamento().setValorTotal(rs.getDouble("valor_total"));
                ped.getPagamento().getCartao().getBandeira().setNome(rs.getString("bandeira"));
                ped.getPagamento().setDtPagamento(rs.getDate("dt_pagamento"));
                ped.getPagamento().getCartao().setNumeroCartao(rs.getString("numero"));
                // Setando dados do endereco
                ped.getEndereco().setId(rs.getInt("id_endereco"));
                ped.getEndereco().setLogradouro(rs.getString("logradouro"));
                ped.getEndereco().setNumero(rs.getString("numero"));
                ped.getEndereco().setBairro(rs.getString("bairro"));
                ped.getEndereco().setCep(rs.getString("cep"));
                ped.getEndereco().setCidade(rs.getString("cidade"));
                ped.getEndereco().setUf(rs.getString("uf"));
                ped.getEndereco().setTipoLogradouro(rs.getString("tipoLogradouro"));
                ped.getEndereco().setNomeEndereco(rs.getString("nomeEndereco"));
                ped.getEndereco().setComplemento(rs.getString("complemento"));
                ped.getEndereco().setReferencia(rs.getString("referencia"));
                // Adicionando o objeto preenchido na lista entidades
                entidades.add(ped);
            }
            resultado.setStatus(true);
            if(pedido.getTipo().equals("1") && pedido.getTipo() != null){
                resultado.setAcao("listarMeusPedidos");
            }else{
                resultado.setAcao("listarPedidos");
            }
        }catch(ClassNotFoundException erro) {
                 erro.printStackTrace();     
                 resultado.setStatus(false);
                 resultado.setMensagem("Houve algum erro ao listar os pedidos");
         } catch (SQLException erro) {
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
            Pedido pedido = (Pedido) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("update pedido set id_statusPedido = ? where id = ? " );

            pedido.getStatusPedido().setId(pedido.getStatusPedido().getId() + 1);
            declaracao.setInt(1, pedido.getStatusPedido().getId());
            declaracao.setInt(2, pedido.getId());
            
            declaracao.executeUpdate();
            resultado.setStatus(true);
            resultado.setMensagem("O Status do pedido foi alterarado com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao alterar o status do pedido");
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
