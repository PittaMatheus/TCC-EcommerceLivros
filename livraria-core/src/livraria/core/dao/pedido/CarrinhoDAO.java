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
import ecommerce.dominio.pedido.ItemPedido;
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
import livraria.core.util.LivroUtils;

/**
 *
 * @author matheus
 */
public class CarrinhoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        try {
            boolean flgJaEstaNoCarrinho = false;
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Carrinho carrinho = (Carrinho) entidade;
            resultado = consultar(carrinho);
            List<Carrinho> itens = (List) resultado.getEntidades();
            for(Carrinho car: itens){
                if(carrinho.getLivro().getId().equals(car.getLivro().getId())){
                    flgJaEstaNoCarrinho = true;
                    carrinho.setQt_itens(car.getQt_itens() + 1);
                    alterar(carrinho);
                }
                }

            // SÓ insere o item no carrinho o item a ser iserido nao existe nele
            if(resultado.getEntidades().isEmpty() || !flgJaEstaNoCarrinho){
                PreparedStatement declaracao = conexao.prepareStatement(
                   "INSERT INTO carrinho "
                   + "(id_livro, id_cliente, quantidade) VALUES (?,?, ?)");
                declaracao.setInt(1, carrinho.getLivro().getId()); 
                declaracao.setInt(2, carrinho.getCliente().getId());
                declaracao.setInt(3, 1);

                    // Se o item nao ta no carrinho. a qtde é 1

                    declaracao.execute();
                resultado.setStatus(true);
                resultado.setMensagem("O Livro foi inserido com sucesso");
                resultado.setAcao("adicionar");
                // Fecha a conexao.
                conexao.close();
             } 
            
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
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            
                Carrinho carrinho = (Carrinho) entidade;
                
                if(carrinho.getAcao() == null){
                    // Abre uma conexao com o banco.
                    Connection conexao = BancoDadosOracle.getConexao();
                    PreparedStatement declaracao = conexao.prepareStatement(""
                                                        + "UPDATE carrinho set quantidade = ? WHERE id_cliente =? AND id_livro = ?");
                    declaracao.setInt(1, carrinho.getQt_itens());
                    declaracao.setInt(2, carrinho.getCliente().getId());  
                    declaracao.setInt(3, carrinho.getLivro().getId());                                
                    declaracao.execute();
                    resultado.setStatus(true);
                    resultado.setMensagem("O carrinho foi alterado com sucesso!");   
                    // Fecha a conexao.
                    conexao.close();
                }else if(carrinho.getAcao().equals("remover")){
                    int qt = 0;
                    resultado = consultar(carrinho);
                    List<Carrinho> itens = (List) resultado.getEntidades();
                    for(Carrinho item: itens){
                        if(carrinho.getLivro().getId().equals(item.getLivro().getId())){
                            qt = item.getQt_itens();
                            break;
                        }
                    }
                    // Abre uma conexao com o banco.
                    Connection conexao = BancoDadosOracle.getConexao();
                    PreparedStatement declaracao = conexao.prepareStatement(""
                                                        + "UPDATE carrinho set quantidade = ? WHERE id_cliente =? AND id_livro = ?");
                    declaracao.setInt(1, qt - 1);
                    declaracao.setInt(2, carrinho.getCliente().getId());  
                    declaracao.setInt(3, carrinho.getLivro().getId());                                
                    declaracao.execute();
                    resultado.setAcao("adicionar");
                    resultado.setStatus(true);
                    resultado.setMensagem("O carrinho foi alterado com sucesso!");   
                    // Fecha a conexao.
                    conexao.close();
                    
                }else if(carrinho.getAcao().equals("adicionar")){
                    int qt = 0;
                    resultado = consultar(carrinho);
                    List<Carrinho> itens = (List) resultado.getEntidades();
                    for(Carrinho item: itens){
                        if(carrinho.getLivro().getId().equals(item.getLivro().getId())){
                            qt = item.getQt_itens();
                            break;
                        }
                        
                    }
                    // Abre uma conexao com o banco.
                    Connection conexao = BancoDadosOracle.getConexao();
                    PreparedStatement declaracao = conexao.prepareStatement(""
                                                        + "UPDATE carrinho set quantidade = ? WHERE id_cliente =? AND id_livro = ?");
                    declaracao.setInt(1,qt + 1);
                    declaracao.setInt(2, carrinho.getCliente().getId());  
                    declaracao.setInt(3, carrinho.getLivro().getId());                                
                    declaracao.execute();
                    resultado.setStatus(true);
                    resultado.setAcao("adicionar");
                    resultado.setMensagem("O carrinho foi alterado com sucesso!");   
                    // Fecha a conexao.
                    conexao.close(); 
                        }
                    
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao alterar o carrinho");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado desativar(EntidadeDominio entidade) {
       List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            
            Carrinho carrinho = (Carrinho) entidade;
            if(carrinho.getAcao() == null){
                // Abre uma conexao com o banco.
                Connection conexao = BancoDadosOracle.getConexao();
                PreparedStatement declaracao = conexao.prepareStatement(""
                                                    + "DELETE FROM carrinho WHERE id_livro =? AND id_cliente = ?");

                                    declaracao.setInt(1, carrinho.getLivro().getId());
                                    declaracao.setInt(2, carrinho.getCliente().getId());                                
                                    declaracao.execute();

                resultado.setStatus(true);
                resultado.setMensagem("O carrinho foi excluido com sucesso!");   
                // Fecha a conexao.
                conexao.close();
            }else if(carrinho.getAcao() != null && carrinho.getAcao().equals("limpar")){
                Connection conexao = BancoDadosOracle.getConexao();
                PreparedStatement declaracao = conexao.prepareStatement("DELETE FROM carrinho WHERE id_cliente = ?");
                                    declaracao.setInt(1, carrinho.getCliente().getId());                                
                                    declaracao.execute();
                resultado.setStatus(true);
                resultado.setMensagem("O carrinho foi esvaziado com sucesso!");   
                // Fecha a conexao.
                conexao.close();
            }
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
            Livro livro = new Livro();
            // Se o id do objeto cliente não estiver preenchido. A funcao consultar irá consultar o CPF e EMAIL
            PreparedStatement declaracao = conexao.prepareStatement("select livro.id as id_livro, livro.titulo, livro.autor, livro.ano,\n" +
            "livro.edicao, livro.sinopse,\n" +
            "livro.preco, livro.imagem, livro.id_grupolivro, car.quantidade, cliente.id as id_cliente, gp.margem_lucro,\n" +
            "cliente.nome as nome_cliente from carrinho\n" +
            "INNER JOIN livro on livro.id = carrinho.id_livro\n" +
            "INNER JOIN cliente on cliente.id = carrinho.id_cliente\n" +
            "INNER JOIN grupolivro gp on livro.id_grupoLivro = gp.id\n" +
             "INNER JOIN carrinho car on livro.id = car.id_livro\n" +
            "where carrinho.id_cliente = ?");
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
                car.getLivro().getGrupoLivro().setMargemLucro(rs.getInt("margem_lucro"));
                car.getLivro().setImagem(rs.getString("imagem"));
                car.setQt_itens(rs.getInt("quantidade"));
                livro.setPreco(car.getLivro().getPreco());
                livro.getGrupoLivro().setMargemLucro(car.getLivro().getGrupoLivro().getMargemLucro());
                precoTotal += LivroUtils.calcularPrecoLivro(livro);
                car.getLivro().setPreco(LivroUtils.calcularPrecoLivro(livro));
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
