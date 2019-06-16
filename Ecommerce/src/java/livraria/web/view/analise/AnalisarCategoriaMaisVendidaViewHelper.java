/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.analise;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.analise.AnaliseCategoriaMaisVendida;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author bocao
 */
public class AnalisarCategoriaMaisVendidaViewHelper implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        AnaliseCategoriaMaisVendida analise = new AnaliseCategoriaMaisVendida();
        String dtInicio = request.getParameter("txtDtInicio");
        String dtFim = request.getParameter("txtDtFim");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            if(!dtInicio.isEmpty())
                analise.setDtInicio(sdf.parse(dtInicio));

            if(!dtFim.isEmpty())
                analise.setDtFim(sdf.parse(dtFim));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return analise;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try{
            if(resultado != null && !resultado.getMensagem().isEmpty()) {
                request.setAttribute("resultado", resultado);
                if(resultado.getAcao() != null){
                    if(resultado.getAcao().equals("listar")){
                        request.getRequestDispatcher("analise_categoriaMaisVendida.jsp").forward(request, response);
                        
                    }else if(resultado.getAcao().equals("falhaListar")){
                        request.getRequestDispatcher("analise_categoriaMaisVendida.jsp").forward(request, response);
                    }
                }else{
                    response.sendRedirect("/Clientes/home.jsp");
                }
            } else {
                response.sendRedirect("/Clientes/home.jsp");
            }

            
        }catch(IOException e){
            e.printStackTrace();
        }catch(ServletException e){
            e.printStackTrace();
        }
    }
    
}