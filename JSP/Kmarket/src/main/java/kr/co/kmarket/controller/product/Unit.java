package kr.co.kmarket.controller.product;

public class Unit {
	
	//static int last_seq;

	private static int seq = 1;
	
	 
	
    public static synchronized String getSeq(){
    	
    	String zerofill = "";
    	
    	if(seq >= 100 && seq < 1000) {
    		zerofill = "0"+seq;
    	}else if(seq >= 10 && seq < 100) {
    		zerofill = "00"+seq;
    	}else if(seq < 10) {
    		zerofill = "000"+seq;
    	}
    	
    	seq++;
    	
        return zerofill;
    }
}
