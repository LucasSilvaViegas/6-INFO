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
import modelo.Heroi;

/**
 *
 * @author Lucas
 */
public class HeroiDAO {

    EntityManager em;

    public HeroiDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }

    public void incluir(Heroi obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            //           em.close();

        }

    }

    public List<Heroi> listar() throws Exception {
        return em.createNamedQuery("Heroi.findAll").getResultList();
    }

    public List<Heroi> listar(String filtro) throws Exception {
        return em.createNamedQuery("Heroi.findFilter").setParameter("filtro", "%" + filtro.toLowerCase() + "%").getResultList();
    }

  
    
     public List<Heroi> listarRandom() throws Exception {
        return em.createNamedQuery("Heroi.aleatorio").getResultList();
                }

    public Heroi buscarPorChavePrimaria(Integer codigo) {
        return em.find(Heroi.class, codigo);
    }

    public void alterar(Heroi obj) throws Exception {

        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            //           em.close();
        }
    }

    public void excluir(Heroi obj) throws Exception {

        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } finally {
//            em.close();
        }
    }

//    public void fechaEmf() {
//        Conexao.closeConexao();
//    }
//    
//    
//    private void verificaConexao() throws Exception
//    {
//        if(!em.isOpen())
//        {
//             EntityManagerFactory emf;
//            emf = Conexao.getConexao();
//            em = emf.createEntityManager();
//        }
//    }
}
