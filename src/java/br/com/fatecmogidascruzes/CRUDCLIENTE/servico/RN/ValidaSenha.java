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
        Cliente cliente = (Cliente) entidade;
        Resultado resultado = new Resultado();
        CommandConsultar consultar = new CommandConsultar();
        resultado = consultar.executar(cliente);
        List<Cliente> clientes = (List) resultado.getEntidades();
        if(clientes.isEmpty()) {
             str +="<li>Senha ou usuario invalidos</li>";
        } else {
             str +="<li>Senha e usuario validos</li>";
             }
        return str;
    }
    
}
