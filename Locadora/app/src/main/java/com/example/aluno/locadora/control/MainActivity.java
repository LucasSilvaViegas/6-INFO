package com.example.aluno.locadora.control;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.SearchView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.aluno.locadora.R;
import com.example.aluno.locadora.adapter.ListAdapter;
import com.example.aluno.locadora.model.Locadora;
import com.example.aluno.locadora.model.LocadoraBD;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.util.List;


public class MainActivity extends AppCompatActivity implements ActionBar.TabListener, SearchView.OnQueryTextListener, AdapterView.OnItemClickListener {

    private static final String TAG = "locadoras";
    private ListView lvLocadoras;
    private EditText etNome, etGenero, etClassificacao;
    private ImageView imvFoto;
    private LocadoraBD locadoraBD;
    private static final String GETALL = "getAll";
    private static final String GETBYNOME = "getbynome";
    private static final String SAVE = "save";
    private static final String DELETE = "delete";
    private static Locadora locadora;
    private String nameFind = "";
    ActionBar.Tab tab1, tab2; //uma das abas da activity, quando em smartphone
    private byte[] imagem = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        locadoraBD = LocadoraBD.getInstance(this);
        locadora = new Locadora();

        Log.d(TAG, "instancia de locadoraBD: " + locadoraBD.toString());

