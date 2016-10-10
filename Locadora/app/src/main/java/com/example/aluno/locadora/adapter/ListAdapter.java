package com.example.aluno.locadora.adapter;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.aluno.locadora.R;
import com.example.aluno.locadora.model.Locadora;

import java.util.List;


/**
 * Created by vagner on 21/08/16.
 */
public class ListAdapter extends ArrayAdapter<Locadora> {

    public ListAdapter(Context context, List<Locadora> locadoras) {
        super(context, 0, locadoras);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Lê os dados da posição que o usuário clicou
        Locadora locadora = getItem(position);

        // Checa de está utilizando o padrão ViewHolder
        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.adapter_layout, parent, false);
        }
        // mapeia as views do layout do adaptador
        TextView tvNome = (TextView) convertView.findViewById(R.id.tv_item_nome);
        TextView tvSobrenome = (TextView) convertView.findViewById(R.id.tv_item_sobrenome);
        TextView tvTelefone = (TextView) convertView.findViewById(R.id.tv_item_telefone);
        // popula as views
        tvNome.setText(locadora.nome);
        tvSobrenome.setText(locadora.genero);
        tvTelefone.setText(locadora.rating);

        //mapeia a view da imagem
        ImageView imvImagem = (ImageView) convertView.findViewById(R.id.imv_item);
        if (locadora.imagem != null) {
            //converte byte[] para Bitmap
            Bitmap bitmap = BitmapFactory.decodeByteArray(locadora.imagem, 0, locadora.imagem.length);
            //carrega a imagem na ImageView do item da ListView
            imvImagem.setImageBitmap(bitmap);
        }else{
            //carrega a imagem padrão (se não houver imagem no Cursor)
            imvImagem.setImageResource(R.drawable.foto_sombra);
        }
        // retorna a view do item completa para renderizar no screen
        return convertView;

    }
}
