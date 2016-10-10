package dao;

import dao.Conexao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import modelo.Categoria;

public class CategoriaDAO {
    EntityManager em;
    
    public CategoriaDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Categoria obj) throws Exception {
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

    public List<Categoria> listar() throws Exception {
        return em.createNamedQuery("Categoria.findAll").getResultList();
    }
    
    public List<Categoria> listar(String filtro) throws Exception{
        return em.createNamedQuery("Categoria.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
    public Categoria buscarPorChavePrimaria(Integer codigo){
        return em.find(Categoria.class, codigo);
    }
    
    public void alterar(Categoria obj) throws Exception {
        
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
    
    public void excluir(Categoria obj) throws Exception {
        
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
    

}
