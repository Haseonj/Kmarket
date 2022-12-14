package kr.co.kmarket.db;

public class BoardSql {
	
	
	
	public static final String INSERT_QNA_ARTICLE = "INSERT INTO `km_cs_qna` set "
												+ "`uid`=?, "
												+ "`cate1`=?, `cate2`=?, "
												+ "`title`=?, `content`=?, "
												+ "`regip`=?, `rdate`=NOW()";
	
	public static final String INSERT_NOTICE_ARTICLE = "INSERT INTO `km_cs_notice` set "
													+ "`uid`=?, `cate1`=?, "
													+ "`title`=?, `content`=?, "
													+ "`regip`=?, `rdate`=NOW()";
	
	public static final String INSERT_FAQ_ARTICLE = "INSERT INTO `km_cs_faq` set "
													+ "`uid`=?, "
													+ "`cate1`=?, `cate2`=?, "
													+ "`title`=?, `content`=?, "
													+ "`regip`=?, `rdate`=NOW()";
	
	public static final String INSERT_ANSWER = "INSERT INTO `km_cs_qna` set "
												+ "`uid`=?, `title`=null, "
												+ "`content`=?, `regip`=?, "
												+ "`rdate`=NOW(), `parent`=?";
	
	public static final String SELECT_QNA_ARTICLE = "SELECT a.*, b.c1Name FROM `km_cs_qna` AS a "
												+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
												+ "WHERE `no`=?";
	
	public static final String SELECT_NOTICE_ARTICLE = "SELECT a.*, b.c1Name FROM `km_cs_notice` AS a "
													+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
													+ "WHERE `no`=?";
	
	public static final String SELECT_FAQ_ARTICLE = "SELECT a.*, b.c1Name FROM `km_cs_faq` AS a "
													+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
													+ "WHERE `no`=?";
	
	
	public static final String SELECT_ANSWER = "SELECT * FROM `km_cs_qna` WHERE `parent`=?";
	
	public static final String SELECT_QNA_ARTICLES = "SELECT * FROM `km_cs_qna` WHERE `cate1`=? ORDER BY `rdate` DESC LIMIT ?, 10";
	
	public static final String SELECT_QNA_ARTICLES_INDEX = "SELECT * FROM `km_cs_qna` WHERE `parent`='0' ORDER BY `no` DESC LIMIT 5";
	
	public static final String SELECT_NOTICE_ARTICLES = "SELECT a.*, b.c1Name FROM `km_cs_notice` AS a "
														+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
														+ "WHERE a.cate1=? ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_NOTICE_ARTICLES_INDEX = "SELECT * FROM `km_cs_notice` ORDER BY `no` DESC LIMIT 5";
	
	public static final String SELECT_QNA_ARTICLES_ALL = "SELECT a.*, b.c1Name FROM `km_cs_notice` AS a "
														+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
														+ "ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_NOTICE_ARTICLES_ALL = "SELECT a.*, b.c1Name FROM `km_cs_notice` AS a "
															+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
															+ "ORDER BY `no` DESC LIMIT ?, 10";
	
	
	
	public static final String SELECT_FAQ_ARTICLES = "SELECT * FROM `km_cs_faq` WHERE `cate1`=? ORDER BY `no` DESC";
	
	public static final String SELECT_QNA_ARTICLES_ADMIN_ALL = "SELECT a.*, b.c1Name FROM `km_cs_qna` AS a "
															+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
															+ "ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_FAQ_ARTICLES_ADMIN_ALL = "SELECT a.*, b.c1Name FROM `km_cs_faq` AS a "
															+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
															+ "ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_FAQ_ARTICLES_ADMIN = "SELECT a.*, b.c1Name FROM `km_cs_faq` AS a "
														+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
														+ "WHERE a.cate1=? ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_QNA_ARTICLES_ADMIN = "SELECT a.*, b.c1Name FROM `km_cs_qna` AS a "
														+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
														+ "WHERE a.cate1=? ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_FAQ_ARTICLES_ADMIN_CATE2 = "SELECT a.*, b.c1Name FROM `km_cs_faq` AS a "
																+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
																+ "WHERE a.cate1=? AND a.cate2=? "
																+ "ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_QNA_ARTICLES_ADMIN_CATE2 = "SELECT a.*, b.c1Name FROM `km_cs_qna` AS a "
																+ "JOIN `km_cs_cate1` AS b ON a.cate1 = b.cate1 "
																+ "WHERE a.cate1=? AND a.cate2=? "
																+ "ORDER BY `no` DESC LIMIT ?, 10";
	
	public static final String SELECT_QNA_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `km_cs_qna` WHERE `cate1`=?";
	
	public static final String SELECT_NOTICE_COUNT_TOTAL_ALL = "SELECT COUNT(`no`) FROM `km_cs_notice`";
	
	public static final String SELECT_FAQ_COUNT_TOTAL_ALL = "SELECT COUNT(`no`) FROM `km_cs_faq`";
	
	public static final String SELECT_QNA_COUNT_TOTAL_ALL = "SELECT COUNT(`no`) FROM `km_cs_qna`";
	
	public static final String SELECT_NOTICE_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `km_cs_notice` WHERE `cate1`=?";
	
	public static final String SELECT_FAQ_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `km_cs_faq` WHERE `cate1`=?";
	
	public static final String SELECT_FAQ_CATE2_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `km_cs_faq` WHERE `cate1`=? AND `cate2`=?";
	
	public static final String SELECT_QNA_CATE2_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `km_cs_qna` WHERE `cate1`=? AND `cate2`=?";
	
	public static final String UPDATE_NOTICE_ARTICLE = "UPDATE `km_cs_notice` SET `cate1`=?, `title`=?, `content`=? WHERE `no`=?";
	
	public static final String UPDATE_FAQ_ARTICLE = "UPDATE `km_cs_faq` SET `cate1`=?, `cate2`=?, `title`=?, `content`=? WHERE `no`=?";
	
	
	public static final String UPDATE_ARTICLE_COMMENT_PLUS = "UPDATE `km_cs_qna` SET `comment` = `comment` + 1 WHERE `no`=?";
	
	public static final String DELETE_NOTICE_ARTICLE = "DELETE FROM `km_cs_notice` WHERE `no`=?";
	
	public static final String DELETE_FAQ_ARTICLE = "DELETE FROM `km_cs_faq` WHERE `no`=?";
	

}
