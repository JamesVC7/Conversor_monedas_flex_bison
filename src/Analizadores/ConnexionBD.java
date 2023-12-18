/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizadores;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnexionBD {

    public static Connection conectar() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/conversor";
        String usuario = "root";
        String contraseña = "";

        return DriverManager.getConnection(url, usuario, contraseña);
    }
}