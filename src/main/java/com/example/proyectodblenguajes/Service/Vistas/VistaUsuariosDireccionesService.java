package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaUsuariosDirecciones;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaUsuariosDireccionesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaUsuariosDireccionesService {

    @Autowired
    private VistaUsuariosDireccionesDao vistaUsuariosDireccionesDao;

    public List<VistaUsuariosDirecciones> listarUsuariosDirecciones() throws SQLException {
        return vistaUsuariosDireccionesDao.listarUsuariosDirecciones();
    }
}
