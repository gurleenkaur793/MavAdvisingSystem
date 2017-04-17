package edu.uta.cse.group9.model;

public interface MailBuilder {
	public void addFrom(String from);
	public void addTo(String to);
	public void addMimeType(String mimeType);
	public void addContent(String content);
	public void addSubject(String subject);
	public void construct();
	public Mail getProduct();
}
