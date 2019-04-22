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
public class ValidaCamposObrigatorios extends AbstractStrategy {

    @Override
    public String validar(EntidadeDominio entidade) {
        Cliente cliente = (Cliente) entidade;
            String str= "";
            if(cliente.getNome() == null || cliente.getNome().trim().length() == 0) {
                    str += "<li>Campo nome obrigatório</li>";
            }
            if(cliente.getSobrenome() == null || cliente.getSobrenome().trim().length() == 0) {
                    str += "<li>Campo sobrenome obrigatório</li>";
            }
            if(cliente.getCpf() == null || cliente.getCpf().trim().length() == 0) {
			str += "<li>Campo CPF obrigatório</li>";
            }
            if(cliente.getEmail() == null || cliente.getEmail().trim().length() == 0) {
			str += "<li>Campo email obrigatório</li>";
            }
             if(cliente.getRg()== null || cliente.getRg().trim().length() == 0) {
			str += "<li>Campo RG obrigatório</li>";
            }
              if(cliente.getEndereco().getLogradouro() == null || cliente.getEndereco().getLogradouro().trim().length() == 0) {
			str += "<li>Campo Logradouro obrigatório</li>";
            }
               if(cliente.getEndereco().getCidade() == null || cliente.getEndereco().getCidade().trim().length() == 0) {
			str += "<li>Campo cidade obrigatório</li>";
            }
                if(cliente.getEndereco().getBairro() == null || cliente.getEndereco().getBairro().trim().length() == 0) {
			str += "<li>Campo bairro obrigatório</li>";
            }
                
                 if(cliente.getEndereco().getUf() == null || cliente.getEndereco().getUf().trim().length() == 0) {
			str += "<li>Campo Estado obrigatório</li>";
            }
                 
                  if(cliente.getEndereco().getCep() == null || cliente.getEndereco().getCep().trim().length() == 0) {
			str += "<li>Campo CEP obrigatório</li>";
            }
                   if(cliente.getEndereco().getNumero() == null || cliente.getEndereco().getNumero().trim().length() == 0) {
			str += "<li>Campo numero obrigatório</li>";
            }
            return str;
    }
    
}
