package com.labanda.yukart.models;

import java.util.ArrayList;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "direccion_envio")
public class DireccionEnvioModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	
	private Long id;
	private String calle;
	private String numero_exterior;
	private String colonia;
	private String codigo_postal;
	private String ciudad;
	private String estado;
	private String pais;
	
	@ManyToOne
	private CarritoComprasModel carrito_compras;
	
	@OneToMany(mappedBy = "direccion_envio")
	private ArrayList<PagoModel>pago;
	
	public DireccionEnvioModel() {
		super();
	}

	public DireccionEnvioModel(Long id, String calle, String numero_exterior, String colonia, String codigo_postal,
			String ciudad, String estado, String pais) {
		super();
		this.id = id;
		this.calle = calle;
		this.numero_exterior = numero_exterior;
		this.colonia = colonia;
		this.codigo_postal = codigo_postal;
		this.ciudad = ciudad;
		this.estado = estado;
		this.pais = pais;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getNumero_exterior() {
		return numero_exterior;
	}

	public void setNumero_exterior(String numero_exterior) {
		this.numero_exterior = numero_exterior;
	}

	public String getColonia() {
		return colonia;
	}

	public void setColonia(String colonia) {
		this.colonia = colonia;
	}

	public String getCodigo_postal() {
		return codigo_postal;
	}

	public void setCodigo_postal(String codigo_postal) {
		this.codigo_postal = codigo_postal;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}
	
	
	
	
}
