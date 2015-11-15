package ua.test.myapp.services;

import java.util.List;

import ua.test.myapp.model.User;

public interface DataService {
	public int getTotalPages();
	
	public int insertRow(User user);

	public List<User> getList(int page);

	public User getRowById(int id);

	public List<User> getUsersByName(String name);

	public int updateRow(User user);

	public int deleteRow(int id);

}