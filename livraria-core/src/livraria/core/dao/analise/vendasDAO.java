/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.analise;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.analise.Analise;
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
public class vendasDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Analise analise = (Analise) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT  livC.id_livro, cat.nome, itemPed.quantidade, itemPed.id_pedido\n" +
                "from livro_categoria livC\n" +
                "INNER JOIN categoria cat\n" +
                "INNER JOIN itemPedido itemPed\n" +
                "WHERE livC.id_categoria = cat.id AND\n" +
                "livC.id_livro = itemPed.id_livro;");
            
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Analise anali = new Analise();
                anali.setId(rs.getInt("id_pedido"));
                anali.getItem().getLivro().getCategoria().setNome(rs.getString("nome"));
                anali.getItem().setQuantidade(rs.getInt("quantidade"));
                anali.getItem().getLivro().setId(rs.getInt("id_livro"));
                entidades.add(anali);
            }
            resultado.setStatus(true);
            resultado.setMensagem("Analise listados");
            resultado.setAcao("analiseVenda");
            // Fecha a conexao.
            conexao.close();
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
