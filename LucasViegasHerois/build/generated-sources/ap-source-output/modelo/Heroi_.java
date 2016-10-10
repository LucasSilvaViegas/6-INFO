package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Categoria;
import modelo.Editora;
import modelo.Equipe;
import modelo.Regiao;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-06-07T08:47:57")
@StaticMetamodel(Heroi.class)
public class Heroi_ { 

    public static volatile SingularAttribute<Heroi, Integer> projecaoenergia;
    public static volatile SingularAttribute<Heroi, Integer> codigo;
    public static volatile SingularAttribute<Heroi, Integer> velocidade;
    public static volatile SingularAttribute<Heroi, Integer> resistencia;
    public static volatile SingularAttribute<Heroi, Integer> inteligencia;
    public static volatile SingularAttribute<Heroi, Categoria> categoria;
    public static volatile SingularAttribute<Heroi, String> nome;
    public static volatile SingularAttribute<Heroi, Integer> habilidadecombate;
    public static volatile ListAttribute<Heroi, Equipe> equipeList;
    public static volatile SingularAttribute<Heroi, Regiao> regiao;
    public static volatile SingularAttribute<Heroi, Editora> editora;
    public static volatile SingularAttribute<Heroi, String> codinome;
    public static volatile SingularAttribute<Heroi, String> descricao;
    public static volatile SingularAttribute<Heroi, String> foto;
    public static volatile SingularAttribute<Heroi, Integer> forca;

}