/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.analise;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.analise.AnaliseCategoriaMaisVendida;
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

/**
 *
 * @author bocao
 */
public class AnaliseCategoriaMaisVendidaDAO extends AbstractDAO {

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        PreparedStatement pst = null;

        AnaliseCategoriaMaisVendida analise = (AnaliseCategoriaMaisVendida) entidade;

        String sqlDatas = "select distinct pedido.dt_pedido from pedido "
                        + "where (DATE_FORMAT(dt_pedido, '%Y-%m-%d') BETWEEN ? AND ?) and (pedido.id_statusPedido = 3 or pedido.id_statusPedido = 7) "
                        + "order by dt_pedido asc";

        String sql = "select pedido.dt_pedido, categoria.nome as categoria, sum(itemPedido.quantidade) as quantidade from pedido "
                        + "inner join itemPedido on itemPedido.id_pedido = pedido.id "
                        + "inner join livro on livro.id = itemPedido.id_livro "
                        + "inner join livro_categoria on livro_categoria.id_livro = livro.id "
                        + "inner join categoria on categoria.id = livro_categoria.id_categoria "
                        + "inner join statusPedido on statusPedido.id = pedido.id_statusPedido "
                        + "where (DATE_FORMAT(dt_pedido, '%Y-%m-%d') BETWEEN ? AND ?) and (pedido.id_statusPedido = 3 or pedido.id_statusPedido = 7) "
                        + "group by dt_pedido, categoria";

        try {
            Connection conexao = BancoDadosOracle.getConexao();
            
            
           
            pst = conexao.prepareStatement(sqlDatas);
            Date dtInicio = new Date(analise.getDtInicio().getTime());
            
//            Timestamp timeInicio = new Timestamp(analise.getDtInicio().getTime());
            
            pst.setDate(1, dtInicio);
            
            Date dtFim = new Date(analise.getDtFim().getTime());
//            Timestamp timeFim = new Timestamp(analise.getDtFim().getTime());
            pst.setDate(2, dtFim);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Timestamp ts = rs.getTimestamp("dt_pedido");
                Date dataPedido = new Date(ts.getTime());
                if (rs.isFirst()) {
                    if (dataPedido.after(analise.getDtInicio())) {
                        String dataFormatada = FormatadorData.formatarDataTimeSt(ts);
                        analise.getDatasPedidos().add(dataFormatada);
                    }
                }else if (rs.isLast()) {
                    
                    String dataFormatada = FormatadorData.formatarDataTimeSt(ts);
                    analise.getDatasPedidos().add(dataFormatada);
                    
                }else{
                    String dataFormatada = FormatadorData.formatarDataTimeSt(ts);
                    analise.getDatasPedidos().add(dataFormatada);
                }
            }

            rs.close();
            pst.close();

            pst = conexao.prepareStatement(sql);

            pst.setDate(1, dtInicio);

            pst.setDate(2, dtFim);

            rs = pst.executeQuery();
            List<EntidadeDominio> analises = new ArrayList<EntidadeDominio>();

            while (rs.next()) {
                String nomeCategoria = rs.getString("categoria");

                Timestamp ts = rs.getTimestamp("dt_pedido");
                Integer quantidade = rs.getInt("quantidade");

                analise.getMapaCategoria(nomeCategoria).put(FormatadorData.formatarDataTimeSt(ts), quantidade);
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