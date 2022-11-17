package org.com.proyecto.geekmitive.entity;

import javax.persistence.*;

@Table(name = "carrito_has_producto")
@Entity

public class CarritoHasProducto {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idCarritoHasProducto;
	
	@ManyToOne
	@JoinColumn(name="id_carrito")
    private Carrito idCarrito;
	
	@ManyToOne
	@JoinColumn(name="id_producto")
	private Producto idProducto;
	
	private Integer cantidad;
	
	
	public Long getIdCarritoHasProducto() {
		return idCarritoHasProducto;
	}

	public void setIdCarritoHasProducto(Long idCarritoHasProducto) {
		this.idCarritoHasProducto = idCarritoHasProducto;
	}

	public Carrito getIdCarrito() {
		return idCarrito;
	}

	public void setIdCarrito(Carrito idCarrito) {
		this.idCarrito = idCarrito;
	}

	public Producto getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(Producto idProducto) {
		this.idProducto = idProducto;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
	
	
	
}
