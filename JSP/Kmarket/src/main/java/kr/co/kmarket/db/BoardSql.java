package kr.co.kmarket.db;

public class BoardSql {
	
	public static final String INSERT_ARTICLE = "INSERT INTO `km_cs_article` set "
												+ "`uid`=?, `group`=?, "
												+ "`c1Name`=?, `cate2`=?, "
												+ "`title`=?, `content`=?, "
												+ "`regip`=?, `rdate`=NOW()";
	
	public static final String SELECT_ARTICLE = "SELECT * FROM `km_cs_article` WHERE `no`=?";
	
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
	
	public static final String SELECT_COUNT_CATE2 = "SELECT count('c1Name') FROM `km_cs_cate2` WHERE `c1Name`=?";
	
	public static final String UPDATE_ARTICLE = "UPDATE `km_cs_article` SET `title`=?, `content`=? WHERE `no`=?";
	

}
