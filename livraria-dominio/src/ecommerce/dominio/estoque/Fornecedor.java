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
    
    private String nome;
    private String cnpj;
    private String razaoSocial;
    
    public Fornecedor(String nome, String cnpj, String razaoSocial){
        this.nome = nome;
        this.cnpj = cnpj;
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

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }
    
        
    
}