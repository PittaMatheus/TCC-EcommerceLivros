/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Dimensoes;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Editora;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.ISBN;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author matheus
 */
public class ViewLivro implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Livro livro = new Livro();
        
        // RECEBE PARAMETROS DA JSP
        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        
        
        String idLivro = request.getParameter("txtIdLivro");
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

        if(status!= null && status.equals("1"))
            livro.setAtivo(true);
        else
            livro.setAtivo(false);

        if(idLivro != null && !idLivro.trim().isEmpty())	
            livro.setId(Integer.parseInt(idLivro));

        livro.setCodigoBarras(codigo);
        livro.setAutor(autor);
        livro.setTitulo(titulo);
        livro.setAno(ano);
        livro.setEdicao(edicao);
        livro.setNumeroPaginas(numPaginas);
        livro.setSinopse(sinopse);

        if(preco != null)
            livro.setPreco(Double.valueOf(preco));

        Editora editora = new Editora();
        editora.setNome(nomeEditora);
        //editora.setId(id_editora);
        livro.setEditora(editora);

        Dimensoes dimensoes = new Dimensoes();
        if(altura != null && !altura.trim().isEmpty())
            dimensoes.setAltura(Double.valueOf(altura));

        if(largura != null && !largura.trim().isEmpty())
            dimensoes.setLargura(Double.valueOf(largura));

        if(peso != null && !peso.trim().isEmpty())
            dimensoes.setPeso(Double.valueOf(peso));

        if(profundidade != null && !profundidade.trim().isEmpty())
            dimensoes.setProfundidade(Double.valueOf(profundidade));

        livro.setDimensoes(dimensoes);

        ISBN isbn = new ISBN();
        isbn.setCodBarras(codigoIsbn);
        livro.setIsbn(isbn);

        List<Categoria> categoriasLivro = new ArrayList<>();
        if(idsCategoria != null && idsCategoria.length > 0){
                for(String idCategoria: idsCategoria){
                        Categoria categoria = new Categoria();
                        categoria.setId(Integer.parseInt(idCategoria));
                        categoriasLivro.add(categoria);
                }
        }
        livro.setCategorias(categoriasLivro);
        
        GrupoLivro grupoLivro = new GrupoLivro();
        
        if(idGrupoLivro != null && !idGrupoLivro.isEmpty())
            grupoLivro.setId(Integer.parseInt(idGrupoLivro));
        
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
                            }
                            else if(resultado.getAcao().equals("listarCliente")){
                                request.getRequestDispatcher("listar_clientes.jsp").forward(request, response);
                            }    
                        } 
                    }
                }catch(Exception e){
                    e.printStackTrace();  
                }

    }
}
                      
    
