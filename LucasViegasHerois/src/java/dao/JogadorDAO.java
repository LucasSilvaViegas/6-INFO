/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.Conexao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import modelo.Jogador;

/**
 *
 * @author Lucas
 */
public class JogadorDAO {
    EntityManager em;
    
    public JogadorDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Jogador obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            //em.close();
            
        }
        
    }

     public List<Jogador> listar() throws Exception {
        return em.createNamedQuery("Jogador.findAll").getResultList();
    }
    
    public List<Jogador> listar(String filtro) throws Exception{
        return em.createNamedQuery("Jogador.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
    public Jogador buscarPorChavePrimaria(String codigo){
        return em.find(Jogador.class, codigo);
    }
    

    
    public void alterar(Jogador obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            //em.close();
        }
    }
    
    public void excluir(Jogador obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } finally {
            //em.close();
        }
    }

    public void fechaEmf() {
        Conexao.closeConexao();
    }
    

}
