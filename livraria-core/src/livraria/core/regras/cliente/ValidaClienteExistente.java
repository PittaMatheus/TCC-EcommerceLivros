/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.cliente;

import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import livraria.core.regras.AbstractStrategy;
import java.util.List;
import livraria.core.controle.Fachada;

/**
 *
 * @author matheus
 */
public class ValidaClienteExistente extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        String str ="";
        boolean flgCpfExistente = false;
        boolean flgEmailExistente = false;
        Cliente cliente = (Cliente) entidade;
        Resultado resultado = new Resultado();
        Fachada fachada = new Fachada();
        resultado = fachada.consultar(cliente);
        // Objeto resultado foi preenchido com uma lista de resposta da query que verifica se 
        // O cpf ou Email ja esta cadastrado no banco
        List<Cliente> clientes = (List) resultado.getEntidades();
        if(clientes.isEmpty()) {
             str +="";
        } else {
            for (Cliente cli : clientes) {
                // Email digitado é igual ao email que vem do banco?
                if(cli.getEmail().equals(cliente.getEmail())){
                    flgEmailExistente = true;
                }
                if(cli.getCpf().equals(cliente.getCpf())){
                    flgCpfExistente = true;
                }
            }
            if(flgEmailExistente == true){
               str += "<li> O email ja esta em uso</li>";
            }
            if(flgCpfExistente == true){
                  str += "<li> O Cliente ja esta cadastrado</li>";
            }
        }
        
        return str;
    }
    
}
