package com.example.lucas.locadorat2.service;

import com.example.lucas.locadorat2.model.Locadora;

import java.util.ArrayList;
import java.util.List;


public class FilmeServiceTeste {
    private static final String TAG = "FilmeServiceTeste";
    private static List<Locadora> filme_todos = new ArrayList<>();

    public static List<Locadora> getLocadoras(String tipo) {
        List<Locadora> filme = new ArrayList<>();
        if(!tipo.equals("Todos")){
            for (int i = 0; i < 20; i++) {
                Locadora c = new Locadora();
                c.nome = "Locadora " + tipo + ": " + i;
                c.genero = "Genero " + i;
                //c.urlFoto = R.drawable.car_background;
                filme.add(c);
            }
            filme_todos.addAll(filme);
            return filme;
        }

        return filme_todos;

    }
}