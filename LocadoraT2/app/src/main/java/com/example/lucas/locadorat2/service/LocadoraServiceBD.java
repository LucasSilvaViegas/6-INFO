
package com.example.lucas.locadorat2.service;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.AsyncTask;
import android.util.Log;

import com.example.lucas.locadorat2.model.Locadora;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by aluno on 31/08/16.
 */
public class LocadoraServiceBD extends SQLiteOpenHelper {

    private static final String TAG = "locadoras";
    private static final String NAME = "locadora.sqlite";
    private static final int VERSION = 1;
    private static LocadoraServiceBD locadoraServiceBD = null;

    private LocadoraServiceBD(Context context) {
        super(context, NAME, null, VERSION);
        //getWritableDatabase();
    }

    public static LocadoraServiceBD getInstance(Context context) {
        if (locadoraServiceBD == null) {
            locadoraServiceBD = new LocadoraServiceBD(context);
            return locadoraServiceBD;
        }
        return locadoraServiceBD;
    }


    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sql = "create table if not exists Filme (" +
                " _id integer primary key autoincrement, " +
                "nome text," +
                " genero text, " +
                "rating text, " +
                "imagem string );";
        Log.d(TAG, "Criando a tabela Locadora. Aguarde ...");
        sqLiteDatabase.execSQL(sql);
        Log.d(TAG, "Tabela Locadora criada com sucesso.");
        new Task().execute(); //popula a base de dados
        Log.d(TAG, "Tabela Locadora foi populada com sucesso.");
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {

    }

    /*@Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
		// Caso mude a versão do banco de dados, podemos executar um SQL aqui
        // exemplo:
        Log.d("aulas", "Upgrade da versão " + oldVersion + " para "
                + newVersion + ", destruindo tudo.");
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS contato");
        onCreate(sqLiteDatabase); // chama onCreate e recria o banco de dados
        Log.i("aulas", "Executou o script de upgrade da tabela contatos.");
}
    }*/

    public long save(Locadora locadora) {

        SQLiteDatabase db = getWritableDatabase();

        try {

            ContentValues values = new ContentValues();
            values.put("nome", locadora.nome);
            values.put("genero", locadora.genero);
            values.put("rating", locadora.rating);
            values.put("imagem", locadora.imagem);

            if (locadora._id == null) {
                //insere no banco de dados
                return db.insert("locadora", null, values);
            } else {
                //altera no banco de dados
                values.put("_id", locadora._id);
                return db.update("locadora", values, "_id=" + locadora._id, null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.close(); //não esquecer de liberar o recurso
        }
        return 0;
    }


    //deleta um locadora
    public long delete(Locadora locadora) {
        SQLiteDatabase db = getWritableDatabase(); //abre a conexão com o banco
        try {
            return db.delete("locadora", "_id=?", new String[]{String.valueOf(locadora._id)});
        } finally {
            db.close(); //não esquecer de liberar o recurso
        }
    }

    //retorna a lista de locadoras
    public List<Locadora> getAll() {
        SQLiteDatabase db = getReadableDatabase();
        try {
            //retorna uma List para os registros contidos no banco de dados
            // select * from carro
            return toList(db.rawQuery("SELECT  * FROM locadora", null));
        } finally {
            db.close();
        }
    }


    public List<Locadora> getByname(String nome) {
        SQLiteDatabase db = getReadableDatabase();
        try {
            //retorna uma List para os registros contidos no banco de dados
            // select * from carro
            return toList(db.rawQuery("SELECT  * FROM locadora where nome LIKE'" + nome + "%'", null));
        } finally {
            db.close();
        }
    }

    //converte de Cursor para List
    private List<Locadora> toList(Cursor c) {
        List<Locadora> locadoras = new ArrayList<Locadora>();

        if (c.moveToFirst()) {
            do {
                Locadora locadora = new Locadora();

                // recupera os atributos do cursor para o carro
                locadora._id = c.getLong(c.getColumnIndex("_id"));
                locadora.nome = c.getString(c.getColumnIndex("nome"));
                locadora.genero = c.getString(c.getColumnIndex("genero"));
                locadora.rating = c.getString(c.getColumnIndex("rating"));
                locadora.imagem = c.getBlob(c.getColumnIndex("imagem"));

                locadoras.add(locadora);

            } while (c.moveToNext());
        }

        return locadoras;

    }

    private class Task extends AsyncTask<Void, Void, Boolean> { //<Params, Progress, Result>

        @Override
        protected Boolean doInBackground(Void... voids) {
            return popularTabelaCarro();
        }

        private boolean popularTabelaCarro() {

            SQLiteDatabase sqLiteDatabase = getWritableDatabase();

            try {
                //registro 1
                ContentValues values = new ContentValues();
                values.put("nome", "Tucker 1948");
                values.put("genero", "Comédia");
                values.put("rating", "14");
                sqLiteDatabase.insert("Locadora", null, values);

                //registro 2
                values = new ContentValues();
                values.put("nome", "Chevrolet 2017");
                values.put("genero", "Ação");
                values.put("rating", "18");
                sqLiteDatabase.insert("Locadora", null, values);



            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            } finally {
                sqLiteDatabase.close();
            }

            return true;

        }
    }
}