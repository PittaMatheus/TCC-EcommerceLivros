/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.analise;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.analise.AnaliseCustoReceitaLucroMes;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.util.BancoDadosOracle;
import livraria.core.util.FormatadorData;
import livraria.core.util.PrecoUtils;

/**
 *
 * @author bocao
 */
public class AnaliseCustoReceitaLucroMesDAO extends AbstractDAO {

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        PreparedStatement pst = null;

        AnaliseCustoReceitaLucroMes analise = (AnaliseCustoReceitaLucroMes) entidade;

        String sqlDatasEstoqueCusto = "select distinct estoque.dt_entrada from estoque"
            + " order by dt_entrada asc";
        
        String sqlEstoqueCustoQuant = "select distinct estoque.dt_entrada, quantidade, valor_custo from estoque "
                        + "group by dt_entrada, quantidade, valor_custo";
        
        String sqlDatasPedido = "select distinct pedido.dt_pedido from pedido "
            + "where pedido.id_statusPedido = 3 or pedido.id_statusPedido = 7 "
            + "order by dt_pedido asc";
        
        String sqlPedidoReceita = "select distinct pedido.dt_pedido, valorTotal from pedido "
            + "where pedido.id_statusPedido = 3 or pedido.id_statusPedido = 7 "
            + "group by dt_pedido, valorTotal";
        

        try {
            Connection conexao = BancoDadosOracle.getConexao();
            
            
           
            pst = conexao.prepareStatement(sqlDatasEstoqueCusto);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Timestamp ts = rs.getTimestamp("dt_entrada");
                String dataFormatada = FormatadorData.formatarDataTimeSt(ts);
                analise.getDatasCusto().add(dataFormatada);
            }

            rs.close();
            pst.close();
            
            
            pst = conexao.prepareStatement(sqlDatasPedido);

            rs = pst.executeQuery();

            while (rs.next()) {
                Timestamp ts = rs.getTimestamp("dt_pedido");
                String dataFormatada = FormatadorData.formatarDataTimeSt(ts);
                analise.getDatasPedido().add(dataFormatada);
            }

            rs.close();
            pst.close();
            
            

            pst = conexao.prepareStatement(sqlEstoqueCustoQuant);

            rs = pst.executeQuery();
            List<EntidadeDominio> analises = new ArrayList<EntidadeDominio>();

            while (rs.next()) {

                Timestamp ts = rs.getTimestamp("dt_entrada");
                Integer quantidade = rs.getInt("quantidade");
                Double valor_custo = rs.getDouble("valor_custo");
//                System.out.println(ts);
                analise.getMapa("Custo").put(FormatadorData.formatarDataTimeSt(ts), PrecoUtils.arredondarPreco((quantidade * valor_custo)));
            }
            rs.close();
            
            pst = conexao.prepareStatement(sqlPedidoReceita);

            rs = pst.executeQuery();

            while (rs.next()) {

                Timestamp ts = rs.getTimestamp("dt_pedido");
                Double valorTotal = rs.getDouble("valorTotal");

                analise.getMapa("Receita").put(FormatadorData.formatarDataTimeSt(ts), PrecoUtils.arredondarPreco(valorTotal));
            }
            rs.close();
            analises.add(analise);
            resultado.setEntidades(analises);
            resultado.setAcao("listar");
        } catch (SQLException e) {
                resultado.setAcao("falhaListar");
                e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
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