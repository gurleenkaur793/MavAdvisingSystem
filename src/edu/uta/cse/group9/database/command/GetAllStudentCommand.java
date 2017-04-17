package edu.uta.cse.group9.database.command;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.uta.cse.group9.model.Student;
import edu.uta.cse.group9.model.User;

public class GetAllStudentCommand extends SQLCommand {

	public GetAllStudentCommand(){
		
	}
	
	@Override
	void queryDB() throws Exception {
		String query = String.format("SELECT * FROM %s.%s U WHERE U.user_type="+Student.USER_TYPE_STUDENT,
				config.DBNAME, User.TABLE_NAME);
		try {
			statement = connection.prepareStatement(query);
			resultSet = statement.executeQuery();
		}catch(SQLException e) {
			result = null;
			throw new Exception(e.getMessage());
		}
		

	}

	@Override
	void processResult() throws Exception {
		List<Student> users = new ArrayList<Student>();
		Student student = null;
		
		try {
			while (resultSet.next()) {	
				student = new Student();
				student.setId(resultSet.getInt("id"));
				student.setEmail(resultSet.getString("email"));
				student.setUsername(resultSet.getString("username"));
				student.setPasswordHash(resultSet.getString("password_hash"));
				student.setPasswordSalt(resultSet.getString("password_salt"));
				student.setPasswordExpiration(resultSet.getDate("password_expiration"));
				student.setFirstName(resultSet.getString("firstname"));
				student.setLastName(resultSet.getString("lastname"));
				student.setUtaId(resultSet.getString("uta_id"));
				users.add(student);
			}
			result = users;
		} catch (SQLException e) {
			System.err.println("SQL Exception "+e.getMessage());
			result = null;
		}
	}

}
