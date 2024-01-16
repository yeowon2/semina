package kr.co.kwins.bookshop.pager;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 10; // 페이지마다 나타나는 게시글의 수 
	private float total; // 전체 게시글
	private int perGroup = 5; // 페이지를 어느 정도 나타낼 것인지 
	
	private int search;
	private String keyword;
	
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getPerGroup() {
		return perGroup;
	}
	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getLast() {
		return (int) Math.ceil(total/perPage);
		// 뒤의 소수점을 버리지 않기 위해서 ceiling으로 올림해주고 int로 casting해줌
	}
	public int getPrev() {
		return page <= perGroup ? 1 : (((page - 1) / perGroup) - 1 ) * perGroup + 1;
		// 맨 앞 페이지에 있으면 그냥 1번 페이지로 가게끔 삼항조건식?을 사용해줌 
	}
	public int getNext() {
		int next =  (((page - 1) / perGroup) + 1 ) * perGroup + 1;
		int last = getLast();
		
		return next > last ? last : next;
	}
	public List<Integer> getList(){
		List<Integer> list = new ArrayList<>();
		
		// 페이지 값이 있는 경우
		int startPage = (((page - 1) / perGroup) + 0) * perGroup + 1;
		
		for(int i = startPage; i < (startPage + perGroup) &&  i <= getLast(); i++) {
			list.add(i);
		}
		
		// 만약 페이지 값을 주지 않은 경우
		if(list.isEmpty())
			list.add(1);
		
		return list;
	}
	public String getQuery() {
		if(search >= 1 && search <=3)
			return "search=" + search + "&keyword=" + keyword;
		
		return "";
	}
}
