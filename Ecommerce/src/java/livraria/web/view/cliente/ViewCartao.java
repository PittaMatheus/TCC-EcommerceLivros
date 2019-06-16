/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.cliente;

import ecommerce.dominio.cliente.Bandeira;
import ecommerce.dominio.cliente.Cartao;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus
 */
public class ViewCartao implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        // DOminios
        Cartao cartao = new Cartao();
        Bandeira bandeira = new Bandeira();
        Cliente cliente = new Cliente();
        DateFormat formatadorData = new SimpleDateFormat("yyyy-MM-dd");
        // PARAMETROS DA JSP
        String id_cliente = request.getParameter("id");
        String numCartao = request.getParameter("numeroCartao");
        String dtVencimento = request.getParameter("dtVencimento");
        String codSeguranca = request.getParameter("codSeguranca");
        String nomeCartao = request.getParameter("nomeCartao");
        String idBandeira = request.getParameter("bandeira");
        String conf = request.getParameter("conf");
        
        // Preenche objeto cartao
        if(id_cliente != null){
           cartao.getCliente().setId(Integer.parseInt(id_cliente));
        }
        
        
        if(conf != null){
            cartao.setStatus(false);
        }else
            cartao.setStatus(true);
        
        cartao.setNumeroCartao(numCartao);
        
        try{
            if(null != dtVencimento){
                Date data = formatadorData.parse(dtVencimento);
                cartao.setDtVencimento(data);
            }    
        }catch(Exception e){
            e.printStackTrace();

        }
       
        cartao.setNome(nomeCartao);
        cartao.setCodSeguranca(codSeguranca);
        cartao.setNome(nomeCartao);
        
        if(idBandeira != null && !idBandeira.isEmpty()){
            bandeira.setId(Integer.parseInt(idBandeira));
        }else{
            bandeira.setId(0);
        }
        cartao.setBandeira(bandeira);
        
        return cartao;
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
                                        }else if(resultado.getAcao().equals("listar")){
                                            request.getRequestDispatcher("listar_cartoes.jsp").forward(request, response);
                                        }else if(resultado.getAcao().equals("desativar")){
                                            request.setAttribute("acao", "exclusão");
                                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                                        } else if(resultado.getAcao().equals("confirma")){
                                            request.getRequestDispatcher("../Pedidos/confirmaCartao.jsp").forward(request, response);
                                        }else 
						
                                            request.getRequestDispatcher("../index.jsp").forward(request, response);
				} else {
                                    response.sendRedirect("../index.jsp");

				}
                                
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
    }
    

