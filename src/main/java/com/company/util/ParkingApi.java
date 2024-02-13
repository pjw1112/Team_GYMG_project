package com.company.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

@Component
public class ParkingApi {
	public void test_api(String areaCode) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
		/*URL*/
		urlBuilder.append("/" + URLEncoder.encode("4f485544446d6f6f39386142554c53","UTF-8") ); /*인증키
		(sample사용시에는 호출시 제한됩니다.)*/
		urlBuilder.append("/" + URLEncoder.encode("xml","UTF-8") ); /*요청파일타입
		(xml,xmlf,xls,json) */
		urlBuilder.append("/" + URLEncoder.encode("citydata","UTF-8"));
		/*서비스명 (대소문자 구분 필수입니다.)*/
		urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치
		(sample인증키 사용시 5이내 숫자)*/
		urlBuilder.append("/" + URLEncoder.encode("2","UTF-8"));
		/*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
		// 서비스별별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에
//		자세히 나와 있습니다.
		
		
		urlBuilder.append("/" + URLEncoder.encode(areaCode,"UTF-8")); /* 서비스별
		추가 요청인자들*/
		URL url = new URL(urlBuilder.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		System.out.println("Response code: " + conn.getResponseCode()); 
		/* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
		BufferedReader rd;
		// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line + "\n");
		}
		rd.close();
		conn.disconnect();
		String result = "";
		result = sb.toString();
		
//		System.out.println("!!!!!!!!!!!!!!!" + sb.toString());
//		parseXml(sb.toString());

		String folder_path = urlBuilder.toString();
		String file_path   = "api.xml"; 
		Path   path = Paths.get(folder_path + file_path);
		File   file = new File(folder_path + file_path);
		
		
		try {
			BufferedWriter bw = 
					Files.newBufferedWriter(path, StandardCharsets.UTF_8);
			bw.write(result);
			bw.close();
			System.out.println("#2. xml 파일로 저장성공!");
		} catch (IOException e) { e.printStackTrace(); }
		
		//#3. #2 에서 저장한 xml을  읽어오기
		// DocumentBuilderFactory  ~ 이용!
		DocumentBuilderFactory factory = 
								DocumentBuilderFactory.newInstance();
		DocumentBuilder     builder= factory.newDocumentBuilder();
		Document dom = builder.parse(file);//parse
		NodeList nodeList = dom.getElementsByTagName("CITYDATA");//getElementsByTagName
		
		// nodeList ->[ data,data,data,data ]
		for(int i=0; i<nodeList.getLength(); i++) {
			Node node = nodeList.item(i);  // Data[0] { 공백<hour>24</hour>공백<day>3</day> }
			NodeList  child = node.getChildNodes();  //{ 공백<hour>24</hour>공백<day>3</day> }
			for(int j=0; j<child.getLength(); j++) {
				Node data = child.item(j);  //<hour>24</hour>
				if(data.getNodeType() == Node.ELEMENT_NODE) {
					String name  = data.getNodeName(); //hour
					String value = data.getTextContent();//24
						  if(name.equals("LIVE_PPLTN_STTS")) {
						System.out.println("LIVE_PPLTN_STTS\t:" + value);
					}else if(name. equals("ROAD_TRAFFIC_STTS")) {
						System.out.println("ROAD_TRAFFIC_STTS\t:" + value);
					}else if(name.equals("PRK_STTS")) {
						System.out.println("PRK_STTS\t:" + value);
					}
				}
			}// end for
			System.out.println("=============");
		}// end for
			
	

		
	
	
//	private void parseXml(String xmlData) throws SAXException, IOException, ParserConfigurationException {
//		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
//		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
//		
//		InputSource is = new InputSource(new StringReader(xmlData));
//		
//		Document doc = dBuilder.parse(is);
//		
//		NodeList nList = doc.getElementsByTagName("PRK_STTS");
//		
//		for(int i=0; i<nList.getLength(); i++) {
//			Node pNode = nList.item(i);
//			System.out.println(">>>>>>>>>>>>>>>>>>>>> " + pNode);
//			String pData = getNodeValue(pNode);
//			System.out.println("..................." + pData);
//		}
//		
//		
////		System.out.println(nList);
//	}
//	
//	private String getNodeValue(Node node) {
//		StringBuilder value = new StringBuilder();
//		NodeList childNodes = node.getChildNodes();
//		
//		for(int i=0; i<childNodes.getLength(); i++) {
//			Node childNode = childNodes.item(i);
//			value.append(childNode.getNodeValue());
//		}
//		return value.toString();
//	}
//	
	
	}
}
