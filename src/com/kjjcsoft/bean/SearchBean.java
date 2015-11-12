/**
 * 
 */
package com.kjjcsoft.bean;

/**
 * @author Seekraw
 *
 */
public class SearchBean {
	private String searchQuery;

	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}
	public int validate(){
		int retVal;
		if (searchQuery.matches("\\d+")) {
			retVal=1;
		} else if(searchQuery.matches("\\w*\\s\\w*")){
			retVal= 2;
		} else if(searchQuery.length()<1){
			retVal= 3;
		} else {
			retVal = 0;
		}
		return retVal;
	}
}
