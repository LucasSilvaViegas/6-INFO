package com.example.lucas.locadorat2.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.example.lucas.locadorat2.R;

/**
 * Created by Lucas on 04/01/2017.
 */

public class FilmesFragment extends BaseFragment {
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_filmes, container, false);

        return super.onCreateView(inflater, container, savedInstanceState);
    }
}
