/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cartao;

/**
 *
 * @author matheus
 */
public class PagamentoCartaoCredito extends EntidadeDominio{
    private Cartao cartaoCredito;
    private Double valor;

    public Cartao getCartaoCredito() {
        return cartaoCredito;
    }

    public void setCartaoCredito(Cartao cartaoCredito) {
        this.cartaoCredito = cartaoCredito;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }
    
    
    
}
