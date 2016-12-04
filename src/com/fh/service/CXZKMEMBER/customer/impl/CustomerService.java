package com.fh.service.CXZKMEMBER.customer.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.Department;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.service.CXZKMEMBER.customer.CustomerManager;

/** 
 * 说明： 会员管理
 * 创建人：FH Q313596790
 * 创建时间：2015-07-06
 * @version
 */
@Service("customerService")
public class CustomerService implements CustomerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("CustomerMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("CustomerMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("CustomerMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		//取得当前的用户
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String username=(String)session.getAttribute(Const.SESSION_USERNAME);
		//取得当前的组织机构权限
		List<Department> allOrgList = (List<Department>)session.getAttribute(username+Const.SESSION_allDepList);
		String[] ArrayOrgId= new String[allOrgList.size()+1];
		//将当前用户所在组织机构添加进数组
		ArrayOrgId[0]=user.getDepartment_id();
		//将当前的组织机构权限添加进数组
		for (int i = 0; i < allOrgList.size(); i++) {
			ArrayOrgId[i+1]=String.valueOf(allOrgList.get(i).getDEPARTMENT_ID());
		}
		return (List<PageData>)dao.findForList("CustomerMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CustomerMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CustomerMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CustomerMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

