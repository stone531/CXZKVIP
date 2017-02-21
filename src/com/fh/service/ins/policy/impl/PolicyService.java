package com.fh.service.ins.policy.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ins.policy.PolicyManager;

/** 
 * 说明： 保单系统
 * 创建人：FH Q313596790
 * 创建时间：2016-09-24
 * @version
 */
@Service("policyService")
public class PolicyService implements PolicyManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("PolicyMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("PolicyMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("PolicyMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PolicyMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PolicyMapper.listAll", pd);
	}
	
	/**获取理赔排名列表
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> getRankingList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PolicyMapper.getRankingList", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PolicyMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PolicyMapper.deleteAll", ArrayDATA_IDS);
	}
	
	
	
	/**通过卡号获取保单信息
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData>   findByCardId(PageData pd)throws Exception{
		return (List<PageData> )dao.findForList("PolicyMapper.findByCardId", pd);
	}
	
	
	/**通过会员id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData>  findByUserID(PageData pd)throws Exception{
		return (List<PageData> )dao.findForList("PolicyMapper.findByUserID", pd);
	}

	
	/**通过被保险人身份证号查询保单
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData>  findByPaperNo(PageData pd)throws Exception{
		return (List<PageData> )dao.findForList("PolicyMapper.findByPaperNo", pd);
	}
	

}

