/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.pedido.Pedido;
import java.io.IOException;
import javax.crypto.spec.IvParameterSpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import livraria.core.aplicacao.Resultado;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewPedido implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Livro objLivro = new Livro();
        Cliente objCliente = new Cliente();
        Pedido pedido = new Pedido();
        String id_cliente = request.getParameter("u");
        String id_endereco = request.getParameter("id_endereco");
        String id_cartao = request.getParameter("id_cartao");
        
        if(id_cliente != null ){
            pedido.getCliente().setId(Integer.parseInt(id_cliente));
        }
        if(id_endereco != null){
            pedido.getEndereco().setClienteId(Integer.parseInt(id_endereco));
        }
        
        if(id_cartao != null){
            pedido.getPagamento().getCartao().setId(Integer.parseInt(id_cartao));
        }
         HttpSession session = request.getSession();
        session.setAttribute("pedido", pedido);
        return pedido;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
			if(resultado != null && !resultado.getMensagem().isEmpty()) {
				request.setAttribute("resultado", resultado);
				if(resultado.getAcao() != null) {
                                    request.setAttribute("acao", "pedido");
					if(resultado.getAcao().equals("inserir"))
                                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
					
                                }
				}else {
                                    request.getRequestDispatcher("../Pedidos/confirmaCartao.jsp").forward(request, response);
                                
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
    
}
