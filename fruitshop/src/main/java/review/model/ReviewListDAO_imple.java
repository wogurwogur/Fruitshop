package review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import review.domain.ReviewListVO;

public class ReviewListDAO_imple implements ReviewListDAO {
	
	private DataSource ds;	// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		
		try {
			if(rs !=null) 	 {rs.close(); 	 rs=null;}
			if(pstmt !=null) {pstmt.close(); pstmt=null;}
			if(conn !=null)  {conn.close();  conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	} // end of private void close() { --------------------
	
	
	
	
	// 구매후기 게시글(리뷰)리스트 전부 보여주는 메소드
	@Override
	public List<ReviewListVO> reviewListall() throws SQLException {
		
		List<ReviewListVO> revList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select review_no, review_title, review_contents, review_status, review_viewcount "
						+ " from tbl_reviews "
						+ " where review_status = 1 "
						+ " order by review_no ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReviewListVO revvo = new ReviewListVO();
				revvo.setReview_no(rs.getInt("review_no"));
				revvo.setReview_title(rs.getString("review_title"));
				revvo.setReview_contents(rs.getString("review_contents"));
				revvo.setReview_viewcount(rs.getString("review_viewcount"));
				
				revList.add(revvo);
								
				
			} // end of while ----------------		

									
		} finally {
			close();
		}
			
		
		  
		return revList;
	}
	
	

} // end of public class ReviewListDAO_imple implements ReviewListDAO {