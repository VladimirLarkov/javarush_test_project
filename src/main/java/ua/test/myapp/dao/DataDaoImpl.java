package ua.test.myapp.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import ua.test.myapp.model.User;

@Repository
public class DataDaoImpl implements DataDao {

	private static final int ITEMS_PER_PAGE = 4;

	@Autowired
	SessionFactory sessionFactory;
	
	public int getTotalPages() {
		Session session = sessionFactory.openSession();
		long count = ((Long) session.createQuery("select count(*) from User")
				.uniqueResult());
		int totalPages = (int)Math.ceil(count/ITEMS_PER_PAGE);
		session.close();
		return totalPages;
	}



	@Override
	@Transactional
	public int insertRow(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(user);
		tx.commit();
		Serializable id = session.getIdentifier(user);
		session.close();
		return (Integer) id;

	}

	@Override
	public List<User> getList(int page) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from User");
		query.setMaxResults(ITEMS_PER_PAGE);
		query.setFirstResult(page * ITEMS_PER_PAGE);
		@SuppressWarnings("unchecked")
		List<User> userList = query.list();
		session.close();
		return userList;
	}

	@Override
	public User getRowById(int id) {
		Session session = sessionFactory.openSession();
		User user = (User) session.load(User.class, id);
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsersByName(String name) {
		Session session = sessionFactory.openSession();		
		String query = "from User where name like " + "'" + name + "%'";

		List<User> userList = session.createQuery(query).list();
		session.close();
		return userList;
	}



	@Override
	public int updateRow(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(user);
		tx.commit();
		Serializable id = session.getIdentifier(user);
		session.close();
		return (Integer) id;
	}

	@Override
	public int deleteRow(int id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user = (User) session.load(User.class, id);
		session.delete(user);
		tx.commit();
		Serializable ids = session.getIdentifier(user);
		session.close();
		return (Integer) ids;
	}

}