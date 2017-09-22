package com.nur.compraonline.activity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.TextView;
import android.widget.Toast;

import com.beardedhen.androidbootstrap.FontAwesomeText;
import com.nur.compraonline.Application;
import com.nur.compraonline.R;
import com.nur.compraonline.component.Menu;
import com.nur.compraonline.model.security.Usuario;
import com.nur.compraonline.service.Service;

import java.util.ArrayList;
import java.util.List;


public class Login extends AppCompatActivity {

   private Button btnRecuperar;
    private  Button btnIngresar;
    private EditText etEmail;
    private  EditText etPassword;
    private  Usuario loginUser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        loginUser = null;
       btnIngresar = (Button) findViewById(R.id.btnIngresar);
        btnRecuperar = (Button) findViewById(R.id.btnRecuperar);
        etEmail = (EditText) findViewById(R.id.etUsuario);
        etPassword = (EditText) findViewById(R.id.etPassword);
        btnIngresar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (etEmail.getText().toString().length() > 0  && etPassword.getText().toString().length() > 0){
                    CallService callService = new CallService(1,Login.this,etEmail.getText().toString(),etPassword.getText().toString());
                    callService.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                }else{
                    Toast.makeText(Login.this,"Email o Contraseña vacios.!",Toast.LENGTH_SHORT).show();
                }
            }
        });
        btnRecuperar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (etEmail.getText().toString().length() > 0 ){
                    CallService callService = new CallService(2,Login.this,etEmail.getText().toString(),etPassword.getText().toString());
                    callService.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                }else{
                    Toast.makeText(Login.this,"Email vacio.!",Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();

    }

    @Override
    protected void onStart() {
        super.onStart();
     /*   if (serviceIntent != null) {
            startService(serviceIntent);
        }*/
    }

    @Override
    public void onDestroy() {
      super.onDestroy();
        /*  if (serviceIntent != null) {
            stopService(serviceIntent);
        }*/
        //startActivity(new Intent(Main.this, Main.class));
    }



    private class CallService extends AsyncTask<Integer, Void, Boolean> {

        private ProgressDialog progressDialog;
        private int action;
        private Context context;
        private  String email,password;
        private int productRegistries;
        private int countSyncronize = 0;
        public CallService(int varAction,Context cont,String email,String password) {
            this.action = varAction;
            this.context= cont;
            this.email = email;
            this.password = password;
        }

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(Login.this, null, getString(R.string.procesando));
        }

        @Override
        protected Boolean doInBackground(Integer... arg0) {
            try {
                Service service = new Service(Login.this);
                //Llamada a las Dal
                if (action == 1) {
                    loginUser = service.getUserByEmailPass(email,password);
                    if (loginUser != null & loginUser.getUsuarioId() > 0){
                        return true;
                    }

                }
                if (action == 2) {
                    Usuario user = new Usuario();
                    user.setEmail(email);
                    Usuario send = service.getUserByEmail(user,"","");
                    if (send != null && send.getUsuarioId() > 0){
                        return true;
                    }

                }

            }catch (Exception e){
                return false;
            }
            return false;
        }
        protected void onPostExecute(Boolean result) {
            progressDialog.dismiss();
            if (result) {
                //Sincronizacion Terminada
                Log.i(Application.tag, "Actualizando pantalla principal");
                if (action ==1){
                    Toast.makeText(context,"Usuario y Contraseña Correctos.!",Toast.LENGTH_LONG).show();
                    Intent intent = new Intent(Login.this,RegistroPedido.class);
                    startActivity(intent);

                }
                if (action ==2){
                    Toast.makeText(context,"Recuperacion Exitosa.! Se ha enviado un correo a su email.",Toast.LENGTH_LONG).show();

                }

            }else{
                Toast.makeText(context," Ocurrio un error al procesar los datos.!",Toast.LENGTH_SHORT).show();
            }
        }

    }


}
