/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.servico;

import br.com.fatecmogidascruzes.dominio.Bandeira;
import br.com.fatecmogidascruzes.dominio.Cartao;
import br.com.fatecmogidascruzes.dominio.Cliente;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        // PARAMETROS DA JSP
        String idCliente = request.getParameter("id");
        String numCartao = request.getParameter("numeroCartao");
        String dtVencimento = request.getParameter("dtVencimento");
        String codSeguranca = request.getParameter("codSeguranca");
        String nomeCartao = request.getParameter("nomeCartao");
        String idBandeira = request.getParameter("bandeira");
        
        
        // Preenche objeto cartao
        cartao.setNumeroCartao(numCartao);
        cartao.setDtVencimento(dtVencimento);
        cartao.setNome(nomeCartao);
        cartao.setCodSeguranca(codSeguranca);
        cartao.setNome(nomeCartao);
        bandeira.setNome(idBandeira);
        cartao.setBandeira(bandeira);
        cartao.getCliente().setId(Integer.parseInt(idCliente));
        
       

        
        
        return cartao;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {	
			request.setAttribute("resultado" ,resultado);
			if(resultado.getAcao() != null) {
                            System.out.println("teste1");    
                            response.sendRedirect("index.html");
			} else {
                            System.out.println("teste12");    
                            response.sendRedirect("index.html");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
    }
    

