/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Endereco;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Telefone;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author matheus
 */
public class ViewCliente implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
          // INSTANCIA DOS DOMINIOS
        Telefone objTelefone = new Telefone();
        Endereco objEndereco = new Endereco();
        Cliente cliente = new Cliente();
        DateFormat formatadorData = new SimpleDateFormat("dd/mm/yyyy");
    try{

        List<Endereco> enderecos = new ArrayList<>();
        
        // RECEBE PARAMETROS DA JSP
        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        String status = request.getParameter("status");


        //CLIENTE
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String senha = request.getParameter("senha");
        String senhaConfirmada = request.getParameter("senhaConfirmada");        
        String sexo = request.getParameter("sexo");
        String email = request.getParameter("email");
        String dataNascimento = request.getParameter("data_nascimento");        
        String numTelefone = request.getParameter("numTelefone");
        String tipoTelefone = request.getParameter("TipoTelefone");

        // ENDERECO
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String tipoEndereco = request.getParameter("tipoEndereco");
        String tipoLogradouro = request.getParameter("tipoLogradouro");
        String nomeEndereco = request.getParameter("nomeEndereco");
        String complemento = request.getParameter("complemento");
        String numero = request.getParameter("numero");
        String pais = request.getParameter("pais");

        // SEPARANDO DDD DO TELEFONE
        String ddd = "123";
        numTelefone = "321321";
        if(id != null){
            cliente.setId(Integer.parseInt(id));
        }
        
        if(null != dataNascimento){
            Date data = formatadorData.parse(dataNascimento);
            cliente.setData_nascimento(data);
        }
        cliente.setNome(nome);
        cliente.setSobrenome(sobrenome);
        cliente.setCpf(cpf);
        cliente.setRg(rg);
        cliente.setRanking(50); // RANKING INICIAl COM 50
        cliente.setEmail(email);
        cliente.setSexo(sexo);
        cliente.setSenha(senha);
        cliente.setConfirmarSenha(senhaConfirmada);
        
        
        if(status != null && status.equals("0"))
            cliente.setStatus(false);
        else if(status != null && status.equals("1")){
            cliente.setStatus(true);
    }

        objEndereco.setBairro(bairro);
        objEndereco.setLogradouro(logradouro);
        objEndereco.setUf(uf);
        objEndereco.setTipoEndereco(tipoEndereco);
        objEndereco.setTipoLogradouro(tipoLogradouro);
        objEndereco.setCep(cep);
        objEndereco.setNomeEndereco(nomeEndereco);
        objEndereco.setNumero(numero);
        objEndereco.setCidade(cidade);
        objEndereco.setComplemento(complemento);
        objEndereco.setPais(pais);
        
        objTelefone.setNumero(numTelefone);
        objTelefone.setDdd(ddd);
        objTelefone.setTipo(tipoTelefone);
        
        cliente.setTelefone(objTelefone);
        cliente.setEndereco(objEndereco);
        
    }catch(Exception e){
        e.printStackTrace();
        
    }
    return cliente;
 }

    
    @Override
        public void setEntidade(Resultado resultado, HttpServletRequest request,HttpServletResponse response) 
			throws IOException {
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
                            else if(resultado.getAcao().equals("consultarCliente")){
                                request.getRequestDispatcher("preAlterar_cliente.jsp").forward(request, response);
                            }
                            else if(resultado.getAcao().equals("consultarEndereco")){
                                request.getRequestDispatcher("listar_endCobranca.jsp").forward(request, response);
                            }
                            else if(resultado.getAcao().equals("alterar")){
                                 request.setAttribute("acao", "alteração");
                                 request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                                 
                            }else if(resultado.getAcao().equals("desativar")){
                                 request.setAttribute("acao", "exclusão");
                                 request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                                 
                            }else if(resultado.getAcao().equals("listarDesativados")){
                                 request.getRequestDispatcher("listar_clientesInativos.jsp").forward(request, response);  
                                 
                            }else if(resultado.getAcao().equals("ativar")){
                                 request.setAttribute("acao", "ativação");
                                 request.getRequestDispatcher("../sucesso.jsp").forward(request, response);
                            }else if(resultado.getAcao().equals("falhaInserir")){
                                 request.getRequestDispatcher("cadastro_cliente.jsp").forward(request, response);
                            }else 
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