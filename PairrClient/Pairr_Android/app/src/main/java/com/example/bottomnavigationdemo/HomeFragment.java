package com.example.bottomnavigationdemo;

import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProviders;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;


public class HomeFragment extends Fragment {
    private static final String TAG = "hello";
    private HomeViewModel mViewModel;
    private ImageView imageView;
    private Button button_search;
    private EditText editText_search;


    public static HomeFragment newInstance() {
        return new HomeFragment();
    }

    @SuppressLint("HandlerLeak")
    private Handler handler=new Handler(){
        @Override
        public void handleMessage(@NonNull Message msg) {
            Bundle bundle=msg.getData();
            String content=bundle.getString("content");
            if (content.equals("[]")) {
                Intent intent=new Intent(getContext(),Poem_Show.class); //拿到数据
                intent.putExtras(bundle);
                startActivity(intent);
            }
            else
                Toast.makeText(getContext(), "亲，您输入有误！！！", Toast.LENGTH_SHORT).show();;
        }
    };

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.home_fragment, container, false);
        imageView = view.findViewById(R.id.imageView);
        button_search=view.findViewById(R.id.button_search);
        editText_search=view.findViewById(R.id.editText_search);
        return view;
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
         mViewModel = ViewModelProviders.of(requireActivity()).get(HomeViewModel.class);
        imageView.setRotation(mViewModel.rotationPosition);

        final ObjectAnimator objectAnimator = ObjectAnimator.ofFloat(imageView, "rotation", 0, 0);
        objectAnimator.setDuration(500);
        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!objectAnimator.isRunning()) {
                    objectAnimator.setFloatValues(imageView.getRotation(), imageView.getRotation() + 100);
                    mViewModel.rotationPosition += 100;
                    objectAnimator.start();
                }
            }
        });


        button_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        tcpClient();
                    }
                }).start();
//                int port=5000;
//                String hostip="192.168.1.148";//192.168.1.148 192.168.108.1
//
//                try{
//                    Socket socketClient = new Socket(hostip, port);     	//1.bind
//                    InputStream in=socketClient.getInputStream();			//2.获得IO流
//                    OutputStream out = socketClient.getOutputStream();
//                    String name=editText_search.getText().toString().trim();
//                    Log.d(TAG,name);
//                    out.write(name.getBytes());					//3.发送
//                    out.flush();
//
//                    byte[] bytes = new byte[1024];
//                    in.read(bytes);											//4.接收
//                    String s=new String(bytes, StandardCharsets.UTF_8).trim();
//                    Log.i(TAG, s);
//
//                    //消息处理机制
//                    //Message msg=new Message();
//                    Bundle bundle=new Bundle();
//                    bundle.putString("content",s);
//                    intent.putExtras(bundle);
//                    startActivity(intent);
//                    //msg.what=COMPLETED;
//                   // msg.setData(bundle);
//                   // handler.sendMessage(msg);
//                    socketClient.close();									//5.关闭
//                } catch (IOException e){e.printStackTrace();}
            }
        });
    }
    private void tcpClient(){
        int port=5000;
        String hostip="192.168.1.148";

        try{
            Socket socketClient = new Socket(hostip, port);     	//1.bind
            InputStream in=socketClient.getInputStream();			//2.获得IO流
            OutputStream out = socketClient.getOutputStream();
            String name=editText_search.getText().toString().trim();
            Log.d(TAG,name);
            out.write(name.getBytes());					//3.发送
            out.flush();

            byte[] bytes = new byte[1024];
            in.read(bytes);											//4.接收
            String s=new String(bytes, StandardCharsets.UTF_8).trim();
            Log.i(TAG, s);


            Bundle bundle=new Bundle();
            bundle.putString("content",s);
            Intent intent=new Intent(getContext(),Poem_Show.class);
            intent.putExtras(bundle);
            startActivity(intent);

            socketClient.close();									//5.关闭
        } catch (IOException e){e.printStackTrace();}
    }
}
