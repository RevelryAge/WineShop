package cn.shop.wineshop.adminuser.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.shop.wineshop.adminuser.domain.AdminUser;
import cn.shop.wineshop.adminuser.service.AdminUserService;
import cn.shop.wineshop.util.PageBean;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 模型驱动使用的对象
	private AdminUser adminUser = new AdminUser();

	public AdminUser getModel() {
		return adminUser;
	}

	// 注入AdminUserService
	private AdminUserService adminUserService;

	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}

	// 后台登录的执行的方法
	public String login() {

		// 调用service方法完成登录
		AdminUser existAdminUser = adminUserService.login(adminUser);
		// 判断
		//System.out.println(existAdminUser);
		if (existAdminUser == null) {
			// 用户名或密码错误
			this.addActionError("用户名或密码错误!");
			return "loginFail";
		} else {
			// 登录成功:
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess";
		}
	}

	// 接受page参数
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	/**
	 * 管理员信息页面跳转
	 */
	public String findAll() {
		PageBean<AdminUser> pageBean = adminUserService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}

	/**
	 * 更改信息
	 */
	public String update() {
		adminUserService.update(adminUser);
		ServletActionContext.getRequest().getSession().invalidate();
		return "update";
	}

	/**
	 * 添加管理员
	 * 
	 * @return
	 */
	public String save() {
		adminUserService.save(adminUser);
		return "save";
	}

	public String edit() {
		adminUser = adminUserService.findByUid(adminUser.getUid());
		return "edit";
	}

	/**
	 * 删除管理员
	 * 
	 * @return
	 */
	public String delete() {
		AdminUser exitadminUser = adminUserService.findByUid(adminUser.getUid());
		adminUserService.delete(exitadminUser);
		return "deleteSuccess";
	}

	/**
	 * 管理员注销
	 * 
	 * @return
	 */
	public String quit() {
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
}
