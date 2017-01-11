package com.example.lucas.locadorat2.fragment;

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

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.activity.FilmesActivity;

/**
 * Created by Lucas on 04/01/2017.
 */

public class FilmesFragment extends BaseFragment implements SearchView.OnQueryTextListener {

    private RecyclerView recyclerview;
    private LinearLayoutManager linearLayoutManager;

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
}
