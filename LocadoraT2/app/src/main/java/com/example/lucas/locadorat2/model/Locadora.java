package com.example.lucas.locadorat2.model;

import java.io.Serializable;

/**
 * Created by aluno on 24/08/16.
 */
public class Locadora implements Serializable{
    private static final long serialVersionUID = 1L;


    public Long _id;
    public String nome;
    public String genero;
    public String rating;
    public String imagem;

    @Override
    public String toString() {
        return "Locadora{" +
                "_id=" + _id +
                ", nome='" + nome + '\'' +
                ", genero='" + genero + '\'' +
                ", rating='" + rating + '\'' +
                ", imagem='" + imagem + '\'' +
                '}';
    }
}
