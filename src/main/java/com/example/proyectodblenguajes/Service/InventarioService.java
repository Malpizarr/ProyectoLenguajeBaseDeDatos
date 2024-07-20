package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.InventarioDao;
import com.example.proyectodblenguajes.Models.Inventario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class InventarioService {

    @Autowired
    private InventarioDao inventarioDao;

    public void crearInventario(int idProducto, int cantidad) throws SQLException {
        inventarioDao.crearInventario(idProducto, cantidad);
    }

    public Inventario obtenerInventario(int idInventario) throws SQLException {
        return inventarioDao.obtenerInventario(idInventario);
    }

    public void actualizarInventario(Inventario inventario) throws SQLException {
        inventarioDao.actualizarInventario(inventario);
    }

    public void eliminarInventario(int idInventario) throws SQLException {
        inventarioDao.eliminarInventario(idInventario);
    }
}
