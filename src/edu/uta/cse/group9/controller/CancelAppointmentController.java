package edu.uta.cse.group9.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.uta.cse.group9.database.DatabaseManager;
import edu.uta.cse.group9.model.AdvisingTask;
import edu.uta.cse.group9.model.Advisor;
import edu.uta.cse.group9.model.Appointment;
import edu.uta.cse.group9.model.AppointmentStatus;
import edu.uta.cse.group9.model.Student;
import edu.uta.cse.group9.util.JSPMap;
import edu.uta.cse.group9.util.ServletMap;

@WebServlet(ServletMap.APPOINTMENT_CANCEL)
public class CancelAppointmentController extends Controller {
	private static final long serialVersionUID = 1L;

	private static final String[] PERMISSIONS = new String[] {
			Student.class.getName(),
			Advisor.class.getName(),
		};	
       
    public CancelAppointmentController() {
        super();
    }

    @Override
	protected void performGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getServletContext().getRequestDispatcher(JSPMap.CANCEL_APPOINTMENT_URL).forward(request, response);
    	
	}

    @Override
	protected void performPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String reason = request.getParameter("reason");
		
		try {
			DatabaseManager dbmgr = new DatabaseManager();
			Appointment appointment = (Appointment) request.getSession().getAttribute("id");
			appointment.setStatus(AppointmentStatus.SCHEDULED);
			appointment.setAdvisorNotes(reason);
			if(dbmgr.updateAppointment(appointment)){
				request.setAttribute("success", "Appointment successfully cancelled!");
				// TODO: Send email to advisor and student with Appointment info
				getServletContext().getRequestDispatcher(ServletMap.HOME).forward(request, response);
				return;
			} else {
				request.setAttribute("error", "An unknown error occurred.");
				getServletContext().getRequestDispatcher(JSPMap.CANCEL_APPOINTMENT_URL).forward(request, response);
				return;
			}			
		} catch(Exception e) {
			request.setAttribute("error", e.getMessage());
			getServletContext().getRequestDispatcher(JSPMap.CANCEL_APPOINTMENT_URL).forward(request, response);
			return;			
		}

	}

	@Override
	protected String[] authorizedGetUsers() {
		return PERMISSIONS;
	}

	@Override
	protected String[] authorizedPostUsers() {
		return PERMISSIONS;
	}
}
