/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.cliente.Endereco;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author matheus
 */
public class Pedido extends EntidadeDominio{
    private Cliente cliente;
    private List<ItemPedido> items;
    private Endereco endereco;
    private Pagamento pagamento;
    private Date dtPedido;
    private StatusPedido statusPedido;
	
	public Pedido() {
                cliente = new Cliente();
                endereco = new Endereco();
                statusPedido = new StatusPedido();
		Pagamento pagamento = new Pagamento();
		List<PagamentoCartaoCredito> pagamentos = new ArrayList<PagamentoCartaoCredito>();
		pagamento.setPagamentosCartao(pagamentos);
		this.setPagamento(pagamento);
	}

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public List<ItemPedido> getItems() {
        return items;
    }

    public void setItems(List<ItemPedido> items) {
        this.items = items;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Pagamento getPagamento() {
        return pagamento;
    }

    public void setPagamento(Pagamento pagamento) {
        this.pagamento = pagamento;
    }

    public Date getDtPedido() {
        return dtPedido;
    }

    public void setDtPedido(Date dtPedido) {
        this.dtPedido = dtPedido;
    }

    public StatusPedido getStatusPedido() {
        return statusPedido;
    }

    public void setStatusPedido(StatusPedido statusPedido) {
        this.statusPedido = statusPedido;
    }
    
}
