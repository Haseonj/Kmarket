package kr.co.kmarket.db;

public class MemberSql {

	public static final String SELECT_MEMBER  = "select * from `km_member` where `uid`=? and `pass`=SHA2(?, 256)";
	public static final String INSERT_MEMBER= "insert into `km_member` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`gender`=?,"
											+ "`email`=?,"
											+ "`type`=1,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	public static final String INSERT_SELLER_MEMBER= "insert into `km_member` set "
			+ "`uid`=?,"
			+ "`pass`=SHA2(?, 256),"
			+ "`company`=?,"
			+ "`ceo`=?,"
			+ "`gender`=3,"
			+ "`bizRegNum`=?,"
			+ "`comRegNum`=?,"
			+ "`type`=1,"
			+ "`tel`=?,"
			+ "`hp`=?,"
			+ "`fax`=?,"
			+ "`email`=?,"
			+ "`zip`=?,"
			+ "`addr1`=?,"
			+ "`addr2`=?,"
			+ "`name`=?,"
			+ "`regip`=?,"
			+ "`rdate`=NOW()";
	public static final String SELECT_TERMS = "select * from `km_member_terms`";
	
	public static final String SELECT_COUNT_UID = "select count(`uid`) from `km_member` where `uid`=?";
	public static final String UPDATE_USER_FOR_SESSION_OUT = "UPDATE `board_user` SET `sessId`=NULL, `sessLimitDate`=NULL WHERE `uid`=?";
}
