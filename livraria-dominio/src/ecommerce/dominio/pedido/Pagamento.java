/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cartao;
import ecommerce.dominio.pedido.Cupom;

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
	private Cupom cupom;
	//private List<CupomTroca> cuponsTroca;
	private Double valorTotal;
	private List<PagamentoCartaoCredito> pagamentosCartao;
        private PagamentoCartaoCredito pgtoCartaoCredito;
        
        public Pagamento(){
            cartao = new Cartao();
            cupom = new Cupom();
            this.pgtoCartaoCredito = new PagamentoCartaoCredito();
                  }

   // public Pedido getPedido() {
   //     return pedido;
  //  }



        
    public Cartao getCartao() {
        return cartao;
    }
       
   // public void setPedido(Pedido pedido) {
   //     this.pedido = pedido;
   // }
    
    public Cupom getCupom() {
        return cupom;
    }

    public void setCupom(Cupom cupom) {
        this.cupom = cupom;
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

    public PagamentoCartaoCredito getPgtoCartaoCredito() {
        return pgtoCartaoCredito;
    }

    public void setPgtoCartaoCredito(PagamentoCartaoCredito pgtoCartaoCredito) {
        this.pgtoCartaoCredito = pgtoCartaoCredito;
    }
    
    
    
}
