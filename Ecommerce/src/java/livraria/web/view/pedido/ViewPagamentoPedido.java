/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Pagamento;
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewPagamentoPedido implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        String id_pedido = request.getParameter("p");
        String cupom = request.getParameter("cupom");
        
        PagamentoCartaoCredito pgto = new PagamentoCartaoCredito();
      
        if(id_pedido != null){
            pgto.setId(Integer.parseInt(id_pedido));
        }
        if(cupom != null){
            pgto.setAcao("cupom");
        }
        return pgto;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
             if(resultado != null && !resultado.getMensagem().isEmpty()) {
                    request.setAttribute("resultado2", resultado);
                    if(resultado.getAcao() != null) {
                        if(resultado.getAcao().equals("listar")){
                              request.getRequestDispatcher("../adm/listar_pagamento.jsp").forward(request, response);
                          }else if(resultado.getAcao().equals("listarCupomDesconto")){
                            request.getRequestDispatcher("../adm/CupomDescontoPagamento.jsp").forward(request, response);

                          }
                    }
            }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }

    
}
