/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cartao;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.ItemPedido;
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.crypto.spec.IvParameterSpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewPedido implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        
            HttpSession session = request.getSession();
            Pedido pedido = new Pedido();
            if(null != session.getAttribute("pedido")){
                pedido = (Pedido)session.getAttribute("pedido");
            }
                           
            Livro objLivro = new Livro();
            Cliente objCliente = new Cliente();
            

            
            
            List<ItemPedido> item = new ArrayList<>();
            String id = request.getParameter("id_pedido");
            String id_cliente = request.getParameter("u");
            String tipoUsuario = request.getParameter("tipoUsuario");        
            String id_endereco = request.getParameter("id_endereco");
            String[] idsCartao = request.getParameterValues("id_cartao");
            String[] valoresCartao = request.getParameterValues("valorCartao");
            String[] datasValidade = request.getParameterValues("dataValidade");
            String [] idsLivro = request.getParameterValues("livros");
            DateFormat formatadorData = new SimpleDateFormat("dd/MM/yyyy");

            String status = request.getParameter("status");

            List<PagamentoCartaoCredito> idsCartoes = new ArrayList<>();
            if(tipoUsuario != null){
                pedido.setTipo(tipoUsuario);
            }

            String valorTotal =request.getParameter("valorTotal");

            if(valorTotal != null){
                pedido.getPagamento().setValorTotal(Double.valueOf(valorTotal));
            }
            if(id_cliente != null ){
                pedido.getCliente().setId(Integer.parseInt(id_cliente));
            }
            if(id_endereco != null){
                pedido.getEndereco().setClienteId(Integer.parseInt(id_endereco));
            }


            if(id != null){
                pedido.setId(Integer.parseInt(id));
            }
            if(status != null){
                pedido.getStatusPedido().setId(Integer.parseInt(status));
            }

            int aux = 0;
            // Recuperando os IDS dos cartoes escolhidos pelo cliente
            if(idsCartao != null && idsCartao.length > 0){
                for(String idCartao: idsCartao){
                        String valor = valoresCartao[aux];
                       
                        PagamentoCartaoCredito pgCartao = new PagamentoCartaoCredito();
                        Cartao cartao = new Cartao();
                        // Seto o id do cartao no objeto Cartao
                        cartao.setId(Integer.parseInt(idCartao));
                        try{
                            Date data = formatadorData.parse(datasValidade[aux]);
                            cartao.setDtVencimento(data);
                         }catch(Exception e){
                            e.printStackTrace();
                         }
                        // seta o valor do cartao
                        pgCartao.setValor(Double.parseDouble(valor));
                        pgCartao.setCartaoCredito(cartao);
                        idsCartoes.add(pgCartao);
                         aux++;
                }
            }

            aux = 0;
            int qt = 1;
            boolean flgHouveAcrescimo;
            int idLivroAtual;
            int idLivroLista;
            // Recuperando os sIDS dos livros escolhidos pelo cliente
            if(idsLivro != null && idsLivro.length > 0){
                for(String idLivro: idsLivro){
                    flgHouveAcrescimo = false;
                    ItemPedido itemPedido = new ItemPedido();
                    itemPedido.getLivro().setId(Integer.parseInt(idLivro));
                    itemPedido.setQuantidade(qt);
                    idLivroAtual = itemPedido.getLivro().getId();
                    // Lista de item preenchida com o livro/id/qt
                    // Varrer a lista para descobrir se há algum repetido e incrementar a qtde

                    for(ItemPedido itemPed: item){
                        idLivroLista = itemPed.getLivro().getId();
                        if(idLivroLista == itemPedido.getLivro().getId()){
                            qt = itemPed.getQuantidade();
                            itemPedido.setQuantidade(qt + 1);
                            flgHouveAcrescimo = true;
                        }
                        aux++;
                    }
                    if(!flgHouveAcrescimo){
                        item.add(itemPedido);
                    }
                }            
                pedido.setItems(item);
                
            }
            
            
            
            
            
        pedido.getPagamento().setPagamentosCartao(idsCartoes);
        
       
        session.setAttribute("pedido", pedido);

        return pedido;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
             if(resultado != null && !resultado.getMensagem().isEmpty()) {
                    request.setAttribute("resultado", resultado);
                    if(resultado.getAcao() != null) {
                        if(resultado.getAcao().equals("listarPedidos")){
                            request.getRequestDispatcher("../adm/listar_pedidos.jsp").forward(request, response);
                        }else if(resultado.getAcao().equals("alterar")){
                         request.setAttribute("alterado", "status do pedido ");
                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                        }else if(resultado.getAcao().equals("inserir")){
                            request.setAttribute("acao", "pedido ");
                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                        
                        }else if(resultado.getAcao().equals("listarMeusPedidos")){
                            request.getRequestDispatcher("../Clientes/listar_meusPedidos.jsp").forward(request, response);
                        }else if(resultado.getAcao().equals("falhaInserir")){
                            request.getRequestDispatcher("../clienteBurlou.jsp").forward(request, response);

                    }
                    }else if(resultado.getAcao().equals("alterar")){
                         request.setAttribute("alterado", "status do pedido ");
                    }
             }else{
                    Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
                    request.setAttribute("pedido", pedido);
                    if(pedido.getPagamento().getValorTotal() != null && pedido.getEndereco().getClienteId()== null){
                        // valor total ja foi setado. Endereço ainda nao. então é hora de confirmar os dados de endereço.
                        request.getRequestDispatcher("confirmaEndereco.jsp").forward(request, response);
                    }else if(pedido.getPagamento().getCartao().getId() == null){
                        // o cartão de credito ainda não foi escolhido. hora de confirma-lo
                        request.getRequestDispatcher("../Pedidos/confirmaCartao.jsp").forward(request, response);

                  //  }else
                     //  request.setAttribute("acao", "pedido");
                       // request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
             }
             } 
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
}
