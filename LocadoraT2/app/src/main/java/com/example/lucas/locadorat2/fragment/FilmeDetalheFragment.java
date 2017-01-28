package com.example.lucas.locadorat2.fragment;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.activity.FilmeActivity;
import com.example.lucas.locadorat2.model.Locadora;

/**
 * Created by Lucas on 18/01/2017.
 */

public class FilmeDetalheFragment extends BaseFragment {

    public Locadora filme;
    private RadioButton rbComedia, rbTerror, rbAcao;
    private TextView etNome, etRating;
    private ImageView imageViewFoto;


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
        Log.d(TAG, "Dados do registro = " + filme);
        Log.d(TAG, "URL foto = " + filme.imagem);

        imageViewFoto = (ImageView) view.findViewById(R.id.imageView_DETALHE);

        if (filme.imagem != null) {
            imageViewFoto.setImageURI(Uri.parse(filme.imagem));
        }

        //MAPEAR GENERO DO FILME

        Log.d(TAG, "Genero = " + filme.genero);
        rbAcao = (RadioButton) view.findViewById(R.id.radioButtonAcaoDETALHE);
        rbComedia = (RadioButton) view.findViewById(R.id.radioButtonComediaDETALHE);
        rbTerror = (RadioButton) view.findViewById(R.id.radioButtonTerrorDETALHE);

        if (filme.genero.equals(getContext().getResources().getString(R.string.genero_acao))) {
            rbAcao.setChecked(true);
        } else if (filme.genero.equals(getContext().getResources().getString(R.string.genero_comedia))) {
            rbComedia.setChecked(true);
        } else {
            rbTerror.setChecked(true);
        }


        //MAPEAR NOME E CLASSIFICACAO
        Log.d(TAG, "Nome = " + filme.nome + "\nClassificacao = " + filme.rating);
        etNome = (TextView) view.findViewById(R.id.textView_nomedetalhe);
        etRating = (TextView) view.findViewById(R.id.textView_ratingDETALHE);
        etNome.setText(filme.nome);
        etRating.setText(filme.rating);


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
                //replaceFragment(R.id.fragment_container, fef);
                getActivity().getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container, fef).commit();
                break;
        }
        return true;
    }
}
