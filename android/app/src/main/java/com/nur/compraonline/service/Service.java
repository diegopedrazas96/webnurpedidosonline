package com.nur.compraonline.service;

import android.content.Context;

import com.google.android.gms.analytics.ecommerce.Product;
import com.google.gson.reflect.TypeToken;
import com.nur.compraonline.Application;
import com.nur.compraonline.model.security.Usuario;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class Service extends Web {

    private SimpleDateFormat dateFormat;

    public Service(Context context) {
        super(context);
        dateFormat = new SimpleDateFormat(Application.formatDateShort);
    }

    public Date getServerDay() throws Exception {
        return (Date) super.getObject("/api/default/serverdate", Date.class,"","");
    }

    public Date getNextday(String user, String password) throws Exception {
        return (Date) super.getObject("/api/default/nextday", Date.class, user, password);
    }

    public Date getDay(String user, String password) throws Exception {
        return (Date) super.getObject("/api/default/day", Date.class, user, password);
    }

    public Usuario getUser(String email,String password) throws Exception {
        return super.get("/api/usuario/" + email +"/"+password, Usuario.class,"","");
    }

    public long postUser(Usuario entity, String user, String password) throws Exception {
    return super.post("/api/usuario", entity.getClass(), entity, "", "");
    }
    public long postRestorePass(Usuario entity, String user, String password) throws Exception {
        return super.post("/api/recuperar", entity.getClass(), entity, "", "");
    }
}
