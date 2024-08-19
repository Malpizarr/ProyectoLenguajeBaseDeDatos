package com.example.proyectodblenguajes.Service;

import com.example.proyectodblenguajes.DAOs.CategoriaDao;
import com.example.proyectodblenguajes.Models.Categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class CategoriaService {

    @Autowired
    private CategoriaDao categoriaDao;

    public void crearCategoria(Categoria categoria) throws SQLException {
        categoriaDao.crearCategoria(categoria.getNombre(), categoria.getDescripcion());
    }

    public Categoria obtenerCategoria(int id) throws SQLException {
        return categoriaDao.obtenerCategoria(id);
    }

    public void actualizarCategoria(Categoria categoria) throws SQLException {
        categoriaDao.actualizarCategoria(categoria);
    }

    public void eliminarCategoria(int id) throws SQLException {
        categoriaDao.eliminarCategoria(id);
    }

    public List<Categoria> listarTodasLasCategorias() throws SQLException {
        return categoriaDao.listarTodasLasCategorias();
    }
}
