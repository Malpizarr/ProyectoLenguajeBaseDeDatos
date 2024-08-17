package com.example.proyectodblenguajes.Service.Vistas;

import com.example.proyectodblenguajes.Models.Vistas.VistaMensajesContactoUsuarios;
import com.example.proyectodblenguajes.DAOs.Vistas.VistaMensajesContactoUsuariosDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class VistaMensajesContactoUsuariosService {

    @Autowired
    private VistaMensajesContactoUsuariosDao vistaMensajesContactoUsuariosDao;

    public List<VistaMensajesContactoUsuarios> listarMensajesContactoUsuarios() throws SQLException {
        return vistaMensajesContactoUsuariosDao.listarMensajesContactoUsuarios();
    }
}
