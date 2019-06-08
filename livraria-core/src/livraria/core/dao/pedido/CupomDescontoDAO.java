/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Cupom;
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
public class CupomDescontoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try{
          // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            // Instancias
            Pedido pedido = (Pedido) entidade;
            Cupom cupom = new Cupom();
            CupomDescontoDAO cupomDescDAO = new CupomDescontoDAO();
            cupom.setCodigo(pedido.getCupom().getCodigo());
            resultado = cupomDescDAO.consultar(cupom);
            cupom.setId(resultado.getEntidades().get(0).getId());
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO pgtoCupomDesconto(id_pedido, id_cupom) VALUES(?, ?)");
            declaracao.setInt(1, pedido.getId());
            declaracao.setInt(2, cupom.getId());
            declaracao.execute();
            resultado.setAcao("pedidoGerado");
            resultado.setStatus(true);
            resultado.setMensagem("O pedido foi gerado com sucesso");
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
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cupom cupom = (Cupom) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id, c.nome, c.valor, c.validade, c.codigo from cupomDesconto c where c.codigo = ?");
            declaracao.setString(1, cupom.getCodigo()); 
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Cupom cup = new Cupom();
                // Setando dados do cupom
                cup.setId(rs.getInt("id"));
                cup.setNome(rs.getString("nome"));
                cup.setValorDesconto(rs.getDouble("valor"));
                cup.setValidade(rs.getDate("validade"));
                cup.setCodigo(rs.getString("codigo"));
                entidades.add(cup);
            }
            resultado.setStatus(true);
            resultado.setMensagem("Cupom consultado");
            resultado.setAcao("consultar");
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
                 erro.printStackTrace();     
                 resultado.setStatus(false);
                 resultado.setMensagem("Houve algum erro ao consultar o cupom");
         } catch (SQLException erro) {
             erro.printStackTrace();   
         }
        resultado.setEntidades(entidades);
        return resultado;
    
    }
    
}
