package com.example.lucas.locadorat2.fragment;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.widget.SwipeRefreshLayout;
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
import com.example.lucas.locadorat2.service.LocadoraServiceBD;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Lucas on 04/01/2017.
 */

public class FilmesFragment extends BaseFragment implements SearchView.OnQueryTextListener {

    private RecyclerView recyclerview;
    private LinearLayoutManager linearLayoutManager;
    private List<Locadora> filmes;
    private LocadoraServiceBD locadoraServiceBD;
    private String genero;
    private SwipeRefreshLayout refresh;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setHasOptionsMenu(true);
        ((FilmesActivity) getActivity()).getSupportActionBar().setTitle(R.string.titulo_fragmentcarros);

        locadoraServiceBD = LocadoraServiceBD.getInstance(getContext());

        genero = (String) getArguments().get("genero");
    }

    @Override
    public void onResume() {
        super.onResume();
        new Task().execute();
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

        //filmes = FilmeServiceTeste.getLocadoras(getResources().getString(R.string.genero_todos));


        //SWIPE REFRESH LAYOUT

        refresh = (SwipeRefreshLayout) view.findViewById(R.id.F5);
        refresh.setOnRefreshListener(OnRefreshListener());
        refresh.setColorSchemeResources(R.color.refresh_progress_1, R.color.refresh_progress_2, R.color.refresh_progress_3);


        return view;

    }

    private SwipeRefreshLayout.OnRefreshListener OnRefreshListener() {
        return new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                new Task().execute();
            }

        };
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
        List<Locadora> filmeList = new ArrayList<>();

        for (Locadora filme : filmes) {
            if (filme.nome.contains(newText)) {
                filmeList.add(filme);
            }
        }

        FilmesAdapter adapter = new FilmesAdapter(getContext(), filmeList, onClick());
        recyclerview.setAdapter(adapter);
        return true;
    }

    protected FilmesAdapter.LocadoraOnClickListener onClick() {

        return new FilmesAdapter.LocadoraOnClickListener(){
            @Override
            public void onClickLocadora(View view, int idx) {
                //Toast.makeText(getContext(), "clicou", Toast.LENGTH_SHORT).show();
                Locadora filme = filmes.get(idx);
                Intent intent = new Intent(getContext(), FilmeActivity.class);
                intent.putExtra("qualFragmentAbrir", "FilmeDetalheFragment");
                intent.putExtra("filme", filme);
                startActivity(intent);
            }
        };
    }

    private class Task extends AsyncTask<Void, Void, List<Locadora>> {

        @Override
        protected List<Locadora> doInBackground(Void... params) {
            if (FilmesFragment.this.genero.equals(getString(R.string.tabs_terror))) {
                return locadoraServiceBD.getBygenero(getString(R.string.tabs_terror));
            } else if (FilmesFragment.this.genero.equals(getString(R.string.tabs_comedia))) {
                return locadoraServiceBD.getBygenero(getString(R.string.tabs_comedia));
            } else if (FilmesFragment.this.genero.equals(getString(R.string.tabs_acao))) {
                return locadoraServiceBD.getBygenero(getString(R.string.tabs_acao));
            } else if (FilmesFragment.this.genero.equals(getString(R.string.tabs_todos))) {
                return locadoraServiceBD.getAll();
            }
            return null;

        }

        @Override
        protected void onPostExecute(List<Locadora> locadoras) {
            super.onPostExecute(locadoras);

            FilmesFragment.this.filmes = locadoras;

            FilmesAdapter adapter = new FilmesAdapter(getContext(), filmes, onClick());
            recyclerview.setAdapter(adapter);

            refresh.setRefreshing(false);
        }
    }
}
