package com.nur.compraonline.activity;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.telephony.TelephonyManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.TextView;
import android.widget.Toast;

import com.beardedhen.androidbootstrap.FontAwesomeText;
import com.nur.compraonline.Application;
import com.nur.compraonline.R;
import com.nur.compraonline.component.Menu;
import com.nur.compraonline.model.security.Usuario;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class Main extends AppCompatActivity {

    private Intent serviceIntent = null;

    private GridView menu = null;

    private List<Menu> items = new ArrayList<Menu>();

    private Usuario user = null;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //Inicia el servicio de posicionamiento
       // serviceIntent = new Intent(Main.this, Position.class);

        menu = (GridView) findViewById(R.id.gridView);
        menu.setAdapter(new IconAdapter());


        menu.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Menu item = items.get(i);
                switch (item.getId()) {
                    case R.string.pedidos:
                        //startActivity(new Intent(Main.this, ProformaFragment.class));
                        break;
                    case R.string.arduino:
                        /*User user = new DUser(Main.this).get();
                        if (user.getCierre() == false && user.getApertura()==true) {
                            startActivity(new Intent(Main.this, Relevamientos.class));
                        }else{
                            Toast.makeText(Main.this,"No se puede crear un relevamiento. Sincronize los datos o inicie dia.",Toast.LENGTH_LONG).show();
                        }*/

                        break;

                }
            }
        });


        items.clear();
        items.add(new Menu(R.string.pedidos, R.string.pedidos, "fa-pencil-square-o"));
        items.add(new Menu(R.string.arduino, R.string.arduino, "fa-sort-numeric-asc"));
      //  items.add(new Menu(R.string.adjust, R.string.adjust, "fa-pencil-square-o"));

      //  items.add(new Menu(R.string.synchronize, R.string.synchronize, "fa-refresh"));
     //   items.add(new Menu(R.string.options, R.string.options, "fa-suitcase"));
      //  items.add(new Menu(R.string.configuration, R.string.configuration, "fa-cogs"));
      //  items.add(new Menu(R.string.reports, R.string.reports, "fa-print"));

        menu.setAdapter(new IconAdapter());

    }

    @Override
    protected void onResume() {
        super.onResume();
        //load aditional data
      /*  DUser dal = new DUser(getApplicationContext());
        User user = dal.get();
        SimpleDateFormat dateFormat = new SimpleDateFormat(Application.formatDateShort);
        TelephonyManager telephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        if (user != null && user.getId()!=null){
            ((TextView) findViewById(R.id.userName)).setText("(" + user.getIdVendedor() + ") " + user.getNombre());
            ((TextView) findViewById(R.id.phoneImei)).setText(telephonyManager.getDeviceId().toString());
            ((TextView) findViewById(R.id.day)).setText(dateFormat.format(user.getInitDate()));
            ((TextView) findViewById(R.id.startPeriod)).setText((user.getApertura() ? getString(R.string.yes) : getString(R.string.no)));
            ((TextView) findViewById(R.id.closePeriod)).setText((user.getCierre() ? getString(R.string.yes) : getString(R.string.no)));
        }else {
            ((TextView) findViewById(R.id.userName)).setText("PRIMER USO");
        }*/


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

    @Override
    public void onBackPressed() {
        new AlertDialog.Builder(this).setTitle(null).setMessage(R.string.message_close).setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                finish();
            }
        }).setNegativeButton(android.R.string.no, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {

            }
        }).setIcon(android.R.drawable.ic_dialog_alert).show();
    }


    public class IconAdapter extends BaseAdapter {

        public int getCount() {
            return items.size();
        }

        public Menu getItem(int position) {
            return items.get(position);
        }

        public long getItemId(int position) {
            return 0;
        }


        public View getView(int position, View convertView, ViewGroup parent) {
            View v = convertView;
            if (v == null) {
                LayoutInflater vi = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                v = vi.inflate(R.layout.main_item, null);
            }
            Menu item = items.get(position);
            TextView text = (TextView) v.findViewById(R.id.text);
            FontAwesomeText icon = (FontAwesomeText) v.findViewById(R.id.icon);
            icon.setIcon(item.getIcon());
            text.setText(item.getLabel());
            return v;
        }
    }


}
