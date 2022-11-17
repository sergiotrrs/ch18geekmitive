package org.com.proyecto.geekmitive.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Table(name = "productos")
@Entity
public class Producto {
	
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="id_producto")
	 @JsonIgnore
	 private Long id_producto;
 	 @ManyToOne
 	 @JoinColumn(name="id_categoria")
	 private Categoria id_categoria;
	 @Column
	 private String nombre;
	 @Column
	 private Double precio;
	 @Column
	 private String descripcion;
	 @Column
	 private String marca;
	 @Column
	 private String imagen;
	 @Column
	 private Boolean nuevo;

	public Long getId_producto() {
		return id_producto;
	}

	public void setId_producto(Long id_producto) {
		this.id_producto = id_producto;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public Categoria getIdCategoria() {
		return id_categoria;
	}

	public void setIdCategoria(Categoria id_categoria) {
		this.id_categoria = id_categoria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public Boolean getNuevo() {
		return nuevo;
	}

	public void setNuevo(Boolean nuevo) {
		this.nuevo = nuevo;
	}
}

