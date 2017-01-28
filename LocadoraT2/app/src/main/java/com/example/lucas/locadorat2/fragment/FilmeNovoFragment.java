package com.example.lucas.locadorat2.fragment;

import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
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
import com.example.lucas.locadorat2.activity.FilmesActivity;
import com.example.lucas.locadorat2.model.Locadora;
import com.example.lucas.locadorat2.service.LocadoraServiceBD;

/**
 * Created by Lucas on 18/01/2017.
 */

public class FilmeNovoFragment extends BaseFragment {

    private Locadora filme;
    private RadioButton rbComedia, rbAcao, rbTerror;
    private EditText editTextNome;
    private EditText editTextRating;
    private ImageView imageViewFoto;

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

        //Cria uma instancia da classe de modelo
        filme = new Locadora();

        //mapeia e inicializa os componentes da UI
        //Card0
        imageViewFoto = (ImageView) view.findViewById(R.id.fr_novofilme_imagem);
        imageViewFoto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                startActivityForResult(Intent.createChooser(intent, "Selecione uma imagem"), 0);
            }
        });

        //Card1
        rbAcao = (RadioButton) view.findViewById(R.id.radioButtonAcaoNOVO);
        rbAcao.setChecked(true);
        rbComedia = (RadioButton) view.findViewById(R.id.radioButtonComediaNOVO);
        rbTerror = (RadioButton) view.findViewById(R.id.radioButtonTerrorNOVO);
        //Card2
        editTextNome = (EditText) view.findViewById(R.id.etNome_card2_fragmentnovo);
        editTextRating = (EditText) view.findViewById(R.id.etClassificacao_card2_fragmentnovo);

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
        inflater.inflate(R.menu.menu_fragment_novofilme, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menuitem_salvar: {
                if (!editTextNome.getText().toString().isEmpty()) {
                    filme.nome = editTextNome.getText().toString();
                    filme.rating = editTextRating.getText().toString();
                    
                    if (rbAcao.isChecked()) {
                        filme.genero = getContext().getResources().getString(R.string.genero_acao);
                    } else if (rbComedia.isChecked()) {
                        filme.genero = getContext().getResources().getString(R.string.genero_comedia);
                    } else {
                        filme.genero = getContext().getResources().getString(R.string.genero_terror);
                    }
                    new Task().execute();
                }
                break;
            }
            case android.R.id.home:
                getActivity().finish();
                break;
        }

        return false;
    }

    private class Task extends AsyncTask<Void, Void, Long>{

        @Override
        protected Long doInBackground(Void... params) {
            return LocadoraServiceBD.getInstance(getContext()).save(filme);
        }

        @Override
        protected void onPostExecute(Long aLong) {
            super.onPostExecute(aLong);
            if(aLong > 0){
                FilmeNovoFragment.this.alertOk(R.string.alert_title_resultadodaoperacao, R.string.alert_message_realizadacomsucesso);
            } else {
                FilmeNovoFragment.this.alertOk(R.string.alert_title_resultadodaoperacao, R.string.alert_message_erroaorealizaroperacao);
            }
        }
    }

}
