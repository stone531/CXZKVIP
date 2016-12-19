package com.fh.service.ins.claimsys.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ins.claimsys.ClaimSysManager;

/** 
 * 说明： ICS
 * 创建人：FH Q313596790
 * 创建时间：2016-09-24
 * @version
 */
@Service("claimsysService")
public class ClaimSysService implements ClaimSysManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("ClaimSysMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("ClaimSysMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("ClaimSysMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ClaimSysMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ClaimSysMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ClaimSysMapper.findById", pd);
	}
	
	/**通过PolicyNo获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByPolicyNo(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ClaimSysMapper.findByPolicyNo", pd);
	}
	
	/**通过PolicyNo获取理赔状态
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findStateByPolicyNo(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ClaimSysMapper.findStateByPolicyNo", pd);
	}
	
	/**通过PolicyNo更新理赔状态
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData updateStateByPolicyNo(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ClaimSysMapper.updateStateByPolicyNo", pd);
	}
	
	/**自动更新是否提醒
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void updateSetRemind(PageData pd)throws Exception{
		dao.findForObject("ClaimSysMapper.updateSetRemind", pd);
	}
	
	/**添加快递单号
	 * @param pd
	 * @throws Exception
	 */
	public void addCourierNo(PageData pd)throws Exception{
		dao.findForObject("ClaimSysMapper.addCourierNo", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ClaimSysMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**列出状态
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listStates(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ClaimSysMapper.listStates", pd);
	}
	
}

