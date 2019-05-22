/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Carrinho;
import java.io.IOException;
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
public class ViewCarrinhoSessao implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Livro objLivro = new Livro();
        String id_livro = request.getParameter("l");
        objLivro.setId(Integer.parseInt(id_livro));
        objLivro.setAtivo(true);
        return objLivro;
        
        
        
        
        
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            if(resultado != null && !resultado.getMensagem().isEmpty()) {
                HttpSession session = request.getSession();
                Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
                // se não existe, cria-se
                if(carrinho == null){
                    //cria um carrinho 
                    carrinho = new Carrinho();
                    session.setAttribute("carrinho", carrinho);
                }
                request.setAttribute("resultado", resultado);
                if(resultado.getAcao() != null) {
                    if(resultado.getAcao().equals("consultar")){
                        // sessão de mensagem
                        session.setAttribute("mensagem", "O livro foi adicionado ao carrinho");
                        
                        List<Livro> livros = (List) resultado.getEntidades();
                        carrinho.setLivros(livros);
                        carrinho.addLivro(livros.get(0));
                        session.setAttribute("carrinho", carrinho);
                        response.sendRedirect("../index.jsp");
                    }
                }

                
            }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }
}
