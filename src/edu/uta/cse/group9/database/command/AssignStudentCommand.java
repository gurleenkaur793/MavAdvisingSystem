package edu.uta.cse.group9.database.command;

import java.sql.SQLException;

import edu.uta.cse.group9.model.AdvisingTask;
import edu.uta.cse.group9.model.Advisor;
import edu.uta.cse.group9.model.Session;

public class AssignStudentCommand extends SQLCommand{

	private int advisorId;
	private int noOfAssigedStudents;
	private String startElement;
	private String endElement;
	
	public AssignStudentCommand(int advisorId, int noOfAssignedStudents, String startElement, String endElement){
		super();
		this.advisorId = advisorId;
		this.noOfAssigedStudents = noOfAssignedStudents;
		this.startElement = startElement;
		this.endElement = endElement;
	}
	
	@Override
	void queryDB() throws Exception {
		String query = null;
		query = String.format("INSERT INTO %s.%s (id, email_notify, assigned_students, start_student, end_student) VALUES (?, ?, ?,?, ?) ",
					config.DBNAME, Advisor.TABLE_NAME);
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, this.advisorId);
			statement.setInt(2, 1); //Email Notify
			statement.setInt(3, this.noOfAssigedStudents);
			statement.setString(4, this.startElement);
			statement.setString(5, this.endElement);
			statement.executeUpdate();
		} catch (SQLException e) {
			result = null;
			throw new Exception(e.getMessage());
		}
	}

	@Override
	void processResult() throws Exception {
		result = (Boolean) true;
	}

}
