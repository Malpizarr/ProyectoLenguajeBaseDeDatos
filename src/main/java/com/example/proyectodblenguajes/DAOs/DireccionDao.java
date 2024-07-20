package com.example.proyectodblenguajes.DAOs;
import com.example.proyectodblenguajes.Models.Direccion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

@Repository
public class DireccionDao {

    @Autowired
    private DataSource dbconfig;

    public void crearDireccion(int idUsuario, String direccionLinea1, String direccionLinea2, String ciudad, String estado, String codigoPostal, String pais) throws SQLException {
        String sql = "{call direccion_pkg.crear_direccion_usuario(?, ?, ?, ?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idUsuario);
            callableStatement.setString(2, direccionLinea1);
            callableStatement.setString(3, direccionLinea2);
            callableStatement.setString(4, ciudad);
            callableStatement.setString(5, estado);
            callableStatement.setString(6, codigoPostal);
            callableStatement.setString(7, pais);
            callableStatement.executeUpdate();
        }
    }

    public Direccion obtenerDireccion(int idDireccion) throws SQLException {
        String sql = "{call direccion_pkg.obtener_direccion_usuario(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idDireccion);
            callableStatement.registerOutParameter(2, Types.INTEGER);
            callableStatement.registerOutParameter(3, Types.VARCHAR);
            callableStatement.registerOutParameter(4, Types.VARCHAR);
            callableStatement.registerOutParameter(5, Types.VARCHAR);
            callableStatement.registerOutParameter(6, Types.VARCHAR);
            callableStatement.registerOutParameter(7, Types.VARCHAR);
            callableStatement.registerOutParameter(8, Types.VARCHAR);
            callableStatement.registerOutParameter(9, Types.TIMESTAMP);
            callableStatement.execute();

            Direccion direccion = new Direccion();
            direccion.setId(idDireccion);
            direccion.setIdUsuario(callableStatement.getInt(2));
            direccion.setDireccionLinea1(callableStatement.getString(3));
            direccion.setDireccionLinea2(callableStatement.getString(4));
            direccion.setCiudad(callableStatement.getString(5));
            direccion.setEstado(callableStatement.getString(6));
            direccion.setCodigoPostal(callableStatement.getString(7));
            direccion.setPais(callableStatement.getString(8));
            direccion.setFechaCreacion(callableStatement.getTimestamp(9));

            return direccion;
        }
    }

    public void actualizarDireccion(Direccion direccion) throws SQLException {
        String sql = "{call direccion_pkg.actualizar_direccion_usuario(?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, direccion.getId());
            callableStatement.setInt(2, direccion.getIdUsuario());
            callableStatement.setString(3, direccion.getDireccionLinea1());
            callableStatement.setString(4, direccion.getDireccionLinea2());
            callableStatement.setString(5, direccion.getCiudad());
            callableStatement.setString(6, direccion.getEstado());
            callableStatement.setString(7, direccion.getCodigoPostal());
            callableStatement.setString(8, direccion.getPais());
            callableStatement.executeUpdate();
        }
    }

    public void eliminarDireccion(int idDireccion) throws SQLException {
        String sql = "{call direccion_pkg.eliminar_direccion_usuario(?)}";
        try (Connection connection = dbconfig.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setInt(1, idDireccion);
            callableStatement.executeUpdate();
        }
    }
}
