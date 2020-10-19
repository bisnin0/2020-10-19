package com.bitcamp.freeboard;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.library.DBConnection;

public class FreeboardDAO extends DBConnection{
	//글쓰기
	public int boardInsertRecord(FreeboardVO vo) {
		int cnt=0;
		try {
			// 1. db연결
			getConn();
			// 2. sql -> preparedStatement
			String sql = "insert into freeboard(no, subject, content, userid, hit, writedate, ip) "
					+ "values(a_sq.nextval, ?, ?, ?, 0, sysdate, ?)";
				getPstmt(sql);
				
				pstmt.setString(1, vo.getSubject()); //pstmt 변수를 사용하려면 지금 DBConnection은 다른 패키지에 있으니까 DBConnection에서 변수설정을 protected이상으로 해줘야한다.
				pstmt.setString(2, vo.getContent());
				pstmt.setString(3, vo.getUserid());
				pstmt.setString(4, vo.getIp());
				
				cnt = pstmt.executeUpdate();
				
				
		}catch(Exception e) {
			System.out.println("게시판 글 등록 에러...."+ e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}
	//글수정--------------------------------------------------------------------------
	public int getUpdateRecord(int no, String subject, String content) {
		int result = 0;
		
		try{
			getConn();
			
			String sql = "update freeboard set subject=?, content=? where no=?";
			getPstmt(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("글수정 에러 발생..."+e.getMessage());
		}finally {
			getClose();
		}
		return result;
	}
	
	//글목록--------------------------------------------------------------------------
//1차
		// 글 목록에서 한페이지에 전체 레코드 출력하기. -> 페이지 기능 구현을 위해 주석처리하고 아래에 sql문 수정.
//	public List<FreeboardVO> getAllRecord() { 모든 레코드를 줄넘침없이 한페이지에 표시한다. 
//		List<FreeboardVO> list = new ArrayList<FreeboardVO>();
//		try {
//			getConn();
//			String sql = "select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') from freeboard order by no desc";
//			getPstmt(sql);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				FreeboardVO vo = new FreeboardVO();//레코드 한개를 담을 VO
//				vo.setNo(rs.getInt(1));
//				vo.setSubject(rs.getString(2));
//				vo.setUserid(rs.getString(3));
//				vo.setHit(rs.getInt(4));
//				vo.setWritedate(rs.getString(5));
//				list.add(vo);
//			}
//		}catch(Exception e) {
//			System.out.println("전체 레코드 선택에러 발생..."+e.getMessage());
//		}finally {
//			getClose();
//		}
//		return list;
//	}
	
	
	/*
	select * from   --페이지 만들기 쿼리문                --여기서 4는 현재 보고자 하는 페이지 수, 5는 한페이지당 보고자하는 레코드 수
	(select * from (select no, subject from freeboard order by no desc) where rownum<=5*5 order by no asc)
	where rownum<=5 order by no desc;
	*/
	
//------------------------------------------------------------------------------
//2차	
		//	 글 목록에서 페이지 만들기작업			현재페이지,    1페이지당 표시할 레코드수
//	public List<FreeboardVO> getAllRecord(int nowPage, int onePageRecord) {
//		List<FreeboardVO> list = new ArrayList<FreeboardVO>();
//		try {
//			getConn();
//			String sql = "select * from"
//					+ "(select * from "
//					+ "(select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate "
//					+ "from freeboard order by no desc)"
//					+ " where rownum<=? order by no asc)"
//					+ " where rownum<=? order by no desc";
//			getPstmt(sql);
//			pstmt.setInt(1, nowPage*onePageRecord);
//			pstmt.setInt(2, onePageRecord);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				FreeboardVO vo = new FreeboardVO();//레코드 한개를 담을 VO
//				vo.setNo(rs.getInt(1));
//				vo.setSubject(rs.getString(2));
//				vo.setUserid(rs.getString(3));
//				vo.setHit(rs.getInt(4));
//				vo.setWritedate(rs.getString(5));
//				list.add(vo);
//			}
//		}catch(Exception e) {
//			System.out.println("전체 레코드 선택에러 발생..."+e.getMessage());
//		}finally {
//			getClose();
//		}
//		return list;
//	}
	
//3차	
	//	 글 목록에서 페이지 만들기작업	위에 더해서 마지막페이지 구현을 위해 매개변수 추가하고 쿼리문 수정
public List<FreeboardVO> getAllRecord(int nowPage, int onePageRecord, int totalPage, int totalRecord) {
	List<FreeboardVO> list = new ArrayList<FreeboardVO>();
	try {
		getConn();
		String sql = "select * from"
				+ "(select * from "
				+ "(select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate "
				+ "from freeboard order by no desc)"
				+ " where rownum<=? order by no asc)"
				+ " where rownum<=? order by no desc";
		getPstmt(sql);
		pstmt.setInt(1, nowPage*onePageRecord);
		
		if(nowPage!=totalPage) { //현재 페이지가 마지막 페이지냐 아니냐. 마지막 페이지가 아닐때
			pstmt.setInt(2, onePageRecord);
		}else { //마지막 페이지일때
			// pstmt.setInt(2, totalRecord%onePageRecord); 
			// 이대로 하면 레코드의 갯수가 딱 떨어져서 0이되면 아예 나오지 않는다. 그래서 if문 하나 더 추가
			int mod = totalRecord%onePageRecord;
			if(mod==0) {
				pstmt.setInt(2, onePageRecord);
			}else {
				pstmt.setInt(2, mod); //총 레코드 수를 한페이지당 출력할 레코드로 나눠서 나머지값을 구한다.
			}
		}
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			FreeboardVO vo = new FreeboardVO();//레코드 한개를 담을 VO
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setUserid(rs.getString(3));
			vo.setHit(rs.getInt(4));
			vo.setWritedate(rs.getString(5));
			list.add(vo);
		}
	}catch(Exception e) {
		System.out.println("전체 레코드 선택에러 발생..."+e.getMessage());
	}finally {
		getClose();
	}
	return list;
}
	
	
	//레코드 1개 선택--------------------------------------------------------------------------
	public FreeboardVO getOneRecordSelect(int no, int part) { //여러 데이터를 가져와야하니까 VO로
		FreeboardVO vo = new FreeboardVO();
		try {
			//조회수 증가
			if(part==1) { //보드뷰에서 들어온거면 조회수증가1 다른곳에서왔으면 조회수증가안함.
			hitCount(no);
			}
			getConn();
			String sql ="select no, subject, content, userid, hit, writedate from freeboard where no=?";
			getPstmt(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			if(rs.next()) { //if문 하는 이유. 목록을 가져왔는데 그사이에 글쓴이가 글을 지우면 그 글을 눌러서 들어가도 데이터가 없어서 에러발생.
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setUserid(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setWritedate(rs.getString(6));
			}
			
		}catch(Exception e) {
			System.out.println("레코드 선택에러 발생..."+e.getMessage());
		}finally {
			getClose();
		}
		
		return vo;
		
		
	}
	//글삭제--------------------------------------------------------------------------
	public int getDeleteRecord(int no) {
		int result=0;
		try {
			getConn();
			String sql = "delete from freeboard where no=?";
			pstmt = conn.prepareStatement(sql);  //getPstmt(sql) 만들어논것도 있다.
			
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("레코드 삭제 에러 발생..."+e.getMessage());
		}finally {
			getClose();
		}
		
		
		return result;
	}
	//조회수증가--------------------------------------------------------------------------
	public void hitCount(int no) { //레코드 번호를 받아서 그 글을 업데이트
		try {
			getConn();
			String sql = "update freeboard set hit=hit+1 where no=?";
			getPstmt(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("조회수 증가 에러 발생..."+e.getMessage());
		}finally {
			getClose();
		}
	}
	//총레코드수--------------------------------------------------------------------------
	public int getTotalRecord() { //검색어가 있다면 매개변수 있어야함. 그 검색어에 해당하는게 몇개인지 찾을 수 있다.
		int totalRecord=0;
		try {
			getConn();
			String sql = "select count(no) from freeboard";
			getPstmt(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalRecord = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("총레코드수 구하기에서 에러발생."+e.getMessage());
		}finally {
			getClose();
		}
		return totalRecord;
	}	
}
