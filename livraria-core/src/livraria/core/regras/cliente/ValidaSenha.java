/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.cliente;


import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import ecommerce.dominio.Usuario;
import livraria.core.regras.AbstractStrategy;
import java.util.List;
import livraria.core.controle.Fachada;

/**
 *
 * @author matheus
 */
public class ValidaSenha extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        String str ="";
        Cliente cliente = (Cliente) entidade;
        Resultado resultado = new Resultado();

        Fachada fachada = new Fachada();
        
        resultado = fachada.consultar(cliente);
        List<Cliente> clientes = (List) resultado.getEntidades();
        if(clientes.isEmpty()) {
             str +="<li>Senha ou usuario invalidos</li>";
        } else {
             str +="";
             }
        return str;
    }
    
}
