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
        String nomeCategoria = request.getParameter("nomeCategoria");
        categoria.setNome(nomeCategoria);
        return categoria;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            if(resultado != null && !resultado.getMensagem().isEmpty()) {
                request.setAttribute("resultado", resultado);
                if(resultado.getAcao() != null) {
                    request.setAttribute("acao", "inserção");
                    response.sendRedirect("../sucesso.jsp");  
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
            }
    }
}
