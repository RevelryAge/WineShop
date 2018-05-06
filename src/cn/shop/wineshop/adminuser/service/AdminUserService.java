package cn.shop.wineshop.adminuser.service;

import cn.shop.wineshop.adminuser.domain.AdminUser;
import cn.shop.wineshop.util.PageBean;

public interface AdminUserService {

	public AdminUser login(AdminUser adminUser) ;

	public PageBean<AdminUser> findByPage(Integer page);

	public AdminUser findByUid(Integer uid);

	public void delete(AdminUser adminUser);

	public void save(AdminUser adminUser);

	public void update(AdminUser adminUser);

}
