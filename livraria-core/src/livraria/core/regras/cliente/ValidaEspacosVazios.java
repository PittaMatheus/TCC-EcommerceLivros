/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.cliente;

import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.regras.AbstractStrategy;


/**
 *
 * @author matheus
 */
public class ValidaEspacosVazios extends AbstractStrategy {

    @Override
    public String validar(EntidadeDominio entidade) {
       String str = "";
       int idx;
       Cliente cliente = (Cliente) entidade;
       
       idx = cliente.getNome().indexOf(" ");
       if(idx != -1){
            str += "<li>O campo Nome não pode conter espaços em branco</li>";
       }
       idx = cliente.getSobrenome().indexOf(" ");
       if(idx != -1){
            str += "<li>O campo Sobrenome não pode conter espaços em branco</li>";
       }
       idx = cliente.getCpf().indexOf(" ");
       if(idx != -1){
            str += "<li>O campo CPF não pode conter espaços em branco</li>";
       }
       idx = cliente.getRg().indexOf(" ");
       if(idx != -1){
            str += "<li>O campo RG não pode conter espaços em branco</li>";
       }
       idx = cliente.getSenha().indexOf(" ");
       if(idx != -1){
            str += "<li>O campo Senha não pode conter espaços em branco</li>";
       }
       idx = cliente.getEmail().indexOf(" ");
       if(idx != -1){
           str += "<li>O campo email não pode conter espaços em branco</li>";
       }
       idx = cliente.getEndereco().getCep().indexOf(" ");
       if(idx != -1){
           str += "<li>O campo CEP não pode conter espaços em branco</li>";
       }
       idx = cliente.getEndereco().getNumero().indexOf(" ");
       if(idx != -1){
           str += "<li>O campo numero não pode conter espaços em branco</li>";
       }

       return str;
    }
    
}
