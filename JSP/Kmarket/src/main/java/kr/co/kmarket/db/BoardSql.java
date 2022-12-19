package kr.co.kmarket.db;

public class BoardSql {
	
	public static final String INSERT_ARTICLE = "INSERT INTO `km_cs_article` set "
												+ "`uid`=?, `group`=?, "
												+ "`c1Name`=?, `cate2`=?, "
												+ "`title`=?, `content`=?, "
												+ "`regip`=?, `rdate`=NOW()";
	
	public static final String SELECT_ARTICLE = "SELECT a.*, b.cate1 FROM `km_cs_article` AS a "
												+ "JOIN `km_cs_cate1` AS b "
												+ "ON a.c1Name = b.c1Name "
												+ "WHERE `no`=? AND a.c1Name=?";
	
	public static final String SELECT_ARTICLES = "SELECT * FROM `km_cs_article` "
												+ "where `group`=? and `c1Name`=? "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_FAQ_ARTICLES = "SELECT * FROM `km_cs_article` "
													+ "WHERE `group`=? and `c1Name`=? "
													+ "ORDER BY `no` DESC";
	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `km_cs_article` WHERE `c1Name`=?";
	
	public static final String SELECT_CATE1 = "SELECT * FROM `km_cs_cate1`";
	
	public static final String SELECT_CATE2 = "SELECT * FROM `km_cs_cate2` WHERE `c1Name`=?";
	
	public static final String SELECT_COUNT_CATE2 = "SELECT `cate2No` FROM `km_cs_cate2` WHERE `c1Name`=?";
	

}
