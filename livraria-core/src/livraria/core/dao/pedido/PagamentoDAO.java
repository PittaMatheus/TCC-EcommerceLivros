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
import java.util.ArrayList;
import java.util.List;
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
            List<PagamentoCartaoCredito> valoresCartoes = new ArrayList<>();
            int aux = 0;
            // Insere os pagamentos para cada cartão
            for(PagamentoCartaoCredito pgto: pedido.getPagamento().getPagamentosCartao()){
                 PreparedStatement declaracao = conexao.prepareStatement(
                    "INSERT INTO pagamentoCartao "
                    + "(id_pedido, id_cartao, valor) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
                declaracao.setInt(1, pedido.getId());
                declaracao.setInt(2, pgto.getCartaoCredito().getId());
                valoresCartoes = pedido.getPagamento().getPagamentosCartao();
                pgCartao = valoresCartoes.get(aux);
                aux++;             
                declaracao.setDouble(3,pgCartao.getValor()); // colocar o valor do cartao com o indice certo);
                declaracao.execute();
            }
            

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
         
       List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            
            Connection conexao = BancoDadosOracle.getConexao();
            PagamentoCartaoCredito pgto = (PagamentoCartaoCredito) entidade;
            if(pgto.getAcao() == null){
                PreparedStatement declaracao = conexao.prepareStatement("select pg.id_pedido, pg.id_cartao, pg.valor, c.nome as nomeCartao,\n" +
                    "c.numero, c.dtVencimento, b.nome_bandeira, ped.cupomDesconto\n" +
                    "from pagamentoCartao pg\n" +
                    "INNER JOIN cartao c\n" +
                    "INNER JOIN bandeira b\n" +
                    "INNER JOIN pedido ped\n" +
                    "where pg.id_pedido = ? AND\n" +
                    "pg.id_cartao = c.id \n" +
                    "AND c.id_bandeira = b.id_bandeira\n" +
                    "AND pg.id_pedido = ped.id;");                
                declaracao.setInt(1, pgto.getId());
                ResultSet rs =  declaracao.executeQuery();
                while(rs.next()) {
                    Pedido ped = new Pedido();
                    ped.setId(rs.getInt("id_pedido"));
                    ped.getPagamento().getCartao().setId(rs.getInt("id_cartao"));
                    ped.getPagamento().setValorTotal(rs.getDouble("valor"));
                    ped.getPagamento().getCartao().setNome(rs.getString("nomeCartao"));
                    ped.getPagamento().getCartao().getBandeira().setNome(rs.getString("nome_bandeira"));
                    ped.getPagamento().getCartao().setNumeroCartao(rs.getString("numero"));
                    ped.getPagamento().getCartao().setDtVencimento(rs.getDate("dtVencimento"));
                    ped.getPagamento().getCupom().setId(rs.getInt("cupomDesconto"));
                    entidades.add(ped);	
                }
                resultado.setAcao("listar");
            }else{
                PreparedStatement declaracao = conexao.prepareStatement("select ped.id,\n" +
                        "cup.nome, cup.valor\n" +
                        "from pedido ped\n" +
                        "INNER JOIN pgtoCupomDesconto pgC      \n" +
                        "INNER JOIN cupomDesconto cup\n" +
                        "WHERE ped.id = pgC.id_pedido\n" +
                        "AND\n" +
                        "pgC.id_cupom = cup.id\n" +
                        "AND ped.id = ?");                
                declaracao.setInt(1, pgto.getId());
                ResultSet rs =  declaracao.executeQuery();
                while(rs.next()) {
                    Pedido ped = new Pedido();
                    ped.setId(rs.getInt("id"));
                    ped.getPagamento().getCupom().setNome(rs.getString("nome"));
                    ped.getPagamento().getCupom().setValorDesconto(rs.getDouble("valor"));
                    entidades.add(ped);	
                }
                resultado.setAcao("listarCupomDesconto");
            }
            resultado.setEntidades(entidades);
            resultado.setStatus(true);
            resultado.setMensagem("PagamentoPedido listados com sucesso");
            
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar os pagamentos do pedido");
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
