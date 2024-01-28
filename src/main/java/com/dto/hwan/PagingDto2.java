package com.dto.hwan;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class PagingDto2 {
	// 1. 전체글
	private int listtotal;
	// 2. 한페이지에 보여줄 게시물의 수
	private int onepagelimit;
	// 3. 총페이지계산   256/10=26  251/10=26
	private int pagetotal;
	// 4. 하단에 페이지 나누기 수
	private int bottomlimit;
	// 5. 페이지의 스타트 번호
	private int pstartno;
	// 6. 하단 현재번호
	private int current;
	// 7. 하단 시작
	private int start;
	// 8. 하단 끝
	private int end;
	
	private List<Object> list;

	public PagingDto2(int listtotal, int pstartno) {
		super();
		this.listtotal = listtotal; // 전체글
		this.onepagelimit = 10;
		this.pagetotal =  (int)Math.ceil((double)listtotal/onepagelimit);
		this.bottomlimit = 10;
		this.pstartno = pstartno;   // 시작번호
		
		this.current = (int) Math.ceil((pstartno) /(double)onepagelimit);
	
	}
	
	
}
