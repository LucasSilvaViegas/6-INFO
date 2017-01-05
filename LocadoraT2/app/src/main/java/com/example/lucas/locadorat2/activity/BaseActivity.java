package com.example.lucas.locadorat2.activity;

import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;

/**
 * Created by Lucas on 04/01/2017.
 */

public class BaseActivity extends AppCompatActivity  {

    protected static String TAG = "bdfilmes";

    protected void replaceFragment (int container, Fragment fragment){
        getSupportFragmentManager().beginTransaction().replace(container, fragment).commit();
    }
}
