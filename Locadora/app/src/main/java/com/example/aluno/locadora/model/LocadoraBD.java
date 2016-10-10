
package com.example.aluno.locadora.model;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by aluno on 31/08/16.
 */
public class LocadoraBD extends SQLiteOpenHelper {

    private static final String TAG = "locadoras";
    private static final String NAME  = "locadora.sqlite";
    private static final int VERSION = 1;
    private static LocadoraBD locadoraBD = null;

    private LocadoraBD(Context context) {
        super(context, NAME, null, VERSION);
        //getWritableDatabase();
    }

    public static LocadoraBD getInstance(Context context){
        if(locadoraBD == null){
            locadoraBD = new LocadoraBD(context);
            return locadoraBD;
        }
        return locadoraBD;
    }



    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sql = "create table if not exists locadora ( _id integer primary key autoincrement, nome text, genero text, rating text, imagem blob );";
        Log.d(TAG, "Criando a tabela Locadora. Aguarde...");
        sqLiteDatabase.execSQL(sql);
        Log.d(TAG, "Tabela criada com sucesso!");
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

    public long save(Locadora locadora){

        SQLiteDatabase db = getWritableDatabase();

        try {

        ContentValues values = new ContentValues();
        values.put("nome", locadora.nome);
        values.put("genero", locadora.genero);
        values.put("rating", locadora.rating);
        values.put("imagem", locadora.imagem);

        if(locadora._id == null){
                //insere no banco de dados
                return db.insert("locadora", null, values);
            }else{
                //altera no banco de dados
                values.put("_id", locadora._id);
                return db.update("locadora", values, "_id=" + locadora._id, null);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            db.close(); //não esquecer de liberar o recurso
}
        return 0;
        }


    //deleta um locadora
    public long delete(Locadora locadora){
        SQLiteDatabase db = getWritableDatabase(); //abre a conexão com o banco
        try{
            return db.delete("locadora", "_id=?", new String[]{String.valueOf(locadora._id)});
        }
        finally {
            db.close(); //não esquecer de liberar o recurso
        }
    }

    //retorna a lista de locadoras
    public List<Locadora> getAll(){
        SQLiteDatabase db = getReadableDatabase();
        try {
            //retorna uma List para os registros contidos no banco de dados
            // select * from carro
            return toList(db.rawQuery("SELECT  * FROM locadora", null));
        } finally {
            db.close();
        }
    }



    public List<Locadora> getByname(String nome){
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

}

