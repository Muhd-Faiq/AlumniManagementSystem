/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models.event;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import com.models.event.Event;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aniq Asyraaf
 */
@WebServlet(name = "Creator", urlPatterns = {"/Creator"})
public class Creator extends Event {
    
    private String message;
    
    public  String FactoryMethod(String operation) {
        switch (operation) {
            case "add success":
                message = "Data add successful";
                break;
            case "add unsuccess":
                message = "Data add successful";
                break;
            case "delete success":
                message = "Data delete successful";
                break;
            case "delete unsuccess":
                message = "Data delete successful";
                break;
            case "update success":
                message = "Data update successful";
                break;
            case "update unsuccess":
                message = "Data update successful";
                break;
            default:
                break;
        }
        
        return message;
    }
   
    
}
