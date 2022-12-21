package kr.co.kmarket.controller.product;

public class Unit {
	
	private static int seq;
	
	
    public static synchronized int getSeq(){
    	seq++;
    	
    	/*
    	String zerofill = "";
    	
    	if(seq >= 100 && seq < 1000) {
    		zerofill = "0"+seq;
    	}else if(seq >= 10 && seq < 100) {
    		zerofill = "00"+seq;
    	}else if(seq < 10) {
    		zerofill = "000"+seq;
    	}
    	*/
    	
        return seq;
    }
}
