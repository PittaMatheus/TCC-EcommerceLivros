/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.livro;

import ecommerce.dominio.livro.Categoria;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewCategoria implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Categoria categoria = new Categoria();
        String id = request.getParameter("id");
        String nomeCategoria = request.getParameter("nomeCategoria");
        if(null != id){
            categoria.setId(Integer.parseInt(id));
        }
        categoria.setNome(nomeCategoria);
        return categoria;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            if(resultado != null && !resultado.getMensagem().isEmpty()) {
                request.setAttribute("resultado", resultado);
                if(resultado.getAcao().equals("inserir")) {
                    request.setAttribute("acao", "inserção");
                    response.sendRedirect("../sucesso.jsp");  
                }else if(resultado.getAcao().equals("alterar")){
                    request.setAttribute("acao", "alteração");
                    request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                }else if(resultado.getAcao().equals("listarCategoria")){
                    request.getRequestDispatcher("listar_categorias.jsp").forward(request, response);
                }else if(resultado.getAcao().equals("consultar")){
                    request.getRequestDispatcher("preAlterarCategoria.jsp").forward(request, response);
                }
                
                
            }
        }catch(Exception e) {
            e.printStackTrace();
            }
    }
}