        if(isTablet(this)){
            setContentView(R.layout.activity_tablet);
            getSupportActionBar().setTitle(R.string.titulo_actionbar_list); //insere um título para a janela

            etNome = (EditText) findViewById(R.id.editText_nome);
            etGenero = (EditText) findViewById(R.id.editText_sobrenome);
            etClassificacao = (EditText) findViewById(R.id.editText_telefone);
            imvFoto = (ImageView) findViewById(R.id.imageView);
            lvLocadoras = (ListView) findViewById(R.id.listView);
            lvLocadoras.setOnItemClickListener(this); //adiciona a lista de ouvintes
            new Task().execute(GETALL); //executa a operação GET em segundo plano

        }else{
            //aqui infla a primeira tela do layout para smartphone e controla a navegabilidade entre as duas existentes
            getSupportActionBar().setNavigationMode(getSupportActionBar().NAVIGATION_MODE_TABS);
            getSupportActionBar().setTitle(R.string.titulo_actionbar_list);

            //tab1
            tab1 = getSupportActionBar().newTab().setText("Locadora");
            tab1.setTabListener(this);
            getSupportActionBar().addTab(tab1);

            //tab2
            tab2 = getSupportActionBar().newTab().setText("Adicionar Filme");
            tab2.setTabListener(this);
            getSupportActionBar().addTab(tab2);
        }

    }

    @Override
    public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft) {
        //Toast.makeText(MainActivity.this, "Você clicou na aba " + tab.getPosition(), Toast.LENGTH_SHORT).show();
        switch (tab.getPosition()){
            case 0:

                //mapeia os componentes da UI
                setContentView(R.layout.activity_smartphone_list);

                //insere um título na ActionBar
                getSupportActionBar().setTitle("FILMES");

                //mapeia os componentes de activity_list.xml
                lvLocadoras = (ListView) findViewById(R.id.listView);
                lvLocadoras.setOnItemClickListener(this);//registra o tratador de eventos para cada item da ListView

                new Task().execute(GETALL); //executa a operação GET em segundo plano

                break;

            case 1:

                //mapeia os componentes da UI; Título na action bar
                setContentView(R.layout.activity_smartphone_inputs);
                getSupportActionBar().setTitle("CADASTRAR FILMES");

                //mapeia os componentes de activity_inputs.xml
                etNome = (EditText) findViewById(R.id.editText_nome);
                etGenero = (EditText) findViewById(R.id.editText_sobrenome);
                etClassificacao = (EditText) findViewById(R.id.editText_telefone);
                imvFoto = (ImageView) findViewById(R.id.imageView);

                break;
        }
    }

    @Override
    public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction ft) {

    }

    @Override
    public void onTabReselected(ActionBar.Tab tab, FragmentTransaction ft) {

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        getMenuInflater().inflate(R.menu.menu_actionbar, menu);

        //configura o tratamento de eventos do SearchView
        SearchView searchview = (SearchView) menu.findItem(R.id.menuitem_search).getActionView();
        searchview.setQueryHint("Digite seu nome");
        searchview.setOnQueryTextListener(this);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item){

        switch (item.getItemId()){
            case R.id.menuitem_salvar:



                if(!etNome.getText().toString().isEmpty() && !etGenero.getText().toString().isEmpty() && !etClassificacao.getText().toString().isEmpty()) {
                    if(locadora._id == null){ //se é uma inclusão
                        locadora = new Locadora(); //apaga dados antigos
                    }
                    locadora.nome = etNome.getText().toString();
                    locadora.genero = etGenero.getText().toString();
                    locadora.rating = etClassificacao.getText().toString();
                    locadora.imagem = imagem;
                    Log.d(TAG, "Dados em locadora: " + locadora.toString());
                    new Task().execute(SAVE); //executa a operação CREATE em segundo plano
                    new Task().execute(GETALL); //executa a operação GET em segundo plano para atualizar a ListView
                } else {
                    Toast.makeText(MainActivity.this, "Preencha todos os campos.", Toast.LENGTH_SHORT).show();
                }
                break;


            case R.id.menuitem_cancelar:
                limparFormulario();
                break;

            case R.id.menuitem_excluir:
                if(locadora != null
                        && !etNome.getText().toString().isEmpty()
                        && !etGenero.getText().toString().isEmpty()
                        && !etClassificacao.getText().toString().isEmpty()){
                    new Task().execute(DELETE); //executa a operação DELETE em segundo plano
                    new Task().execute(GETALL); //executa a operação GET em segundo plano para atualizar a ListView
                }else{
                    Toast.makeText(MainActivity.this, "Selecione um filme na lista.", Toast.LENGTH_SHORT).show();
                }
                break;
        }
        return  true;
    }

    @Override
    public boolean onQueryTextSubmit(String query) {
        return false;
    }

    @Override
    public boolean onQueryTextChange(String newText) {

        if(!isTablet(MainActivity.this)) {
            tab1.select(); //seleciona a aba 1
            //onTabSelected(tab1, null); //chama o tratador de eventos para carregar os componentes
        }

        if(newText.equals("")){
            new Task().execute(GETALL);

        }else{
            new Task().execute(GETBYNOME); //executa a operação GET em segundo plano para atualizar a ListView
            nameFind = newText; //armazena em uma variável global para uso na task
        }

        return true;

    }

    private void limparFormulario(){
        etNome.setText(null);
        etGenero.setText(null);
        etClassificacao.setText(null);
        etNome.requestFocus();
        imvFoto.setImageResource(R.drawable.foto_sombra);
        imagem = null;
        locadora = new Locadora(); //apaga dados antigos
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        if(!isTablet(MainActivity.this)){
            tab2.select();
        }
        locadora = (Locadora) adapterView.getAdapter().getItem(i);
        etNome.setText(locadora.nome);
        etGenero.setText(locadora.genero);
        etClassificacao.setText(locadora.rating);
        etNome.requestFocus();
        if(locadora.imagem != null){
            imvFoto.setImageBitmap(BitmapFactory.decodeByteArray(locadora.imagem, 0, locadora.imagem.length));
        }

    }



    public void carregarListView(List<Locadora> locadoras){
        ListAdapter listAdapter = new ListAdapter(this, locadoras);
        lvLocadoras.setAdapter(listAdapter);
    }

    public void carregarImagem(View v){
        //cria uma Intent
        //primeiro argumento: ação ACTION_PICK "escolha um item a partir dos dados e retorne o seu URI"
        //segundo argumento: refina a ação para arquivos de imagem, retornando um URI
        Intent intent = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
        //inicializa uma Activity. Neste caso, uma que forneca acesso a galeria de imagens do dispositivo.
        startActivityForResult(Intent.createChooser(intent, "Selecione uma imagem"), 0);
    }

    /**
     * Método que recebe o retorno da Activity de galeria de imagens.
     */

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(resultCode == RESULT_OK){
            Uri arquivoUri = data.getData(); //obtém o URI da imagem
            Log.d(TAG, "URI da imgem: " + arquivoUri);
            Bitmap bitmap = null; //mapeia a imagem para um objeto bitmap

            try {
                bitmap = BitmapFactory.decodeStream(getContentResolver().openInputStream(arquivoUri));
                imvFoto.setImageURI(arquivoUri); //coloca a imagem no ImageView
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

            byte[] img = getBitmapAsByteArray(bitmap); //converte para um fluxo de bytes
            imagem = img; //coloca a imagem no objeto imagem (um array de bytes (byte[]))
        }
    }

    /**
     * Converte um Bitmap em um array de bytes (bytes[])
     * @param bitmap
     * @return byte[]
     */
    public static byte[] getBitmapAsByteArray(Bitmap bitmap) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream(); //criam um stream para ByteArray
        bitmap.compress(Bitmap.CompressFormat.PNG, 0, outputStream); //comprime a imagem
        return outputStream.toByteArray(); //retorna a imagem como um Array de Bytes (byte[])
    }


    /**
     * Detecção do tipo de screen size.
     * @param context contexto da Activity
     * @return boolean
     */
    private static boolean isTablet(Context context) {
        return (context.getResources().getConfiguration().screenLayout
                & Configuration.SCREENLAYOUT_SIZE_MASK)
                >= Configuration.SCREENLAYOUT_SIZE_LARGE;
    }

    /*
        Classe interna para realizar as transações no banco de dados
     */
    private class Task extends AsyncTask<String, Void, List<Locadora>> {

        long count = 0L; //para armazenar o retorno do salvar e do excluir

        //executa a task em outra Thread
        @Override
        protected List<Locadora> doInBackground(String... strings) {
            if(strings[0].equals(GETALL)){
                return locadoraBD.getAll(); //get
            }else{
                if(strings[0].equals(GETBYNOME)){
                    return locadoraBD.getByname(nameFind); //get
                }else{
                    if(strings[0].equals(SAVE)){
                        count = locadoraBD.save(MainActivity.locadora); //create e update
                    }else{
                        if(strings[0].equals(DELETE)){
                            count = locadoraBD.delete(MainActivity.locadora); //delete
                        }
                    }
                }
            }

            return null;
        }

        //atualiza a View
        @Override
        protected void onPostExecute(List<Locadora> locadoras) {
            if(locadoras != null){
                carregarListView(locadoras);
            }else if(count > 0){
                Toast.makeText(MainActivity.this, "Operação realizada.", Toast.LENGTH_SHORT).show();
                limparFormulario();
                if(!isTablet(MainActivity.this)) {
                    tab1.select(); //seleciona a aba 1
                   // onTabSelected(tab1, null); //chama o tratador de eventos para carregar os componentes
                }
                Log.d(TAG, "Operação realizada.");
            }else{
                Toast.makeText(MainActivity.this, "Erro ao atualizar o filme. Contate o desenvolvedor.", Toast.LENGTH_SHORT).show();
            }
        }
    }
}