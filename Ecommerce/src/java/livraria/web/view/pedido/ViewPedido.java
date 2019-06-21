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
import ecommerce.dominio.pedido.Carrinho;
import ecommerce.dominio.pedido.ItemPedido;
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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

            List <ItemPedido> item = new ArrayList<>();
            String id = request.getParameter("id_pedido");
            String id_cliente = request.getParameter("u");
            String tipoUsuario = request.getParameter("tipoUsuario");        
            String id_endereco = request.getParameter("id_endereco");
            String[] idsCartao = request.getParameterValues("id_cartao");
            String[] valoresCartao = request.getParameterValues("valorCartao");
            String[] datasValidade = request.getParameterValues("dataValidade");
            String [] idsLivro = request.getParameterValues("livros");
            String [] qtItem = request.getParameterValues("qt");

            
            DateFormat formatadorData = new SimpleDateFormat("dd/MM/yyyy");
            String cupomDesconto = request.getParameter("cupomDesconto");
            String valorTotal =request.getParameter("valorTotal");
            String status = request.getParameter("status");
            List<PagamentoCartaoCredito> idsCartoes = new ArrayList<>();
            if(tipoUsuario != null){
                pedido.setTipo(tipoUsuario);
            }

            if(cupomDesconto != null){
                pedido.getCupom().setCodigo(cupomDesconto);
           }
            
            
            if(valorTotal != null){
                pedido.getPagamento().setValorTotal(Double.valueOf(valorTotal));
            }
            if(id_cliente != null ){
                pedido.getCliente().setId(Integer.parseInt(id_cliente));
            }
            if(id_endereco != null){
                pedido.getEndereco().setId(Integer.parseInt(id_endereco));
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

                     if(session.getAttribute("carrinho") != null){
                        Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
                        item = carrinho.getItens();
                        pedido.setItems(item);
                    }else{
                        pedido.setItems(item); 
  
                     }
                                          
           
                
        if(session.getAttribute("carrinho") != null){
                        Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
                        item = carrinho.getItens();
                        pedido.setItems(item);
        }else{
            
            
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
                            //request.getRequestDispatcher("../clienteBurlou.jsp").forward(request, response);
                    }
                        else if(resultado.getAcao().equals("descontoValidado")){
                            request.getRequestDispatcher("../confirmaCartao.jsp").forward(request, response);
                            
                        }
                    }else if(resultado.getAcao().equals("alterar")){
                         request.setAttribute("alterado", "status do pedido ");
                    }
             }else{
                    Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
                    request.setAttribute("pedido", pedido);
                    Resultado cliente = (Resultado) request.getSession().getAttribute("usuarioLogado");
                    if(cliente != null){
                        if(pedido.getPagamento().getValorTotal() != null && pedido.getEndereco().getId()== null){
                            // valor total ja foi setado. Endereço ainda nao. então é hora de confirmar os dados de endereço.
                            request.getRequestDispatcher("confirmaEndereco.jsp").forward(request, response);
                        }else if(pedido.getPagamento().getCartao().getId() == null){
                            // o cartão de credito ainda não foi escolhido. hora de confirma-lo
                            request.getRequestDispatcher("../Pedidos/confirmaCartao.jsp").forward(request, response);
                        }
                    }else
                        response.sendRedirect("../login.jsp");

             
             } 
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
}
