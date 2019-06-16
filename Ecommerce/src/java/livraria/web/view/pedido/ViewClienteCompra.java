/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.pedido.Pedido;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewClienteCompra implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Cliente cliente = new Cliente();
        Pedido pedido = new Pedido();
        String senha = request.getParameter("senha");
        String email = request.getParameter("email");
        String valorTotal = request.getParameter("valorTotal");
        
        if(senha != null){
            cliente.setSenha(senha);
        }
        if(email != null){
            cliente.setEmail(email);
        }
        if(valorTotal != null){
            pedido.getPagamento().setValorTotal(Double.valueOf(valorTotal));
        }
        pedido.setCliente(cliente);
        HttpSession session = request.getSession();
        if(null != session.getAttribute("pedido")){
                pedido = (Pedido)session.getAttribute("pedido");
            }
        
        return cliente;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            if(resultado != null && !resultado.getMensagem().isEmpty()) {
                request.setAttribute("resultado", resultado);
                if(resultado.getAcao() != null) {
                    if(resultado.getAcao().equals("logar")){
                        HttpSession session = request.getSession();
                        session.setAttribute("usuarioLogado", resultado);
                        response.sendRedirect("Pedidos/confirmaEndereco.jsp");  
                    }  
                } else {
                    response.sendRedirect("../index.html");
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }   

    }

}
