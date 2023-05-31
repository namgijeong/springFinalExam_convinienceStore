package myapp.service;

import java.util.List;

import myapp.domain.User;

public interface UserService {
	void save(User user);
	void update(User user);
	void delete(int id);
	User getById(int id);
	List<User> getAll();
}
