package cn.shop.wineshop.adminuser.dao;

import java.util.List;

import cn.shop.wineshop.adminuser.domain.AdminUser;

public interface AdminUserDao{

	public AdminUser login(AdminUser adminUser);

	public int findCount();

	public List<AdminUser> findByPage(int begin, int limit);

	public AdminUser findByUid(Integer uid);

	public void delete(AdminUser adminUser);

	public void save(AdminUser adminUser);

	public void update(AdminUser adminUser);


}
