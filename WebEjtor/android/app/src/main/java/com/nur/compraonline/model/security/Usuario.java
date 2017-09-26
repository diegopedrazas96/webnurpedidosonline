package com.nur.compraonline.model.security;

import com.google.gson.annotations.SerializedName;
import com.nur.compraonline.model.Entity;

import java.util.Date;

/**
 * Created by dpedrazas on 12/09/2017.
 */

public class Usuario extends Entity {

    @SerializedName("UsuarioId")
    private Long usuarioId;
    @SerializedName("Nombre")
    private String nombre;
    @SerializedName("Apellido")
    private String apellido;
    @SerializedName("Email")
    private String email;
    @SerializedName("Contraseña")
    private String contraseña;
    private String tipoUsuario;

    public Usuario() {
    }

    public Long getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(Long usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
}
