/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.web.view;

import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author matheus
 */
public interface IViewHelper {
    public EntidadeDominio getEntidade(HttpServletRequest request);
    public void setEntidade(Resultado resultado,HttpServletRequest request,HttpServletResponse response) throws IOException;
}

