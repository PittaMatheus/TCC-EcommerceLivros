/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.dominio;

import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.ICommand;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author matheus
 */
public class Perfil extends EntidadeDominio{
    Integer id;
    String nome;
    List<ICommand> funcionalidades = new ArrayList<ICommand>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<ICommand> getFuncionalidades() {
        return funcionalidades;
    }

    public void setFuncionalidades(List<ICommand> funcionalidades) {
        this.funcionalidades = funcionalidades;
    }
    
}
