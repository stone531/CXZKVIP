package com.fh.service.ins.usermanage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ins.usermanage.UserManageManager;

/** 
 * 说明： user system
 * 创建人：FH Q313596790
 * 创建时间：2016-09-24
 * @version
 */
@Service("usermanageService")
public class UserManageService implements UserManageManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("UserManageMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("UserManageMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("UserManageMapper.edit", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editype(PageData pd)throws Exception{
		dao.update("UserManageMapper.editype", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("UserManageMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("UserManageMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserManageMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("UserManageMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**get by mobile
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData getByName(PageData pd)throws Exception{
		return  (PageData)dao.findForObject("UserManageMapper.getByName", pd);
	}
	/**get by email
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData getByEmail(PageData pd)throws Exception{
		return  (PageData)dao.findForObject("UserManageMapper.getByEmail", pd);
	}
	/**get by nickname
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData getByNick(PageData pd)throws Exception{
		return  (PageData)dao.findForObject("UserManageMapper.getByNick", pd);
	}
	
	public void updatePass(PageData pd)throws Exception{
		dao.update("UserManageMapper.updatePass", pd);
	}
	
	public void updateScore(PageData pd)throws Exception{
		dao.update("UserManageMapper.updateScore", pd);
	}
}

