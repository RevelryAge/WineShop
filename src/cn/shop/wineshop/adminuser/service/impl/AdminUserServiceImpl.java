package cn.shop.wineshop.adminuser.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.shop.wineshop.adminuser.dao.AdminUserDao;
import cn.shop.wineshop.adminuser.domain.AdminUser;
import cn.shop.wineshop.adminuser.service.AdminUserService;
import cn.shop.wineshop.util.PageBean;
@Transactional
public class AdminUserServiceImpl implements AdminUserService {
	
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}

	@Override
	public PageBean<AdminUser> findByPage(Integer page) {
		// TODO Auto-generated method stub
		PageBean<AdminUser> pageBean = new PageBean<>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示10个
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = adminUserDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合:
		int begin = (page - 1)*limit;
		List<AdminUser> list = adminUserDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public AdminUser findByUid(Integer uid) {
		// TODO Auto-generated method stub
		return adminUserDao.findByUid(uid);
	}

	@Override
	public void save(AdminUser adminUser) {
		// TODO Auto-generated method stub
		adminUserDao.save(adminUser);
	}
	
	@Override
	public void delete(AdminUser adminUser) {
		// TODO Auto-generated method stub
		adminUserDao.delete(adminUser);
	}

	@Override
	public void update(AdminUser adminUser) {
		// TODO Auto-generated method stub
		adminUserDao.update(adminUser);
	}

	
	
}
