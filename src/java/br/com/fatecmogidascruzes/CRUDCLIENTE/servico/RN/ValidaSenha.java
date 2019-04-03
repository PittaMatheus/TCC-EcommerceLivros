/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN;

import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandAutenticar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandConsultar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Usuario;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.AbstractStrategy;
import java.util.List;

/**
 *
 * @author matheus
 */
public class ValidaSenha extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        String str ="";
        Usuario usuario = (Usuario) entidade;
        Resultado resultado = new Resultado();
        CommandConsultar consultar = new CommandConsultar();
        resultado = consultar.executar(usuario);
        List<Cliente> clientes = (List) resultado.getEntidades();
        if(clientes.isEmpty()) {
             str +="<li>Senha ou usuario invalidos</li>";
        } else {
             for (Cliente cli : clientes) {
                // Email digitado e a senha são iguais ao email que vem do banco?
                if(cli.getEmail().equals(usuario.getLogin()) && cli.getSenha().equals(usuario.getSenha())){
                   str = "";
                }
            }
        }
  
        return str;
    }
    
}
