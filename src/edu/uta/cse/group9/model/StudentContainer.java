package edu.uta.cse.group9.model;

import java.util.List;

public class StudentContainer implements IteratorContainer {
	private List<Student> studentList;
	
	public StudentContainer(List<Student> studentList){
		this.studentList = studentList;
	}
	
	@Override
	public Iterator getIterator() {
		return new StudentIterator(this.studentList);
	}

}
