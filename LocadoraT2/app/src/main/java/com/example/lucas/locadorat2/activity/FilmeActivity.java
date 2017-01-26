package com.example.lucas.locadorat2.activity;

import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.fragment.FilmeDetalheFragment;
import com.example.lucas.locadorat2.fragment.FilmeNovoFragment;
import com.example.lucas.locadorat2.model.Locadora;

/**
 * Created by Lucas on 04/01/2017.
 */

public class FilmeActivity extends BaseActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_filme);

        String msg = (String) getIntent().getCharSequenceExtra("qualFragmentAbrir");
        if(msg.equals("FilmeNovoFragment")){
            replaceFragment(R.id.fragment_container, new FilmeNovoFragment());
        }else if(msg.equals("FilmeDetalheFragment")){
            FilmeDetalheFragment fdf = new FilmeDetalheFragment();
            replaceFragment(R.id.fragment_container, fdf);
            Locadora filme = (Locadora) getIntent().getSerializableExtra("filme");
            Log.d(TAG, "Objeto filme recebido: " + filme.toString());
            fdf.setFilme(filme);
        }
    }
}
