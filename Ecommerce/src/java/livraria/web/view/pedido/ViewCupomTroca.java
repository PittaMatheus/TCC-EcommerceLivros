/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.pedido.CupomTroca;
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
public class ViewCupomTroca implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        
        Cliente cliente = new Cliente();
        Pedido pedido = new Pedido();
        CupomTroca cTroca = new CupomTroca();
        String id_cliente = request.getParameter("u");
        String id_pedido = request.getParameter("id_pedido");
        String id_solicitacao = request.getParameter("id");
        String acao = request.getParameter("ac");
        
        if(acao != null && acao.equals("aprovar")){
            cTroca.setAcao("aprovar");
        }else if(acao != null && acao.equals("reprovar")){
            cTroca.setAcao("reprovar");
        }
        if(id_solicitacao != null){
            cTroca.setId(Integer.parseInt(id_pedido));
        }
        if(id_cliente != null){
            cTroca.getCliente().setId(Integer.parseInt(id_cliente));
        }
        if(id_pedido != null){
            cTroca.getPedido().setId(Integer.parseInt(id_pedido));
        }

        return cTroca;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
             if(resultado != null && !resultado.getMensagem().isEmpty()) {
                    request.setAttribute("resultado", resultado);
                    if(resultado.getAcao() != null) {
                        if(resultado.getAcao().equals("inserir")){
                            request.setAttribute("acao", "Autorizacao da troca");
                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                          }else if(resultado.getAcao().equals("listar")){
                              request.getRequestDispatcher("../Clientes/ListarCupomTroca.jsp").forward(request, response);
                          }else if(resultado.getAcao().equals("desativar")){
                              request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                          }
                        
                        
                        }
            }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }

    
}
