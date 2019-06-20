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
        
       List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            ItemPedido itemPed = (ItemPedido) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("select quantidade, id_livro, id_pedido, l.titulo, l.preco, l.autor, l.imagem, gp.margem_lucro\n" +
                "from itemPedido\n" +
                "INNER JOIN livro l\n" +
                "INNER JOIN grupolivro gp on l.id_grupolivro = gp.id\n" +
                "where id_pedido = ? AND\n" +
                "id_livro = l.id;");
            declaracao.setInt(1, itemPed.getPedido().getId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                ItemPedido item = new ItemPedido();
                item.setQuantidade(rs.getInt("quantidade"));
                item.getLivro().setId(rs.getInt("id_livro"));
                item.getLivro().setTitulo(rs.getString("titulo"));
                item.getLivro().setPreco(rs.getDouble("preco"));
                item.getPedido().setId(rs.getInt("id_pedido"));
                item.getLivro().setImagem(rs.getString("imagem"));
                item.getLivro().setAutor(rs.getString("autor"));
                item.getLivro().getGrupoLivro().setMargemLucro(rs.getDouble("margem_lucro"));

                
                
                entidades.add(item);	
            }
            resultado.setEntidades(entidades);
            resultado.setStatus(true);
            resultado.setMensagem("Items Pedido listados com sucesso");
            resultado.setAcao("listar");
            // Fecha a conexao.
            conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar os itens pedidos");
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
