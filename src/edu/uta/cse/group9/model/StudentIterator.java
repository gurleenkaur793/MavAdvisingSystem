package edu.uta.cse.group9.model;

import java.util.List;

public class StudentIterator implements Iterator {
	private List<Student> studentList;
	int index;
	
	public StudentIterator(List<Student> studentList){
		this.studentList = studentList;
	}
	
	@Override
	public boolean hasNext() {
		if(index < studentList.size())
			return true;
		return false;
	}

	@Override
	public Object next() {
		if(hasNext()){
			return studentList.get(index++);
		}
		return null;
	}

}
