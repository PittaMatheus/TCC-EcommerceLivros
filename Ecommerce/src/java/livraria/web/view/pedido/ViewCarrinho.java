package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Carrinho;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewCarrinho implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Livro objLivro = new Livro();
        Cliente objCliente = new Cliente();
        Carrinho carrinho = new Carrinho();
        List<Livro> livros = new ArrayList<>();
        
        String id_livro = request.getParameter("l");
        String id_cliente = request.getParameter("u");

        if(id_livro != null){
            objLivro.setId(Integer.parseInt(id_livro));
        }
        if(id_cliente != null){
            objCliente.setId(Integer.parseInt(id_cliente));
        }
        if(objCliente != null){
            carrinho.setCliente(objCliente);
        }
        if(objLivro != null){
            carrinho.setLivro(objLivro);
        }

        
        return carrinho;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            if(resultado != null && !resultado.getMensagem().isEmpty()) {
                request.setAttribute("resultado", resultado);
                if(resultado.getAcao() != null) {
                    if(resultado.getAcao().equals("inserir")){
                        request.getRequestDispatcher("../Livros/prateleira.jsp").forward(request, response);
                    }else if(resultado.getAcao().equals("consultar")){
                        request.getRequestDispatcher("../Pedidos/carrinho.jsp").forward(request, response);
                    }else if(resultado.getAcao().equals("desativar")){
                        request.setAttribute("acao", "remoção do carrinho");
                        request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                    }else if(resultado.getAcao().equals("falhaInserir")){     
                       request.getRequestDispatcher("../Livros/prateleira.jsp").forward(request, response);
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
            }
    }
    
}
