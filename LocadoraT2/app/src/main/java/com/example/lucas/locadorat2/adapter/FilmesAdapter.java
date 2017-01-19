package com.example.lucas.locadorat2.adapter;

import android.content.Context;
import android.net.Uri;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.example.lucas.locadorat2.R;
import com.example.lucas.locadorat2.model.Locadora;

import java.util.List;


/**
 * Esta classe realiza a adaptação dos dados entre a RecyclerView <-> List.
 * Neste projeto a List está sendo alimentada com dados oriundos de uma classe que gera dados, a classe de testes.
 * @author Vagner Pinto da Silva
 */
public class FilmesAdapter extends RecyclerView.Adapter<FilmesAdapter.LocadorasViewHolder> {
    protected static final String TAG = "Webservice_Locadoras";
    private final List<Locadora> filmes;
    private final Context context;

    private LocadoraOnClickListener filmeOnClickListener;

    public FilmesAdapter(Context context, List<Locadora> filmes, LocadoraOnClickListener filmeOnClickListener) {
        this.context = context;
        this.filmes = filmes;
        this.filmeOnClickListener = filmeOnClickListener;
    }

    @Override
    public int getItemCount() {
        return this.filmes != null ? this.filmes.size() : 0;
    }

    @Override
    public LocadorasViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        // Infla a view do layout
        View view = LayoutInflater.from(context).inflate(R.layout.adapter_filmes, viewGroup, false);

        // Cria o ViewHolder
        LocadorasViewHolder holder = new LocadorasViewHolder(view);
        return holder;
    }

    @Override
    public void onBindViewHolder(final LocadorasViewHolder holder, final int position) {
        // Atualiza a view
        Locadora c = filmes.get(position);

        holder.tNome.setText(c.nome);
        holder.progress.setVisibility(View.VISIBLE);
        if(c.imagem != null){
            holder.img.setImageURI(Uri.parse(c.imagem));
        }else{
            holder.img.setImageResource(R.drawable.car_background);
        }

        // Click
        if (filmeOnClickListener != null) {
            holder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    filmeOnClickListener.onClickLocadora(holder.itemView, position); // A variável position é final
                }
            });
        }

        holder.progress.setVisibility(View.INVISIBLE);
    }

    public interface LocadoraOnClickListener {
        public void onClickLocadora(View view, int idx);
    }

    // ViewHolder com as views
    public static class LocadorasViewHolder extends RecyclerView.ViewHolder {
        public TextView tNome;
        ImageView img;
        ProgressBar progress;

        public LocadorasViewHolder(View view) {
            super(view);
            // Cria as views para salvar no ViewHolder
            tNome = (TextView) view.findViewById(R.id.textView_card_adapter_filmes);
            img = (ImageView) view.findViewById(R.id.imageView_card_adapter);
            progress = (ProgressBar) view.findViewById(R.id.progressBar_card_adapter);
        }
    }
}
