/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.estoque;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.estoque.Estoque;
import ecommerce.dominio.livro.Livro;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Set;
import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.core.aplicacao.Resultado;
import livraria.core.util.PrecoUtils;
import livraria.web.commands.CommandListar;
import livraria.web.commands.ICommand;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewEstoque implements IViewHelper{
    
    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Estoque estoque = new Estoque();
        ICommand commandListar = new CommandListar();
        Resultado resultado =  commandListar.executar(new Livro());
        List<EntidadeDominio> livros = resultado.getEntidades();
        
               
        String id = request.getParameter("id");
        String id_livro = request.getParameter("idLivro");
        String id_fornecedor = request.getParameter("idFornecedor");
        String nomeFornecedor = request.getParameter("txtFornecedor");
        String cnpjFornecedor = request.getParameter("txtCnpj");
        String razaoSocialFornecedor = request.getParameter("txtRazaoSocial");
        String quantidade = request.getParameter("txtQuantidade");
        
        if(id != null && !id.trim().isEmpty()){
            estoque.setId(Integer.parseInt(id));
        }
        
        if(id_livro != null && !id_livro.trim().isEmpty()){
            estoque.getItem().getLivro().setId(Integer.parseInt(id_livro));
        }
        
        if(id_fornecedor != null && !id_fornecedor.trim().isEmpty()){
            estoque.getItem().getFornecedor().setId(Integer.parseInt(id_fornecedor));
        }
        
        if(nomeFornecedor != null && !nomeFornecedor.trim().isEmpty()){
            estoque.getItem().getFornecedor().setNome(nomeFornecedor);
        }else{
            estoque.getItem().getFornecedor().setNome(null);
        }
        
        if(cnpjFornecedor != null && !cnpjFornecedor.trim().isEmpty()){
            estoque.getItem().getFornecedor().setCnpj(cnpjFornecedor);
        }else{
            estoque.getItem().getFornecedor().setCnpj(null);
        }
        
        if(razaoSocialFornecedor != null && !razaoSocialFornecedor.trim().isEmpty()){
            estoque.getItem().getFornecedor().setRazaoSocial(razaoSocialFornecedor);
        }else{
            estoque.getItem().getFornecedor().setRazaoSocial(null);
        }
        
        if(quantidade != null && !quantidade.trim().isEmpty()){
            estoque.getItem().setQuantidade(Integer.valueOf(quantidade));
        }else{
            estoque.getItem().setQuantidade(null);
        }
        
        for(EntidadeDominio liv: livros){
            Livro l = (Livro) liv;
            if(l.getId().equals(estoque.getItem().getLivro().getId())){
                String preco = String.valueOf(l.getPreco());
                estoque.getItem().setCusto(Float.valueOf(preco));
            }
        }
        
        return estoque;
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
                        request.getRequestDispatcher("entrada_estoqueLivro.jsp").forward(request, response);
                    }else if(resultado.getAcao().equals("listarEstoque")){
                        request.getRequestDispatcher("listar_estoqueLivros.jsp").forward(request, response);
                    }else if(resultado.getAcao().equals("alterarEstoque")){
                        request.getRequestDispatcher("preAlterar_estoqueLivro.jsp").forward(request, response);
                    }else if(resultado.getAcao().equals("alterar")){
                        request.setAttribute("acao", "alteração");
                        request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                    }else if(resultado.getAcao().equals("falhaAlterar")){
                        request.getRequestDispatcher("preAlterar_estoqueLivro.jsp").forward(request, response);
                    }
                } 
            }
        }catch(Exception e){
            e.printStackTrace();  
        }
    }

    
    
}