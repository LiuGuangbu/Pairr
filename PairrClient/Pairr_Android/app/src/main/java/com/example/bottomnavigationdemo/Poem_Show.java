package com.example.bottomnavigationdemo;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

import androidx.annotation.Nullable;

public class Poem_Show extends Activity {
    private TextView textView_content;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.poem_show);
        textView_content=findViewById(R.id.textView_content);

        Bundle receive=getIntent().getExtras();
        String content=receive.getString("content");
        textView_content.setText(content);
    }
}
