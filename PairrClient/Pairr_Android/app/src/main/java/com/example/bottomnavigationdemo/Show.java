package com.example.bottomnavigationdemo;

import android.app.ListActivity;
import android.os.Bundle;
import android.widget.SimpleAdapter;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Show extends ListActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        super.onCreate(savedInstanceState);
        SimpleAdapter adapter=new SimpleAdapter(this,getData(),R.layout.show,
                new String[]{"poemname","dynasty","author","content"}
                ,new int[]{R.id.poemname,R.id.dynasty,R.id.author,R.id.content});
        setListAdapter(adapter);
    }

    private List<Map<String,Object>> getData(){
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("poemname", "竹石");
        map.put("dynasty", "清代 ");
        map.put("author", " 郑燮");
        map.put("content", "\t\r咬定青山不放松，立根原在破岩中。\n千磨万击还坚劲，任尔东西南北风.");
        list.add(map);

        map = new HashMap<String, Object>();
        map.put("poemname", "竹石");
        map.put("dynasty", "清代 ");
        map.put("author", "郑燮");
        map.put("content", "\t\r咬定青山不放松，立根原在破岩中。\n千磨万击还坚劲，任尔东西南北风.");
        list.add(map);

        map = new HashMap<String, Object>();
        map.put("poemname", "竹石");
        map.put("dynasty", "清代");
        map.put("author", "郑燮");
        map.put("content", "\t\r咬定青山不放松，立根原在破岩中。\n千磨万击还坚劲，任尔东西南北风.");
        list.add(map);

        map = new HashMap<String, Object>();
        map.put("poemname", "竹石");
        map.put("dynasty", "清代");
        map.put("author", "郑燮");
        map.put("content", "\t\r咬定青山不放松，立根原在破岩中。\n千磨万击还坚劲，任尔东西南北风.");
        list.add(map);

        return list;
    }
}
