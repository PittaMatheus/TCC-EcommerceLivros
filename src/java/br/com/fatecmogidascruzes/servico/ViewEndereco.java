/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.servico;

import br.com.fatecmogidascruzes.dominio.Endereco;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                                        }
					else 
						//request.getRequestDispatcher("index.html").forward(request, response);
                                            request.getRequestDispatcher("../index.html").forward(request, response);
				} else {
                                    response.sendRedirect("../index.html");

				}
                                
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
