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
            PedidoDAO pDAO = new PedidoDAO();
            Pedido pedido = new Pedido();
            pedido.setId(troca.getPedido().getId());
            pedido.getStatusPedido().setId(3);
            pDAO.alterar(pedido);
            
            
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
           
            Troca troca = (Troca) entidade;
            if(troca.getStatus() != null && troca.getStatus().equals("1")){
                Connection conexao = BancoDadosOracle.getConexao();
                       PreparedStatement declaracao = conexao.prepareStatement("select p.id, p.id_cliente, p.id_statusPedido, p.id_endereco, p.dt_pedido, p.valorTotal,\n" +
                    "c.email, c.cpf, c.data_nascimento, c.id, c.tipo_usuario, c.nome, c.ranking, c.rg, c.sexo, c.email, c.sobrenome,\n" +
                    "e.bairro, e.cep, e.cidade, e.complemento, e.logradouro, e.nomeEndereco, e.numero, e.referencia,\n" +
                    "e.tipoEndereco, e.tipoLogradouro, e.uf\n" +
                    "from pedido p\n" +
                    "INNER JOIN cliente c\n" +
                    "INNER JOIN endereco e \n" +
                    "on p.id_cliente = c.id \n" +
                    "AND\n" +
                    "e.id = p.id_endereco AND p.id_statusPedido > 3");
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
                //ped.getPagamento().setId(rs.getInt("id_pagamento"));
                ped.getPagamento().setValorTotal(rs.getDouble("valorTotal"));
                //ped.getPagamento().getCartao().getBandeira().setNome(rs.getString("bandeira"));
               // ped.getPagamento().setDtPagamento(rs.getDate("dt_pagamento"));
                //ped.getPagamento().getCartao().setNumeroCartao(rs.getString("numero"));
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
                resultado.setAcao("listarTroca");
                // Fecha a conexao.
                conexao.close();
                
            }else{
                        Connection conexao = BancoDadosOracle.getConexao();
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
            }
            
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
