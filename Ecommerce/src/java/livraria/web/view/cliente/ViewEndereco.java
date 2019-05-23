/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view.cliente;

import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import livraria.web.view.IViewHelper;

/**
 *
 * @author matheus 
 */
public class ViewEndereco implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        Endereco endereco = new Endereco();
        // Recebe o ID do cliente que deseja inserir o endereço de cobrança
        String id = request.getParameter("id");
        
        if(id != null){
            endereco.setClienteId(Integer.parseInt(id));
        }
        
        // Se o parametro conf for recebido. A listagem será liberado um botão de confirmar endereço para a compra
        
        String conf = request.getParameter("conf");
        
        // ENDERECO
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String tipoLogradouro = request.getParameter("tipoLogradouro");
        String nomeEndereco = request.getParameter("nomeEndereco");
        String complemento = request.getParameter("complemento");
        String numero = request.getParameter("numero");
        String pais = request.getParameter("pais");
        String referencia = request.getParameter("referencia");
        
        
        if(conf != null){
            endereco.setStatus(false);
        }else
            endereco.setStatus(true);
        
        endereco.setBairro(bairro);
        endereco.setLogradouro(logradouro);
        endereco.setUf(uf);
        endereco.setTipoLogradouro(tipoLogradouro);
        endereco.setCep(cep);
        endereco.setNomeEndereco(nomeEndereco);
        endereco.setNumero(numero);
        endereco.setCidade(cidade);
        endereco.setComplemento(complemento);
        endereco.setPais(pais);
        endereco.setReferencia(referencia);
        

        return endereco;
    }

    
    
    @Override
	public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		try {
			if(resultado != null && !resultado.getMensagem().isEmpty()) {
				request.setAttribute("resultado", resultado);
				if(resultado.getAcao() != null) {
                                        request.setAttribute("acao", "inserção");
					if(resultado.getAcao().equals("inserir"))
                                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                                        else if(resultado.getAcao().equals("listar")){
                                            request.getRequestDispatcher("listar_endereco.jsp").forward(request, response);
                                        }else if(resultado.getAcao().equals("listarEndereco")){
                                            request.getRequestDispatcher("preAlterarEndereco.jsp").forward(request, response);
                                        }else if(resultado.getAcao().equals("alterar")){
                                            request.setAttribute("acao", "alteração");
                                            request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                                        }else if(resultado.getAcao().equals("confirma")){
                                            request.getRequestDispatcher("../Pedidos/confirmaEndereco.jsp").forward(request, response);
                                        }
					else 
						//request.getRequestDispatcher("index.html").forward(request, response);
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
