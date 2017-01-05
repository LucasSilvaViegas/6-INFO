/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;

/**
 *
 * @author Lucas
 */
public class Carrinho {
    private List<Itemcarrinho> itens;
    private Double total;

    /**
     * @return the itens
     */
    public List<Itemcarrinho> getItens() {
        return itens;
    }

    /**
     * @param itens the itens to set
     */
    public void setItens(List<Itemcarrinho> itens) {
        this.itens = itens;
    }

    /**
     * @return the total
     */
    public Double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(Double total) {
        this.total = total;
    }
    
    
}
