package kr.co.kmarket.db;

public class BoardSql {
	
	public static final String INSERT_ARTICLE = "INSERT INTO `km_cs_article` set "
												+ "`uid`=?, `group`=?, "
												+ "`c1Name`=?, `cate2`=?, "
												+ "`title`=?, `content`=?, "
												+ "`regip`=?, `rdate`=NOW()";
	
	public static final String INSERT_NOTICE_ARTICLE = "INSERT INTO `km_cs_article` set "
													+ "`uid`=?, `group`=?, "
													+ "`c1Name`=?, "
													+ "`title`=?, `content`=?, "
													+ "`regip`=?, `rdate`=NOW()";
	
	public static final String INSERT_FAQ_ARTICLE = "INSERT INTO `km_cs_article` set "
													+ "`uid`=?, `group`=?, "
													+ "`c1Name`=?, `cate2`=?, "
													+ "`title`=?, `content`=?, "
													+ "`regip`=?, `rdate`=NOW()";
	
	public static final String SELECT_ARTICLE = "SELECT a.*, b.cate1 FROM `km_cs_article` AS a "
												+ "JOIN `km_cs_cate1` AS b "
												+ "ON a.c1Name = b.c1Name "
												+ "WHERE `no`=? AND a.c1Name=?";
	
	public static final String SELECT_VIEW_ARTICLE = "SELECT a.*, b.cate1 FROM `km_cs_article` AS a "
												+ "JOIN `km_cs_cate1` AS b "
												+ "ON a.c1Name = b.c1Name "
												+ "WHERE `no`=?";
	
	public static final String SELECT_ARTICLES = "SELECT * FROM `km_cs_article` "
												+ "where `group`=? and `c1Name`=? "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_ALL_ARTICLES = "SELECT * FROM `km_cs_article` "
													+ "where `group`=? "
													+ "ORDER BY `no` DESC "
													+ "LIMIT ?, 10";
	
	public static final String SELECT_QNA_ARTICLES = "SELECT * FROM `km_cs_article` WHERE `group`='qna' ORDER BY `rdate` DESC LIMIT 5";
	
	public static final String SELECT_NOTICE_ARTICLES = "SELECT * FROM `km_cs_article` WHERE `group`='notice' ORDER BY `rdate` DESC LIMIT 5";
	
	public static final String SELECT_FAQ_ARTICLES = "SELECT * FROM `km_cs_article` "
													+ "WHERE `group`=? and `c1Name`=? "
													+ "ORDER BY `no` DESC";
	
	public static final String SELECT_ADMIN_ARTICLE = "SELECT a.*, b.cate1 FROM `km_cs_article` AS a "
													+ "JOIN `km_cs_cate1` AS b ON a.c1Name = b.c1Name "
													+ "WHERE a.group = ? ORDER BY `no` DESC "
													+ "LIMIT ?, 10"; 
	
	public static final String SELECT_ADMIN_ARTICLE1 = "SELECT a.*, b.cate1 FROM `km_cs_article` AS a "
													+ "JOIN `km_cs_cate1` AS b ON a.c1Name = b.c1Name "
													+ "WHERE a.group = ? and a.c1Name = ? ORDER BY `no` DESC "
													+ "LIMIT ?, 10"; 
	
	public static final String SELECT_ADMIN_ARTICLE2 = "SELECT a.*, b.cate1 FROM `km_cs_article` AS a "
													+ "JOIN `km_cs_cate1` AS b ON a.c1Name = b.c1Name "
													+ "WHERE a.group = ? and a.c1Name = ? and a.cate2 = ? ORDER BY `no` DESC "
													+ "LIMIT ?, 10"; 
	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `km_cs_article` WHERE `group`=?";
	
	public static final String SELECT_COUNT_TOTAL1 = "SELECT COUNT(`no`) FROM `km_cs_article` WHERE `c1Name`=? and `group`=?";
	
	public static final String SELECT_COUNT_TOTAL2 = "SELECT COUNT(`no`) FROM `km_cs_article` WHERE `c1Name`=? and `cate2`=? and `group`=?";
	
	public static final String SELECT_CATE1 = "SELECT * FROM `km_cs_cate1`";
	
	public static final String SELECT_CATE2 = "SELECT * FROM `km_cs_cate2` WHERE `c1Name`=?";
	
	public static final String SELECT_COUNT_CATE2 = "SELECT `cate2No` FROM `km_cs_cate2` WHERE `c1Name`=?";
	
	public static final String UPDATE_ARTICLE = "UPDATE `km_cs_article` SET `title`=?, `content`=? WHERE `no`=?";
	
	public static final String UPDATE_NOTICE_ARTICLE = "UPDATE `km_cs_article` SET `c1Name`=?, `title`=?, `content`=? , `rdate`=NOW() WHERE `no`=?";
	
	public static final String UPDATE_FAQ_ARTICLE = "UPDATE `km_cs_article` SET `c1Name`=?, `cate2`=?, `title`=?, `content`=? , `rdate`=NOW() WHERE `no`=?";
	
	public static final String DELETE_ARTICLE = "DELETE FROM `km_cs_article` WHERE `no`=?";
	

}
