/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.cliente;

import ecommerce.dominio.EntidadeDominio;
import java.util.Date;

/**
 *
 * @author matheus
 */
public class Cartao extends EntidadeDominio {
    private String nome;
    private Integer id;
    private String numeroCartao;
    private String codSeguranca;
    private Date dtVencimento;
    private Bandeira bandeira;
    private Cliente cliente;
    private boolean status;
    
    public Cartao(String numeroCartao, String nome,  Date dtVencimento, String codSeguranca, Bandeira bandeira, boolean status, Integer id) {
    super();
    this.numeroCartao = numeroCartao;
    this.nome = nome;
    this.dtVencimento = dtVencimento;
    this.codSeguranca = codSeguranca;    
    this.bandeira = bandeira;
    this.status = status;
    this.id = id;
    }
    
    public Cartao(){
            cliente = new Cliente();
            bandeira = new Bandeira();

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    
    
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
    public String getNumeroCartao() {
            return numeroCartao;
    }
    public void setNumeroCartao(String numeroCartao) {
            this.numeroCartao = numeroCartao;
    }

    public String getCodSeguranca() {
            return codSeguranca;
    }
    public void setCodSeguranca(String codSeguranca) {
            this.codSeguranca = codSeguranca;
    }
    public Date getDtVencimento() {
            return dtVencimento;
    }
    public void setDtVencimento(Date dtVencimento) {
            this.dtVencimento = dtVencimento;
    }
    public Bandeira getBandeira() {
            return bandeira;
    }
    public void setBandeira(Bandeira bandeira) {
            this.bandeira = bandeira;
    }

    public String getNome() {
            return nome;
    }

    public void setNome(String nome) {
            this.nome = nome;
    }

    public Cliente getCliente() {
            return cliente;
    }

    public void setCliente(Cliente cliente) {
            this.cliente = cliente;
    }
    
}
