/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.servico;

import br.com.fatecmogidascruzes.dominio.Cliente;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author matheus
 */
public class ViewLogin implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        String emailLogin = request.getParameter("usuarioLogin");
        String senha = request.getParameter("senha");

        Cliente cliente = new Cliente();
        cliente.setEmail(emailLogin);
        cliente.setSenha(senha);
        return cliente;
    }

    @Override
    public void setEntidade(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
