/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models.event;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Aniq Asyraaf
 */
@WebServlet(name = "CategorySport", urlPatterns = {"/CategorySport"})
public class CategorySport extends HttpServlet {    
    public CategorySport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         displayInfo( request,  response);
    }  
    public void displayInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlist");      
        ArrayList<Event> eventlistsport = new ArrayList<>();
        for(int i=0; i<eventlist.size();i++)
        {
            if(((Event)eventlist.get(i)).getEventCategory().equals("Sport"))
            {
                  eventlistsport.add(new Event(((Event)eventlist.get(i)).getEventID(), ((Event)eventlist.get(i)).getEventTitle(), ((Event)eventlist.get(i)).getEventDescription(), ((Event)eventlist.get(i)).getEventCategory(), ((Event)eventlist.get(i)).getEventDate(), ((Event)eventlist.get(i)).getEventTime(), ((Event)eventlist.get(i)).getEventVenue(), ((Event)eventlist.get(i)).getEventCapacity(), ((Event)eventlist.get(i)).getEventFee(), ((Event)eventlist.get(i)).getEventOrganizer(), ((Event)eventlist.get(i)).getEventImage2(), ((Event)eventlist.get(i)).getEventWebsite(), ((Event)eventlist.get(i)).isEventSponsor(), ((Event)eventlist.get(i)).getEventSponsorPackageAmt(), ((Event)eventlist.get(i)).getEventSponsorGatheredAmt()));
            }
        }
        session.removeAttribute("eventlist");
        session.setAttribute("eventlist", eventlistsport);
        request.getRequestDispatcher("WEB-INF/event/jsp/DeleteEventInterface.jsp").forward(request, response);
    }
}
