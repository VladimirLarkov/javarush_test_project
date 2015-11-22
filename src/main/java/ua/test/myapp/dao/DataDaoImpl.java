package ua.test.myapp.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.*;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import ua.test.myapp.model.User;

@Repository
public class DataDaoImpl implements DataDao {

	private static final int ITEMS_PER_PAGE = 5;

	@Autowired
	SessionFactory sessionFactory;

	public int getTotalPages() {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.setProjection(Projections.rowCount());
		Long count = (Long) criteria.uniqueResult();
		int totalPages = (int)(count / ITEMS_PER_PAGE);
		if (count % ITEMS_PER_PAGE != 0) {
			totalPages = ++totalPages;
		}
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
		Criteria criteria = session.createCriteria(User.class);
		criteria.setFirstResult(page * ITEMS_PER_PAGE);
		criteria.setMaxResults(ITEMS_PER_PAGE);

		@SuppressWarnings("unchecked")
		List<User> firstPage = criteria.list();
		criteria.setProjection(Projections.rowCount());// To get total row count
		session.close();
		return firstPage;
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
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.ilike("name", name + "%"));
		List<User> userList = criteria.list();
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