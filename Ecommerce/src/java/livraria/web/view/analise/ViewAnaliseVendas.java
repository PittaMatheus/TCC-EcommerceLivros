/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.analise;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.analise.Analise;
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
public class ViewAnaliseVendas implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Analise analise = new Analise();
        String grafico = request.getParameter("grafico");
        if(grafico != null){
            analise.setGrafico(grafico);
        }
        return analise;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
             if(resultado != null && !resultado.getMensagem().isEmpty()) {
                    request.setAttribute("resultado", resultado);
                    if(resultado.getAcao() != null) {
                        if(resultado.getAcao().equals("analiseVenda")){   
                            request.getRequestDispatcher("analise.jsp").forward(request, response);
                        }
                    }
            }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }
    
}
