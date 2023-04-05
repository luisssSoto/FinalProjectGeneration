package com.labanda.yukart.models;

import java.util.ArrayList;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "usuario")
public class UsuarioModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;
	private String nombre_usuario;
	private String email;
	private String contrasenia;
	
	@OneToMany(mappedBy = "usuario")
	private ArrayList<CarritoComprasModel>carrito_compras;
	
	public UsuarioModel() {
		super();
	}
	
	public UsuarioModel(Long id, String nombre_usuario, String email, String contrasenia) {
		super();
		this.id = id;
		this.nombre_usuario = nombre_usuario;
		this.email = email;
		this.contrasenia = contrasenia;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNombre_usuario() {
		return nombre_usuario;
	}
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContrasenia() {
		return contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
	
	
}
