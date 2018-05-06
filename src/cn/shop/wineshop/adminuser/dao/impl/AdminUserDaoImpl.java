package cn.shop.wineshop.adminuser.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.shop.wineshop.adminuser.dao.AdminUserDao;
import cn.shop.wineshop.adminuser.domain.AdminUser;
import cn.shop.wineshop.util.PageHibernateCallback;

public class AdminUserDaoImpl extends HibernateDaoSupport implements AdminUserDao {

	public AdminUser login(AdminUser adminUser) {
		String hql = "from AdminUser where username = ? and password = ?"; 
		@SuppressWarnings("unchecked")
		List<AdminUser> list = (List<AdminUser>) this.getHibernateTemplate().find(hql, adminUser.getUsername(), adminUser.getPassword());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		String hql="select count(*) from AdminUser";
		@SuppressWarnings("unchecked")
		List<Long> longs = (List<Long>) this.getHibernateTemplate().find(hql);
		if (longs != null && longs.size()>0) {
			return longs.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<AdminUser> findByPage(int begin, int limit) {
		// TODO Auto-generated method stub
		String hql = "from AdminUser";
		List<AdminUser> list = this.getHibernateTemplate().execute(new PageHibernateCallback<>(hql,null,begin,limit ));
		
		return list;
	}

	@Override
	public AdminUser findByUid(Integer uid) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(AdminUser.class, uid);
	}

	@Override
	public void delete(AdminUser adminUser) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(adminUser);
	}

	@Override
	public void save(AdminUser adminUser) {
		// TODO Auto-generated method stub
		System.out.println(adminUser);
		this.getHibernateTemplate().save(adminUser);
	}

	@Override
	public void update(AdminUser adminUser) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(adminUser);
	}
}
