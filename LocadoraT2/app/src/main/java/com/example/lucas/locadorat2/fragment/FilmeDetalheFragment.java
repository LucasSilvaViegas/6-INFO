package com.example.lucas.locadorat2.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.activity.FilmeActivity;
import com.example.lucas.locadorat2.model.Locadora;

/**
 * Created by Lucas on 18/01/2017.
 */

public class FilmeDetalheFragment extends BaseFragment {

    public Locadora filme;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        ((FilmeActivity) getActivity()).getSupportActionBar().setTitle(R.string.title_fragment_detalhecarro);
    }

    public void setFilme(Locadora filme){
        this.filme = filme;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_detalhefilme, container, false);

        return view;
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        inflater.inflate(R.menu.menu_fragment_detalhefilme, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menuitem_editar:
                //Toast.makeText(getContext(), "Editar", Toast.LENGTH_SHORT).show();
                FilmeEdicaoFragment fef = new FilmeEdicaoFragment();
                fef.setFilme(filme);
                replaceFragment(R.id.fragment_container, fef);
        }
        return true;
    }
}
