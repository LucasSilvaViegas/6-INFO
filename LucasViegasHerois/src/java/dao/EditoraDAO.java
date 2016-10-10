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
import modelo.Editora;

/**
 *
 * @author Lucas
 */
public class EditoraDAO {
    EntityManager em;
    
    public EditoraDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Editora obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
          em.close();
            
        }
        
    }

    
    public void alterar(Editora obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
    
    public void excluir(Editora obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public void fechaEmf() {
        Conexao.closeConexao();
    }
    
    
    
    public List<Editora> listar() throws Exception {
        return em.createNamedQuery("Editora.findAll").getResultList();
    }
    
    public List<Editora> listar(String filtro) throws Exception{
        return em.createNamedQuery("Editora.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
    public Editora buscarPorChavePrimaria(Integer codigo){
        return em.find(Editora.class, codigo);
    }
    
   
}
