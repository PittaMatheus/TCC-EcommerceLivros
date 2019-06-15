/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.pedido.Pedido;
import ecommerce.dominio.pedido.Troca;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewTroca implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Cliente cliente = new Cliente();
        Pedido pedido = new Pedido();
        Troca troca = new Troca();
        String id_cliente = request.getParameter("u");
        String id_pedido = request.getParameter("id_pedido");
        String status = request.getParameter("status");
        
        if(status != null){
            troca.setStatus(status);
        }        
        if(id_cliente != null){
            troca.getCliente().setId(Integer.parseInt(id_cliente));
        }
        if(id_pedido != null){
            troca.getPedido().setId(Integer.parseInt(id_pedido));
        }

        return troca;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
             if(resultado != null && !resultado.getMensagem().isEmpty()) {
                    request.setAttribute("resultado", resultado);
                    if(resultado.getAcao() != null) {
                        if(resultado.getAcao().equals("inserir")){
                            request.setAttribute("acao", "Solicitacao de troca");
                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                        }else if(resultado.getAcao().equals("listarSolicitacaoTroca")){
                            request.getRequestDispatcher("listar_SolicitacaoTrocas.jsp").forward(request, response);
                        }else if(resultado.getAcao().equals("CupomTrocaInserido")){
                            request.setAttribute("acao", "A geração do cupom de troca");
                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                        }else if(resultado.getAcao().equals("listarTroca")){
                            request.getRequestDispatcher("listar_trocas.jsp").forward(request, response);
                        }
                        
                        
                        
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }
    
}
