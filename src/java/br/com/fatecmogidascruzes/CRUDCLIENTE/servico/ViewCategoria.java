/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        categoria.setId(Integer.parseInt(id));
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
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
            }
    }
}
