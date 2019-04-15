/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author matheus
 */
public class ViewGrupoLivro implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        GrupoLivro grupoLivro = new GrupoLivro();
        String id = request.getParameter("id");
        String nome = request.getParameter("nomeGrupo");
        String margemLucro = request.getParameter("margemLucro");
        
        if(null != id){
            grupoLivro.setId(Integer.parseInt(id));
        }
        grupoLivro.setNome(nome);
        if(null != margemLucro){
            grupoLivro.setMargemLucro(Integer.parseInt(margemLucro));
        }
        return grupoLivro;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
       try {
            if(resultado != null && !resultado.getMensagem().isEmpty()) {
                request.setAttribute("resultado", resultado);
                if(resultado.getAcao().equals("inserir") ) {
                    request.setAttribute("acao", "inserção");
                    request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                    //response.sendRedirect("../sucesso.jsp");  
                }else if(resultado.getAcao().equals("alterar")){
                    request.setAttribute("acao", "alteração");
                    request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                }else if(resultado.getAcao().equals("listarGrupoLivro")){
                    request.getRequestDispatcher("listar_grupoPrecificacao.jsp").forward(request, response);
                }else if(resultado.getAcao().equals("preAlterarGrupo")){
                    request.getRequestDispatcher("preAlterarGrupoLivro.jsp").forward(request, response);
                }
                
                
            }
        }catch(Exception e) {
            e.printStackTrace();
            }
    }
    
}
