package edu.uta.cse.group9.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Data;

import edu.uta.cse.group9.database.DatabaseManager;
import edu.uta.cse.group9.model.Advisor;
import edu.uta.cse.group9.model.Iterator;
import edu.uta.cse.group9.model.IteratorContainer;
import edu.uta.cse.group9.model.Student;
import edu.uta.cse.group9.model.StudentContainer;
import edu.uta.cse.group9.model.StudentIterator;
import edu.uta.cse.group9.util.JSPMap;
import edu.uta.cse.group9.util.ServletMap;

@WebServlet("/advisor/student/assign")
public class AssignStudentController extends Controller{
	private static final long serialVersionUID = 1L;
	
	private static final String[] PERMISSIONS = new String[] {
			"Any"
		};
	
	public AssignStudentController(){
		 super();
	}
	
	@Override
	protected void performGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DatabaseManager dbmgr = new DatabaseManager();
		List<Student> valuesList = new LinkedList<Student>();
		String currName, prevName;
		currName="";
		prevName="-1";
		try {
			List<Student> students = dbmgr.getAllStudentList();
			List<Advisor> advisors = dbmgr.getAdvisorList();
			
			IteratorContainer studentContainer = new StudentContainer(students);
			Iterator studentIterator = studentContainer.getIterator();
			
			Map<String, List<Student>> studentMap = new HashMap<String, List<Student>>(50);
		
			int i=0;
			while(studentIterator.hasNext()){
				currName = students.get(i).getLastName().substring(0, 1);
				if(!currName.equals(prevName) && currName.length() !=0){
					studentMap.put(students.get(i).getLastName().substring(0, 1), valuesList);
					valuesList = new LinkedList<Student>();
				}
				prevName = currName;
				valuesList.add(students.get(i));
				i++;
			}
			
			request.setAttribute("advisors", advisors);
			request.setAttribute("students", studentMap);
		} catch (Exception e) {
			System.err.println("AssignStudentController : SQL Exception "+e.getMessage());
		}
		
		getServletContext().getRequestDispatcher(JSPMap.ADVISOR_ASSIGN_STUDENT_URL).forward(request, response);
	}
	
	@Override
	protected void performPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String startElem = request.getParameter("hdnStartElem");
		String endElem = request.getParameter("hdnEndElem");
		String advisorId = request.getParameter("hdnAdvisorId");
		String noOfStudents = request.getParameter("hdnNoOfStudents");
		
		int advisor_id = Integer.parseInt(advisorId);
		int no_of_students = Integer.parseInt(noOfStudents);
		
		DatabaseManager dbmgr = new DatabaseManager();
		try {
			dbmgr.assignStudent(advisor_id, no_of_students, startElem, endElem);
			request.setAttribute("success", "Students successfully mapped to Advisors");
			getServletContext().getRequestDispatcher(ServletMap.HOME).forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			getServletContext().getRequestDispatcher(JSPMap.ADVISOR_ASSIGN_STUDENT_URL).forward(request, response);
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
