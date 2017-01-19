package com.example.lucas.locadorat2.activity;

import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.v7.widget.Toolbar;

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.fragment.FilmeDetalheFragment;
import com.example.lucas.locadorat2.fragment.FilmeNovoFragment;

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
            replaceFragment(R.id.fragment_container, new FilmeDetalheFragment());
        }
    }
}
