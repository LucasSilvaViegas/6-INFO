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
import com.example.lucas.locadorat2.activity.FilmesActivity;

/**
 * Created by Lucas on 18/01/2017.
 */

public class FilmeNovoFragment extends BaseFragment {

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        ((FilmeActivity) getActivity()).getSupportActionBar().setTitle(R.string.title_fragment_novocarro);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_novofilme, container, false);

        return view;
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        inflater.inflate(R.menu.menu_fragment_novofilme, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menuitem_salvar:
                Toast.makeText(getContext(), "salvo", Toast.LENGTH_SHORT).show();
        }
        return true;
    }
}
