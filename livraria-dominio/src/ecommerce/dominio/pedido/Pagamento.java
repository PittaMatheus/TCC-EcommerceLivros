/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cartao;
import java.util.Date;
import java.util.List;

/**
 *
 * @author matheus
 */
public class Pagamento extends EntidadeDominio {
        private Integer id;
        private Date dtPagamento;
        private Cartao cartao;
	//private Cupom cupom;
	//private List<CupomTroca> cuponsTroca;
	private Double valorTotal;
	private List<PagamentoCartaoCredito> pagamentosCartao;
        
        
        public Pagamento(){
            cartao = new Cartao();
        }

    public Cartao getCartao() {
        return cartao;
    }

    public void setCartao(Cartao cartao) {
        this.cartao = cartao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    
        
    public Date getDtPagamento() {
        return dtPagamento;
    }

    public void setDtPagamento(Date dtPagamento) {
        this.dtPagamento = dtPagamento;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public List<PagamentoCartaoCredito> getPagamentosCartao() {
        return pagamentosCartao;
    }

    public void setPagamentosCartao(List<PagamentoCartaoCredito> pagamentosCartao) {
        this.pagamentosCartao = pagamentosCartao;
    }
    
}
