package com.listen.bbs.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.bbs.vo.BbsTest;

@Repository
public class BbsDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public BbsDao() {
	}

	/*
	public ArrayList getBbsFileList() {
		return (ArrayList) smct.queryForList("getBbsFileList");
	}
	*/
	
	// 글쓰기
	public Object bbsWrite(BbsTest bbsTest){
		return (Object)smct.insert("bbsWrite");
	}
	
	// 글보기
	public ArrayList bbsViewList()
	{
		return (ArrayList) smct.queryForList("bbsViewList");
	}
	
}
