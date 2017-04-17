package edu.uta.cse.group9.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

@WebServlet(ServletMap.STUDENT_CREATE_APPOINTMENT)
public class CreateAppointmentController extends Controller {
	private static final long serialVersionUID = 1L;
       
	private static final String[] PERMISSIONS = new String[] {
			"Anonymous",
			Student.class.getName()
		};

    public CreateAppointmentController() {
        super();
    }

	@Override
	protected void performGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DatabaseManager dbMgr = new DatabaseManager();
		try {
			List<Advisor> advisors = dbMgr.getAdvisorList();
			request.setAttribute("advisors", advisors);
			getServletContext().getRequestDispatcher(JSPMap.CREATE_APPOINTMENT_URL).forward(request, response);
			return;
		} catch(Exception e) {
			request.setAttribute("error", e.getMessage());
			getServletContext().getRequestDispatcher(JSPMap.CREATE_APPOINTMENT_URL).forward(request, response);
			return;	
		}
	}

	@Override
	protected void performPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer advisorId = Integer.parseInt(request.getParameter("advisor"));
		Integer advisingTask = Integer.parseInt(request.getParameter("advising_task"));
		String start = request.getParameter("start_time");
		String end = request.getParameter("end_time");
		String studentNotes = request.getParameter("student_notes");
		
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy hh:mm");
		Date startTime;
		Date endTime;
		try {
			startTime = format.parse(start);
			endTime = format.parse(end);
		} catch (ParseException e) {
			request.setAttribute("error", "Unable to parse date/time format!");
			getServletContext().getRequestDispatcher(JSPMap.CREATE_APPOINTMENT_URL).forward(request, response);
			return;
		}
		
		try {
			DatabaseManager dbmgr = new DatabaseManager();
			Student student = (Student) request.getSession().getAttribute("user"); 
			Advisor advisor = (Advisor) dbmgr.getUserById(advisorId);
			AdvisingTask task = dbmgr.getAdvisingTask(advisingTask, advisor);		
			
			Appointment appointment = new Appointment(null, advisor, student, startTime, endTime, studentNotes, "", task, AppointmentStatus.SCHEDULED);
			if(dbmgr.insertAppointment(appointment)){
				request.setAttribute("success", "Appointment successfully scheduled!");
				// TODO: Send email to advisor and student with Appointment info
				getServletContext().getRequestDispatcher(ServletMap.HOME).forward(request, response);
				return;
			} else {
				request.setAttribute("error", "An unknown error occurred.");
				getServletContext().getRequestDispatcher(JSPMap.CREATE_APPOINTMENT_URL).forward(request, response);
				return;
			}			
		} catch(Exception e) {
			request.setAttribute("error", e.getMessage());
			getServletContext().getRequestDispatcher(JSPMap.CREATE_APPOINTMENT_URL).forward(request, response);
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
