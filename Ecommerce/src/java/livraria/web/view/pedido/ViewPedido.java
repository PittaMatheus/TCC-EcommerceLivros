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
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.io.IOException;
import java.util.ArrayList;
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
        Livro objLivro = new Livro();
        Cliente objCliente = new Cliente();
        Pedido pedido = new Pedido();
        String id = request.getParameter("id_pedido");
        String id_cliente = request.getParameter("u");
        String tipoUsuario = request.getParameter("tipoUsuario");        
        String id_endereco = request.getParameter("id_endereco");
        String[] idsCartao = request.getParameterValues("id_cartao");
        String[] valoresCartao = request.getParameterValues("valorCartao");
       
        
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
                    aux++;
                    PagamentoCartaoCredito pgCartao = new PagamentoCartaoCredito();
                    Cartao cartao = new Cartao();
                    // Seto o id do cartao no objeto Cartao
                    cartao.setId(Integer.parseInt(idCartao));
                    // seta o valor do cartao
                    pgCartao.setValor(Double.parseDouble(valor));
                    pgCartao.setCartaoCredito(cartao);
                    idsCartoes.add(pgCartao);
            }

            
            
        }
        

        pedido.getPagamento().setPagamentosCartao(idsCartoes);
        
        HttpSession session = request.getSession();
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
