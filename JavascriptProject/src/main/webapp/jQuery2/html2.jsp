<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// <h1>jQuery2/html2.jsp</h1>
String id = request.getParameter("id");
String result="";
// if(id.equals("kim")){
// 	result = "아이디 중복";
// }else{
// 	result = "아이디 사용가능";
// }

		// 디비 연결정보 (상수)
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
	
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println(" 드라이버 로드 성공!");
		
		// 2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println(" 디비 연결 성공!");
		System.out.println(" con : " +con );
	
	
		// 3. SQL 작성 & pstmt 객체
		//String sql = "select * from itwill_member where gender=?";
		String sql = "select * from itwill_member where id=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
	
		//???
		pstmt.setString(1, id);	
		
		// 4. SQL 실행
		// * 실행구문은 sql 구문이 실행시 테이블에 영향을 주는지 판단
		
		// pstmt.executeUpdate(); : insert 구문, update 구문, delete 구문
		// pstmt.executeQuery();  : select 구문
		
		
		//ResultSet : select문의 결과 레코드셋이라는 데이터를 저장하는 객체
		ResultSet rs = pstmt.executeQuery();
		
		System.out.println(" SQL 실행 완료!");
		
		// 5. 데이터 처리
		// => 정보를 가져다가 출력
		
		// rs.next() : 레코드셋의 커서를 움직여서 데이터가 있는지 없는지 체크

		if(rs.next()){
			// 아이디 있음, 아이디 중복
			result = "아이디 중복";
		}else{
			// 아이디 없음, 아이디 사용가능
			result = "아이디 사용가능";
		}

%>
<%=id+" : " +result%>
