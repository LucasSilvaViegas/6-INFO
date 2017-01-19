package com.example.lucas.locadorat2.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.activity.FilmeActivity;
import com.example.lucas.locadorat2.activity.FilmesActivity;
import com.example.lucas.locadorat2.adapter.FilmesAdapter;
import com.example.lucas.locadorat2.model.Locadora;
import com.example.lucas.locadorat2.service.FilmeServiceTeste;

import java.util.List;

/**
 * Created by Lucas on 04/01/2017.
 */

public class FilmesFragment extends BaseFragment implements SearchView.OnQueryTextListener {

    private RecyclerView recyclerview;
    private LinearLayoutManager linearLayoutManager;
    private List<Locadora> filmes;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setHasOptionsMenu(true);
        ((FilmesActivity) getActivity()).getSupportActionBar().setTitle(R.string.titulo_fragmentcarros);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_filmes, container, false);
        recyclerview = (RecyclerView) view.findViewById(R.id.recyclerview_fragmentfilmes);
        linearLayoutManager = new LinearLayoutManager(getActivity());

        recyclerview.setLayoutManager(linearLayoutManager);
        recyclerview.setItemAnimator(new DefaultItemAnimator());
        recyclerview.setHasFixedSize(true);

        filmes = FilmeServiceTeste.getLocadoras(getResources().getString(R.string.genero_todos));
        FilmesAdapter adapter = new FilmesAdapter(getContext(), filmes, onClick());
        recyclerview.setAdapter(adapter);

        return view;

    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.menu_fragment_filmes, menu);

        SearchView searchview = (SearchView) menu.findItem(R.id.menuitem_pesquisar).getActionView();
        searchview.setOnQueryTextListener(this);
        searchview.setQueryHint(getString(R.string.hint_pesquisar));
    }

    @Override
    public boolean onQueryTextSubmit(String query) {
        return false;
    }

    @Override
    public boolean onQueryTextChange(String newText) {
        return false;
    }

    protected FilmesAdapter.LocadoraOnClickListener onClick() {

        return new FilmesAdapter.LocadoraOnClickListener() {
            @Override
            public void onClickLocadora(View view, int idx) {
                //Toast.makeText(getContext(), "clicou", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(getContext(), FilmeActivity.class);
                intent.putExtra("qualFragmentAbrir", "FilmeDetalheFragment");
                startActivity(intent);
            }
        };
    }
}
