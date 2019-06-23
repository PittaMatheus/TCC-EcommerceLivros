/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.estoque.Estoque;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Carrinho;
import ecommerce.dominio.pedido.Cupom;
import ecommerce.dominio.pedido.ItemPedido;
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
            // Instancias
            Pedido pedido = (Pedido) entidade;
            PagamentoDAO pagamentoDAO = new PagamentoDAO();
            ItemPedidoDAO itemDAO = new ItemPedidoDAO();
            PagamentoCartaoCredito pgCartao = new PagamentoCartaoCredito();
            Pagamento pagamento = new Pagamento();
            Endereco endereco = new Endereco();
            endereco.setId(pedido.getEndereco().getId());
            CupomDescontoDAO cupomDescDao = new CupomDescontoDAO();
            Cupom cupom = new Cupom();
            double houveCupom;
            if(pedido.getCupom().getCodigo() == null){
                houveCupom = 0;
            }else{
                houveCupom = 1;
            }
            if(pedido.getItems().isEmpty()){
                // Recuperar itens do carrinho
                CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
                Carrinho carrinho = new Carrinho();
                
                carrinho.getCliente().setId(pedido.getCliente().getId());
                resultado = carrinhoDAO.consultar(carrinho);
                List<Carrinho> itens = (List) resultado.getEntidades();
                List<ItemPedido> itensPedidos = new ArrayList();
                
                for(Carrinho item: itens){
                    ItemPedido itemPedido = new ItemPedido();
                    itemPedido.getLivro().setId(item.getLivro().getId());
                    itemPedido.setQuantidade(item.getQt_itens());
                    itensPedidos.add(itemPedido);
                }
                    pedido.setItems(itensPedidos);
                }
            
            // Verificar se tem livro no estoque
            EstoqueDAO estoqueDAO = new EstoqueDAO();
            Estoque estoque = new Estoque();
            //Recupera a quantidade dos livros do pedido no estoque 
            resultado = estoqueDAO.consultarLivros(pedido);
            List<Estoque> estoques = (List) resultado.getEntidades();
            //loop para alterar o estoque no banco para cada livro
            int i = 0;
            for(Estoque est: estoques){
                estoque.setId(est.getItem().getLivro().getId());
                estoque.getItem().setQuantidade(est.getItem().getQuantidade());
                estoque.setAcao(String.valueOf(pedido.getItems().get(i).getQuantidade()));
                estoqueDAO.baixaLivro(estoque);
                i++;
            }

            
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO pedido(id_cliente, "
                    + "id_endereco, valorTotal,cupomDesconto) VALUES(?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            declaracao.setInt(1, pedido.getCliente().getId());
            declaracao.setInt(2, endereco.getId());
            declaracao.setDouble(3, pedido.getPagamento().getValorTotal());
            declaracao.setDouble(4, houveCupom);

            declaracao.execute();
            ResultSet rs = declaracao.getGeneratedKeys();
            // Seta o ID do pedido
            pedido.setId((rs.next())?rs.getInt(1):0);
            // Salva o pagamento com seus respectivos cartões
            resultado = pagamentoDAO.inserir(pedido);
            // Salva o pedido com seus respectivos itens
            resultado = itemDAO.inserir(pedido);
            // Salva o cupom de desconto - Se existir um na compra
            cupom.setCodigo(pedido.getCupom().getCodigo());
            if(pedido.getCupom().getCodigo() != null){
                resultado = cupomDescDao.inserir(pedido);
            }
            
            CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
            Carrinho carrinho = new Carrinho();
            carrinho.getCliente().setId(pedido.getCliente().getId());
            carrinho.setAcao("limpar");
            carrinhoDAO.desativar(carrinho);
            
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
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Pedido pedido = (Pedido) entidade;
                       PreparedStatement declaracao = conexao.prepareStatement("select p.id, p.id_cliente, p.id_statusPedido, p.id_endereco, p.dt_pedido, p.valorTotal,\n" +
                    "c.email, c.cpf, c.data_nascimento, c.id, c.tipo_usuario, c.nome, c.ranking, c.rg, c.sexo, c.email, c.sobrenome,\n" +
                    "e.bairro, e.cep, e.cidade, e.complemento, e.logradouro, e.nomeEndereco, e.numero, e.referencia,\n" +
                    "e.tipoEndereco, e.tipoLogradouro, e.uf\n" +
                    "from pedido p\n" +
                    "INNER JOIN cliente c\n" +
                    "INNER JOIN endereco e \n" +
                    "on p.id_cliente = c.id \n" +
                    "AND\n" +
                    "e.id = p.id_endereco;");
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
            resultado.setMensagem("Pedidos listados");
            if(pedido.getTipo().equals("1") && pedido.getTipo() != null){
                resultado.setAcao("listarMeusPedidos");
            }else{
                resultado.setAcao("listarPedidos");
            }
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
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Pedido pedido = (Pedido) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("update pedido set id_statusPedido = ? where id = ? " );
            
                if(null != pedido.getAcao()){
                   if(pedido.getAcao().equals("reprovar") || pedido.getAcao().equals("finalizar")){
                        pedido.getStatusPedido().setId(pedido.getStatusPedido().getId() + 2);
                }}else{
                pedido.getStatusPedido().setId(pedido.getStatusPedido().getId() + 1);
                }
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
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Pedido pedido = (Pedido) entidade;
                       PreparedStatement declaracao = conexao.prepareStatement("select p.id, p.id_cliente, p.id_statusPedido, p.id_endereco, p.dt_pedido, p.valorTotal,\n" +
                    "c.email, c.cpf, c.data_nascimento, c.id, c.tipo_usuario, c.nome, c.ranking, c.rg, c.sexo, c.email, c.sobrenome,\n" +
                    "e.bairro, e.cep, e.cidade, e.complemento, e.logradouro, e.nomeEndereco, e.numero, e.referencia,\n" +
                    "e.tipoEndereco, e.tipoLogradouro, e.uf\n" +
                    "from pedido p\n" +
                    "INNER JOIN cliente c\n" +
                    "INNER JOIN endereco e \n" +
                    "on p.id_cliente = c.id \n" +
                    "AND\n" +
                    "e.id = p.id_endereco AND p.id_cliente = ?");
                declaracao.setInt(1, pedido.getCliente().getId()); 
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
            resultado.setMensagem("Pedidos consultados");
            if(pedido.getTipo().equals("1") && pedido.getTipo() != null){
                resultado.setAcao("listarMeusPedidos");
            }else{
                resultado.setAcao("listarPedidos");
            }
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
    
}
