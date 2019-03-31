/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.dominio;

import java.util.Date;

/**
 *
 * @author matheus
 */
public class Cartao extends EntidadeDominio {
    private String nome;    
    private String numeroCartao;
    private String codSeguranca;
    private String dtVencimento;
    private Bandeira bandeira;
    private Cliente cliente;
        
    
    public Cartao(String numeroCartao, String nome,  String dtVencimento, String codSeguranca, Bandeira bandeira) {
    super();
    this.numeroCartao = numeroCartao;
    this.nome = nome;
    this.dtVencimento = dtVencimento;
    this.codSeguranca = codSeguranca;    
    this.bandeira = bandeira;
    }
    
    public Cartao(){
            cliente = new Cliente();
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
	public String getDtVencimento() {
		return dtVencimento;
	}
	public void setDtVencimento(String dtVencimento) {
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
