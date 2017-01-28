package com.example.lucas.locadorat2.fragment;

import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
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
import android.widget.Toast;

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.activity.FilmeActivity;
import com.example.lucas.locadorat2.model.Locadora;
import com.example.lucas.locadorat2.service.FilmeServiceTeste;
import com.example.lucas.locadorat2.service.LocadoraServiceBD;

/**
 * Created by Lucas on 24/01/2017.
 */

public class FilmeEdicaoFragment extends BaseFragment {
    private Locadora filme;
    private final String SAVE = "save";
    private final String DELETE = "delete";
    private LocadoraServiceBD lsbd;


    //Compontentes para mapear

    private RadioButton rbComedia, rbTerror, rbAcao;
    private EditText etNome, etRating;
    private ImageView imageViewFoto;


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        ((FilmeActivity) getActivity()).getSupportActionBar().setTitle(R.string.title_fragment_edicaocarro);
        lsbd = LocadoraServiceBD.getInstance(getContext());
    }

    public void setFilme(Locadora filme) {
        this.filme = filme;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_edicao, container, false);

        Log.d(TAG, "Dados do registro = " + filme);
        Log.d(TAG, "URL foto = " + filme.imagem);

        imageViewFoto = (ImageView) view.findViewById(R.id.imageView_EDICAO);

        if (filme.imagem != null) {
            imageViewFoto.setImageURI(Uri.parse(filme.imagem));
        }

        imageViewFoto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                startActivityForResult(Intent.createChooser(intent, "Selecione uma imagem"), 0);
            }
        });

        //MAPEAR GENERO DO FILME

        Log.d(TAG, "Genero = " + filme.genero);
        rbAcao = (RadioButton) view.findViewById(R.id.radioButtonAcaoEDICAO);
        rbComedia = (RadioButton) view.findViewById(R.id.radioButtonComediaEDICAO);
        rbTerror = (RadioButton) view.findViewById(R.id.radioButtonTerrorEDICAO);

        if (filme.genero.equals(getContext().getResources().getString(R.string.genero_acao))) {
            rbAcao.setChecked(true);
        } else if (filme.genero.equals(getContext().getResources().getString(R.string.genero_comedia))) {
            rbComedia.setChecked(true);
        } else {
            rbTerror.setChecked(true);
        }


        //MAPEAR NOME E CLASSIFICACAO
        Log.d(TAG, "Nome = " + filme.nome + "\nClassificacao = " + filme.rating);
        etNome = (EditText) view.findViewById(R.id.etNome_card2_fragmentedicao);
        etRating = (EditText) view.findViewById(R.id.etClassificacao_card2_fragmentedicao);
        etNome.setText(filme.nome);
        etRating.setText(filme.rating);

        return view;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == getActivity().RESULT_OK) {
            Log.d(TAG, data.toString());
            Uri arquivoUri = data.getData();
            Log.d(TAG, "URI do arquivo: " + arquivoUri);

            if (arquivoUri.toString().contains("images")) {
                imageViewFoto.setImageURI(arquivoUri);
                filme.imagem = arquivoUri.toString();
            }
        }
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        inflater.inflate(R.menu.menu_fragment_edicaofilme, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menuitem_salvar:
                Toast.makeText(getContext(), "Salvo", Toast.LENGTH_SHORT).show();

                filme.nome = etNome.getText().toString();
                filme.rating = etRating.getText().toString();

                if (rbAcao.isChecked()) {
                    filme.genero = getContext().getResources().getString(R.string.genero_acao);
                } else if (rbTerror.isChecked()) {
                    filme.genero = getContext().getResources().getString(R.string.genero_terror);
                } else {
                    filme.genero = getContext().getResources().getString(R.string.genero_comedia);
                }
                new Task().execute(SAVE);
                break;
            case R.id.menuitem_excluir:
                new Task().execute(DELETE);
                break;
            case android.R.id.home:
                getActivity().finish();
                break;
        }
        return true;
    }

    private class Task extends AsyncTask<String, Void, Long>{

        @Override
        protected Long doInBackground(String... params) {
            if(params[0].equals(SAVE)){
                return lsbd.save(filme);
            } else if(params[0].equals(DELETE)) {
                return lsbd.delete(filme);
            }
            return 0L;
        }

        @Override
        protected void onPostExecute(Long aLong) {
            super.onPostExecute(aLong);
            if(aLong > 0){
                FilmeEdicaoFragment.this.alertOk(R.string.alert_title_resultadodaoperacao, R.string.alert_message_realizadacomsucesso);
            }
        }
    }


}
