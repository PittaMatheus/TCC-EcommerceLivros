/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.ItemPedido;
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
public class ViewItensPedido implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        String id_pedido = request.getParameter("p");
        ItemPedido itemPedido = new ItemPedido();
        itemPedido.getPedido().setId(Integer.parseInt(id_pedido));
        return itemPedido;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
         try {
             if(resultado != null && !resultado.getMensagem().isEmpty()) {
                    request.setAttribute("resultado2", resultado);
                    if(resultado.getAcao() != null) {
                        if(resultado.getAcao().equals("listar")){   
                            request.getRequestDispatcher("../Clientes/itensPedido.jsp").forward(request, response);
                        }
                    }
            }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }

    
}
