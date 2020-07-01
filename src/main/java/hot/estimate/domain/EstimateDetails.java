package hot.estimate.domain;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EstimateDetails {
	public static Map<String, String> getDetail(Object obj) throws IllegalArgumentException, IllegalAccessException {
		Field[] superFields = obj.getClass().getDeclaredFields();
		Map<String, String> map = new HashMap<>();
		List<Object> estimateFieldObjs = new ArrayList<>();
		
		//각 필드로 오브젝트 생성
		for(Field superField : superFields) {
			superField.setAccessible(true);
			Object estimateFieldObj = superField.get(obj);
			if(estimateFieldObj instanceof EstimateSecondaryTable) {
				estimateFieldObjs.add(estimateFieldObj);
			}	
		}
		
		//오브젝트 List로 Field받아오고 값 및 필드이름을 꺼내온 뒤 맵으로 추가
		for(Object estimateFieldObj : estimateFieldObjs) {
			Field[] fields = estimateFieldObj.getClass().getDeclaredFields();
			for(Field field : fields) {
				System.out.println("thrid loop");
				field.setAccessible(true);
				String fieldName = field.getName();
				Integer fieldValue = (Integer) field.get(estimateFieldObj);			
//				System.out.println(fieldName+":"+fieldValue);
				
				if(fieldValue==null)continue;
					
				switch(fieldName) {
					case "paperingType" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "합지");break;
						case 1 : map.put(fieldName, "실크");break;				
						case 2 : map.put(fieldName, "합지+실크");break;		
						}; break;
					case "paperingArea" : 
						map.put(fieldName, fieldValue.toString()); break;
					case "paperingNumberOfRooms" : 
						map.put(fieldName, fieldValue.toString()); break;
					case "paperingCeiling" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "포함");break;
						case 1 : map.put(fieldName, "미포함");break;		
						}; break;
					case "paperingVeranda" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "확장됨");break;
						case 1 : map.put(fieldName, "확장안됨");break;	
						}; break;
					case "paperingBurdon" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "짐있음");break;
						case 1 : map.put(fieldName, "짐없음");break;			
						}; break;
				
					case "linoleumThick" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "1.8");break;
						case 1 : map.put(fieldName, "2.0");break;				
						case 2 : map.put(fieldName, "2.2");break;		
						}; break;
					case "linoleumArea" : 
						map.put(fieldName, fieldValue.toString()); break;
					case "linoleumNumberOfRooms" : 
						map.put(fieldName, fieldValue.toString()); break;
					case "linoleumVeranda" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "확장됨");break;
						case 1 : map.put(fieldName, "확장안됨");break;	
						}; break;
					case "linoleumCurrentFloor" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "장판");break;
						case 1 : map.put(fieldName, "마루");break;				
						case 2 : map.put(fieldName, "없음");break;		
						}; break;
					case "linoleumBurdon" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "짐있음");break;
						case 1 : map.put(fieldName, "짐없음");break;			
						}; break;
						
				
					case "floorType" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "강마루");break;
						case 1 : map.put(fieldName, "강화마루");break;				
						case 2 : map.put(fieldName, "원목마루");break;			
						case 3 : map.put(fieldName, "온돌마루");break;			
						}; break;
					case "floorArea" : 
						map.put(fieldName, fieldValue.toString()); break;
					case "floorNumberOfRooms" : 
						map.put(fieldName, fieldValue.toString()); break;
					case "floorVeranda" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "확장됨");break;
						case 1 : map.put(fieldName, "확장안됨");break;			
						}; break;
					case "floorCurrentFloor" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "장판");break;
						case 1 : map.put(fieldName, "마루");break;				
						case 2 : map.put(fieldName, "없음");break;			
						}; break;
					case "floorBurdon" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "짐있음");break;
						case 1 : map.put(fieldName, "짐없음");break;			
						}; break;
				
					case "bathroomNumberOfRooms" : 
						map.put(fieldName, fieldValue.toString()); break;
					case "bathroomType" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "욕조형");break;
						case 1 : map.put(fieldName, "샤워부스형");break;				
						case 2 : map.put(fieldName, "파우더형");break;			
						}; break;
					case "bathroomCeiling" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "리빙우드");break;
						case 1 : map.put(fieldName, "SMC돔");break;				
						}; break;
					case "bathroomTile" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "벽");break;
						case 1 : map.put(fieldName, "바닥");break;
						case 2 : map.put(fieldName, "벽+바닥");break;				
						}; break;	
				
					case "kitchenType" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "일자형");break;
						case 1 : map.put(fieldName, "기억형");break;
						case 2 : map.put(fieldName, "디귿형");break;				
						}; break;				
					case "kitchenMaxWidth" : 
						map.put(fieldName, fieldValue.toString()); break;				
					case "kitchenCountertop" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "PT");break;
						case 1 : map.put(fieldName, "인조대리석");break;				
						}; break;
					case "kitchenDoor" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "하이그로시");break;
						case 1 : map.put(fieldName, "PET");break;
						case 2 : map.put(fieldName, "엘전사");break;				
						case 3 : map.put(fieldName, "UV도장");break;				
						case 4 : map.put(fieldName, "원목");break;				
						}; break;
					case "kitchenTile" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "기존유지");break;
						case 1 : map.put(fieldName, "교체시공");break;			
						}; break;
					
					case "tileType" : 
						switch(fieldValue) {
						case 0 : map.put(fieldName, "주방");break;
						case 1 : map.put(fieldName, "현관");break;
						case 2 : map.put(fieldName, "발코니");break;				
						case 3 : map.put(fieldName, "바닥");break;				
						}; break;
					case "tileArea" : 
						map.put(fieldName, fieldValue.toString()); break;
				}
			}		
		}
		map.keySet().forEach(key->System.out.println(key));
		return map;
	}	
}
