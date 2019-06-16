/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.livro;

import ecommerce.dominio.livro.Categoria;
import ecommerce.dominio.livro.Dimensoes;
import ecommerce.dominio.livro.Editora;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.GrupoLivro;
import ecommerce.dominio.livro.ISBN;
import ecommerce.dominio.livro.Livro;
import livraria.core.aplicacao.Resultado;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewLivro implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Livro livro = new Livro();
        ISBN isbn = new ISBN();
        GrupoLivro grupoLivro = new GrupoLivro();
        Editora editora = new Editora();
        Dimensoes dimensoes = new Dimensoes();
         
        // RECEBE PARAMETROS DA JSP
        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        String id_editora = request.getParameter("id_editora");
        String status = request.getParameter("status");
        List<Categoria> categoriasLivro = new ArrayList<>();
        
        
        
        String id_isbn = request.getParameter("id_isbn");
        String id_dimensoes = request.getParameter("id_dimensoes");
        String codigo = request.getParameter("txtCodigo");
        String autor = request.getParameter("txtAutor");
        String titulo = request.getParameter("txtTitulo");
        String ano = request.getParameter("txtAno");
        String edicao = request.getParameter("txtEdicao");
        String numPaginas = request.getParameter("txtNumPaginas");
        String sinopse = request.getParameter("txtSinopse");
        String nomeEditora = request.getParameter("txtEditora");
        String[] idsCategoria = request.getParameterValues("categoria");
        String altura = request.getParameter("txtAltura");
        String largura = request.getParameter("txtLargura");
        String peso = request.getParameter("txtPeso");
        String profundidade = request.getParameter("txtProfundidade");
        String codigoIsbn = request.getParameter("txtIsbn");
        String idGrupoLivro = request.getParameter("grupoLivro");
        String preco = request.getParameter("txtPreco");    
        String menu = request.getParameter("menu");
        if(null != menu && menu.equals("ok")){
            livro.setAcao("menu");
        }else if(null != menu && menu.equals("n")){
            livro.setAcao("home");
        }
        
        
        if(status!= null && status.equals("1"))
            livro.setAtivo(true);
        else
            livro.setAtivo(false);

        if(id != null && !id.trim().isEmpty())	
            livro.setId(Integer.parseInt(id));

        
        if(id_dimensoes != null && !id_dimensoes.trim().isEmpty())	
            dimensoes.setId(Integer.parseInt(id_dimensoes));
        
        
        if(id_isbn != null && !id_isbn.trim().isEmpty())	
            isbn.setId(Integer.parseInt(id_isbn));
        
        livro.setCodigoBarras(codigo);
        livro.setAutor(autor);
        livro.setTitulo(titulo);
        livro.setAno(ano);
        livro.setEdicao(edicao);
        livro.setNumeroPaginas(numPaginas);
        livro.setSinopse(sinopse);

        if(preco != null && !preco.trim().isEmpty() && !preco.equals("null")){
            livro.setPreco(Double.valueOf(preco));
        }else{
            livro.setPreco(null);
        }

        if(id_editora != null){
            editora.setId(Integer.parseInt(id_editora));
        }
        editora.setNome(nomeEditora);
        livro.setEditora(editora);

       
        if(altura != null && !altura.trim().isEmpty() && !altura.equals("null")){
            dimensoes.setAltura(Double.valueOf(altura));
        }else{
            dimensoes.setAltura(null);
        }

        if(largura != null && !largura.trim().isEmpty() && !largura.equals("null")){
            dimensoes.setLargura(Double.valueOf(largura));
        }else{
            dimensoes.setLargura(null);
        }

        if(peso != null && !peso.trim().isEmpty() && !peso.equals("null")){
            dimensoes.setPeso(Double.valueOf(peso));
        }else{
            dimensoes.setPeso(null);
        }

        if(profundidade != null && !profundidade.trim().isEmpty() && !profundidade.equals("null")){
            dimensoes.setProfundidade(Double.valueOf(profundidade));
        }else{
            dimensoes.setProfundidade(null);
        }

        livro.setDimensoes(dimensoes);
        isbn.setCodBarras(codigoIsbn);
        livro.setIsbn(isbn);

        
        if(idsCategoria != null && idsCategoria.length > 0){
                for(String idCategoria: idsCategoria){
                        Categoria categoria = new Categoria();
                        categoria.setId(Integer.parseInt(idCategoria));
                        categoriasLivro.add(categoria);
                }
        }
        livro.setCategorias(categoriasLivro);
        
        if(idGrupoLivro != null && !idGrupoLivro.isEmpty()){
            grupoLivro.setId(Integer.parseInt(idGrupoLivro));
        }else{
            grupoLivro.setId(0);
        }
        livro.setGrupoLivro(grupoLivro);

        return livro;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
                try {
                    if(resultado != null && !resultado.getMensagem().isEmpty()) {
                        request.setAttribute("resultado", resultado);
                        if(resultado.getAcao() != null) {
                            if(resultado.getAcao().equals("inserir")){
                                request.setAttribute("acao", "inserção");
                                request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("falhaInserir")){
                                request.setAttribute("mensagem", resultado.getMensagem());
                                request.getRequestDispatcher("cadastro_livro.jsp").forward(request, response);
                            }
                            else if(resultado.getAcao().equals("listarLivros")){
                                request.getRequestDispatcher("listar_livros.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("alterarLivro")){
                                request.getRequestDispatcher("preAlterar_livro.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("alterar")){
                                request.setAttribute("acao", "alteração");
                                request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("desativar")){
                                request.setAttribute("acao", "desativação");
                                request.getRequestDispatcher("../sucesso.jsp").forward(request, response);    
                            }else if(resultado.getAcao().equals("listarLivrosInativos")){
                                request.getRequestDispatcher("listar_livrosInativos.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("ativar")){
                                request.setAttribute("acao", "ativação");
                                request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("consultar")){
                                request.getRequestDispatcher("preAlterar_livro.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("listarIndex")){
                                request.getRequestDispatcher("../index.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("listarHome")){
                                request.getRequestDispatcher("../Clientes/home.jsp").forward(request, response);
                            }
                        } 
                    }
                }catch(Exception e){
                    e.printStackTrace();  
                }

    }
}
                      
    
