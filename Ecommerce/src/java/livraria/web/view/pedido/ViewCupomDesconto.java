/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Pedido;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewCupomDesconto implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Pedido pedido = new Pedido();
        if(null != session.getAttribute("pedido")){
            pedido = (Pedido)session.getAttribute("pedido");
        }
        String cupomDesconto = request.getParameter("cupomDesconto");
        if(cupomDesconto != null){
            pedido.getCupom().setCodigo(cupomDesconto);
        }

        return pedido;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try{
            if(resultado != null){
                double valorComDesconto = Double.valueOf(resultado.getMensagem());
                resultado.setMensagem("cupomAplicado");
                HttpSession session = request.getSession();
                Pedido pedido = new Pedido();
                pedido = (Pedido)session.getAttribute("pedido");
                double valorOriginal = pedido.getPagamento().getValorTotal();

                session.setAttribute("pedidoOriginal", valorOriginal);
                pedido.getPagamento().setValorTotal(valorComDesconto);
                session.setAttribute("aplicado", resultado);
                request.getRequestDispatcher("../Pedidos/confirmaCartao.jsp").forward(request, response);
            }
            else{
                HttpSession session = request.getSession();
                session.removeAttribute("aplicado");
                request.getRequestDispatcher("../Pedidos/confirmaCartao.jsp").forward(request, response);
                
            }
        }catch(Exception e) {
            e.printStackTrace();
            }

         
    }
    
}
