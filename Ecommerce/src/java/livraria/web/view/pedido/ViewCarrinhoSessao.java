/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Carrinho;
import ecommerce.dominio.pedido.Item;
import ecommerce.dominio.pedido.ItemPedido;
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
        String acao = request.getParameter("a");
        objLivro.setId(Integer.parseInt(id_livro));
        objLivro.setAtivo(true);
        
        if(acao != null){
            HttpSession session = request.getSession();
            Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");  
            int i = 0;
              for(Item livroCarrinho: carrinho.getItens()){
                 int id = Integer.parseInt(id_livro);
                  if(livroCarrinho.getLivro().getId() == id){
                      if(acao.equals("a"))
                        livroCarrinho.setQuantidade(livroCarrinho.getQuantidade() + 1);
                      else if(acao.equals("r"))
                          livroCarrinho.setQuantidade(livroCarrinho.getQuantidade() - 1);
                      else if(acao.equals("l")){
                          carrinho.getItens().remove(i);
                          break;
                      }
                  }
                  i++;
              }       
            session.setAttribute("carrinho", carrinho);
        }
            
                
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
                        //Recupera o livro que está prestes a ser inserido no carrinho
                        List<Livro> livroADD = (List) resultado.getEntidades();
                        ItemPedido item = new ItemPedido();
                        item.setLivro(livroADD.get(0));
                        // loop para verificar se o mesmo ja esta no carrinho
                        String isbmCarrinho;
                        String isbmASerAdicionada;
                        int i = 0;
                        int indiceExistente = 0;
                        boolean flgTemNoCarrinho = false;
                       
                        if(carrinho.getItens().isEmpty()){
                            carrinho.addItens(item);
                            carrinho.getItens().get(i).setQuantidade(1);
                        }else{
                            for(Item livroCarrinho: carrinho.getItens()){
                                isbmCarrinho = livroCarrinho.getLivro().getIsbn().getCodBarras();
                                isbmASerAdicionada = item.getLivro().getIsbn().getCodBarras();
                                if(isbmCarrinho.equals(isbmASerAdicionada)){
                                    carrinho.getItens().get(i).setQuantidade(carrinho.getItens().get(i).getQuantidade() + 1);
                                    flgTemNoCarrinho = true;
                                }
                                i++;
                            }
                            if(!flgTemNoCarrinho){
                                item.setQuantidade(1);
                                carrinho.addItens(item);
                            }
                        }
                        session.setAttribute("carrinho", carrinho);
                        response.sendRedirect("../index.jsp");
                    }
                }else{
                    response.sendRedirect("carrinhoSessao.jsp");
                }

                
            }
            else{
                    response.sendRedirect("carrinhoSessao.jsp");
                }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }
}
