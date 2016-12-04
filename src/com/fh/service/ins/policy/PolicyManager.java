package com.fh.service.ins.policy;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 保单系统接口
 * 创建人：FH Q313596790
 * 创建时间：2016-09-24
 * @version
 */
public interface PolicyManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	
	
	/**通过服务卡号获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData>  findByCardId(PageData pd)throws Exception;
	
	
	
	/**通过会员id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData>  findByUserID(PageData pd)throws Exception;

	
	/**通过被保险人身份证号获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData>  findByPaperNo(PageData pd)throws Exception;
	
	

	
}

