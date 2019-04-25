/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.estoque;

import ecommerce.dominio.EntidadeDominio;

/**
 *
 * @author matheus
 */
public class Fornecedor extends EntidadeDominio{
    Integer id;
    private String nome;
    private String cpnj;
    private String razaoSocial;
    
    public Fornecedor(String nome, String cpnj, String razaoSocial, Integer id){
        this.nome = nome;
        this.cpnj = cpnj;
        this.razaoSocial = razaoSocial;
    }
    
    public Fornecedor(){
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpnj() {
        return cpnj;
    }

    public void setCpnj(String cpnj) {
        this.cpnj = cpnj;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }
    
    @Override
    public Integer getId() {
        return id;
    }
    @Override
    public void setId(Integer id) {
        this.id = id;
    }
    
    
}
