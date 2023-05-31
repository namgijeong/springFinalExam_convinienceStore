package myapp.service.impl;

import java.util.List;

import myapp.dao.UserDao;
import myapp.domain.User;
import myapp.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {this.userDao=userDao;}
	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		userDao.save(user);
		
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		userDao.delete(id);
	}

	@Override
	public User getById(int id) {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

}
