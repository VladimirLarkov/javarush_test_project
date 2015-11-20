package ua.test.myapp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import ua.test.myapp.dao.DataDao;
import ua.test.myapp.model.User;

import javax.transaction.Transactional;

@Service("dataServiceImpl")
public class DataServiceImpl implements DataService {

	@Autowired
	DataDao dataDao;
	
	public int getTotalPages() {
		return dataDao.getTotalPages();
	}

	@Override
	@Transactional
	public int insertRow(User user) {
		return dataDao.insertRow(user);
	}

	@Override
	public List<User> getList(int page) {
		return dataDao.getList(page);
	}

	@Override
	public User getRowById(int id) {
		return dataDao.getRowById(id);
	}

	public List<User> getUsersByName(String name) {
		return dataDao.getUsersByName(name);
	}

	@Override
	public int updateRow(User user) {
		return dataDao.updateRow(user);
	}

	@Override
	public int deleteRow(int id) {
		return dataDao.deleteRow(id);
	}
}
