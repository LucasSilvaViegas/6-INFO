package com.example.lucas.locadorat2.fragment;

import android.support.v4.app.Fragment;

/**
 * Created by Lucas on 04/01/2017.
 */

public class BaseFragment extends Fragment {
    protected  static String TAG = "bdfilmes";

    protected void replaceFragment(int container, Fragment fragment){
        getActivity().getSupportFragmentManager().beginTransaction().replace(container, fragment);
    }
}
