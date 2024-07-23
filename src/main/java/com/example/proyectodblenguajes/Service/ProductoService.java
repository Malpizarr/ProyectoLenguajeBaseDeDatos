package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.ProductoDao;
import com.example.proyectodblenguajes.Models.Producto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class ProductoService {

    @Autowired
    private ProductoDao productoDao;

    public void crearProducto(int idCategoria, String nombre, String descripcion, double precio) throws SQLException {
        productoDao.crearProducto(idCategoria, nombre, descripcion, precio);
    }

    public Producto obtenerProducto(int idProducto) throws SQLException {
        return productoDao.obtenerProducto(idProducto);
    }

    public void actualizarProducto(Producto producto) throws SQLException {
        productoDao.actualizarProducto(producto);
    }

    public void eliminarProducto(int idProducto) throws SQLException {
        productoDao.eliminarProducto(idProducto);
    }

//    public List<Producto> listarTodosLosProductos() throws SQLException {
//        return productoDao.listarTodosLosProductos();
//    }
}
