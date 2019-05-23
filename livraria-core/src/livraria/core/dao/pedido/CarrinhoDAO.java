/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.livro.Editora;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Carrinho;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.AbstractDAO;
import livraria.core.dao.cliente.ClienteDAO;
import livraria.core.dao.livro.LivroDAO;
import livraria.core.util.BancoDadosOracle;

/**
 *
 * @author matheus
 */
public class CarrinhoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Carrinho carrinho = (Carrinho) entidade;
            
                 PreparedStatement declaracao = conexao.prepareStatement(
                    "INSERT INTO carrinho "
                    + "(id_livro, id_cliente) VALUES (?,?)");
                declaracao.setInt(1, carrinho.getLivro().getId()); 
                declaracao.setInt(2, carrinho.getCliente().getId());
                declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("O Livro foi inserido com sucesso");
            resultado.setAcao("adicionar");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o Livro");
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
       List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Carrinho carrinho = (Carrinho) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(""
                                                + "DELETE FROM carrinho WHERE id_livro =? AND id_cliente = ?");
            
				declaracao.setInt(1, carrinho.getLivro().getId());
				declaracao.setInt(2, carrinho.getCliente().getId());                                
				declaracao.execute();

            resultado.setStatus(true);
            resultado.setMensagem("O carrinho foi excluido com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao desativar o carrinho");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado ativar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado consultar(EntidadeDominio entidade) {
        double precoTotal = 0;
        
        
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Carrinho carrinho = (Carrinho) entidade;
            // Se o id do objeto cliente não estiver preenchido. A funcao consultar irá consultar o CPF e EMAIL
            PreparedStatement declaracao = conexao.prepareStatement("select livro.id as id_livro, livro.titulo, livro.autor, livro.ano,"
                    + " livro.edicao, livro.sinopse,\n" +
                        "livro.preco, livro.id_grupolivro, cliente.id as id_cliente,\n" +
                        "cliente.nome as nome_cliente from carrinho\n" +
                        "INNER JOIN livro on livro.id = carrinho.id_livro\n" +
                        "INNER JOIN cliente on cliente.id = carrinho.id_cliente\n" +
                        "where carrinho.id_cliente = ?;");
            declaracao.setInt(1, carrinho.getCliente().getId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Carrinho car = new Carrinho();

                car.getLivro().setAutor(rs.getString("autor"));
                car.getLivro().setEdicao(rs.getString("edicao"));
                car.getLivro().setTitulo(rs.getString("titulo"));
                car.getLivro().setAno(rs.getString("ano"));
                car.getLivro().setId(rs.getInt("id_livro"));
                car.getLivro().setPreco(rs.getDouble("preco"));
                car.getCliente().setId(rs.getInt("id_cliente"));
                precoTotal += car.getLivro().getPreco();
                car.setSubTotal(precoTotal);
                entidades.add(car);
            }
           
            resultado.setEntidades(entidades);
            resultado.setAcao("consultar");
            resultado.setStatus(true);
            resultado.setMensagem("O livro foi recuperado");
            // Fecha a conexao.
            conexao.close();
            }catch(ClassNotFoundException erro) {
                erro.printStackTrace();     
                resultado.setStatus(false);
                resultado.setMensagem("Houve algum erro ao listar o endereco");
            } catch (SQLException erro) {
                erro.printStackTrace();   
            }
           return resultado;            

    }
    
}
