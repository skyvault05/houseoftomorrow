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
				field.setAccessible(true);
				String fieldName = field.getName();
				Integer fieldValue = (Integer) field.get(estimateFieldObj);
				if(fieldValue==null)continue;
				switch(fieldName) {
					case "paperingType" : 
						switch(fieldValue) {
						case 0 : map.put("[벽지]벽지종류:", "합지");break;
						case 1 : map.put("[벽지]벽지종류:", "실크");break;				
						case 2 : map.put("[벽지]벽지종류:", "합지+실크");break;		
						}; break;
					case "paperingArea" : 
						map.put("[벽지]면적:", fieldValue.toString()+"m²"); break;
					case "paperingNumberOfRooms" : 
						map.put("[벽지]방 개수:", fieldValue.toString()+"개"); break;
					case "paperingCeiling" : 
						switch(fieldValue) {
						case 0 : map.put("[벽지]천장:", "포함");break;
						case 1 : map.put("[벽지]천장:", "미포함");break;		
						}; break;
					case "paperingVeranda" : 
						switch(fieldValue) {
						case 0 : map.put("[벽지]베란다:", "확장됨");break;
						case 1 : map.put("[벽지]베란다:", "확장안됨");break;	
						}; break;
					case "paperingBurdon" : 
						switch(fieldValue) {
						case 0 : map.put("[벽지]:", "짐있음");break;
						case 1 : map.put("[벽지]:", "짐없음");break;			
						}; break;
				
					case "linoleumThick" : 
						switch(fieldValue) {
						case 0 : map.put("[장판]두께:", "1.8mm");break;
						case 1 : map.put("[장판]두께:", "2.0mm");break;				
						case 2 : map.put("[장판]두께:", "2.2mm");break;		
						}; break;
					case "linoleumArea" : 
						map.put("[장판]면적:", fieldValue.toString()+"m²"); break;
					case "linoleumNumberOfRooms" : 
						map.put("[장판]방 개수:", fieldValue.toString()+"개"); break;
					case "linoleumVeranda" : 
						switch(fieldValue) {
						case 0 : map.put("[장판]베란다:", "확장됨");break;
						case 1 : map.put("[장판]베란다:", "확장안됨");break;	
						}; break;
					case "linoleumCurrentFloor" : 
						switch(fieldValue) {
						case 0 : map.put("[장판]현재바닥:", "장판");break;
						case 1 : map.put("[장판]현재바닥:", "마루");break;				
						case 2 : map.put("[장판]현재바닥:", "없음");break;		
						}; break;
					case "linoleumBurdon" : 
						switch(fieldValue) {
						case 0 : map.put("[장판]상태:", "짐있음");break;
						case 1 : map.put("[장판]상태:", "짐없음");break;			
						}; break;
						
				
					case "floorType" : 
						switch(fieldValue) {
						case 0 : map.put("[마루]마루종류:", "강마루");break;
						case 1 : map.put("[마루]마루종류:", "강화마루");break;				
						case 2 : map.put("[마루]마루종류:", "원목마루");break;			
						case 3 : map.put("[마루]마루종류:", "온돌마루");break;			
						}; break;
					case "floorArea" : 
						map.put("[마루]면적:", fieldValue.toString()+"m²"); break;
					case "floorNumberOfRooms" : 
						map.put("[마루]방 개수:", fieldValue.toString()+"개"); break;
					case "floorVeranda" : 
						switch(fieldValue) {
						case 0 : map.put("[마루]베란다:", "확장됨");break;
						case 1 : map.put("[마루]베란다:", "확장안됨");break;			
						}; break;
					case "floorCurrentFloor" : 
						switch(fieldValue) {
						case 0 : map.put("[마루]현재바닥:", "장판");break;
						case 1 : map.put("[마루]현재바닥:", "마루");break;				
						case 2 : map.put("[마루]현재바닥:", "없음");break;			
						}; break;
					case "floorBurdon" : 
						switch(fieldValue) {
						case 0 : map.put("[마루]상태:", "짐있음");break;
						case 1 : map.put("[마루]상태:", "짐없음");break;			
						}; break;
				
					case "bathroomNumberOfRooms" : 
						map.put("[욕실]욕실 개수:", fieldValue.toString()+"개"); break;
					case "bathroomType" : 
						switch(fieldValue) {
						case 0 : map.put("[욕실]선호유형:", "욕조형");break;
						case 1 : map.put("[욕실]선호유형:", "샤워부스형");break;				
						case 2 : map.put("[욕실]선호유형:", "파우더형");break;			
						}; break;
					case "bathroomCeiling" : 
						switch(fieldValue) {
						case 0 : map.put("[욕실]천장유형:", "리빙우드");break;
						case 1 : map.put("[욕실]천장유형:", "SMC돔");break;				
						}; break;
					case "bathroomTile" : 
						switch(fieldValue) {
						case 0 : map.put("[욕실]타일시공장소:", "벽");break;
						case 1 : map.put("[욕실]타일시공장소:", "바닥");break;
						case 2 : map.put("[욕실]타일시공장소:", "벽+바닥");break;				
						}; break;	
				
					case "kitchenType" : 
						switch(fieldValue) {
						case 0 : map.put("[주방]싱크대종류:", "일자형");break;
						case 1 : map.put("[주방]싱크대종류:", "기억형");break;
						case 2 : map.put("[주방]싱크대종류:", "디귿형");break;				
						}; break;				
					case "kitchenMaxWidth" : 
						switch(fieldValue) {
						case 0 : map.put("[주방]가로사이즈:", "240CM");break;
						case 1 : map.put("[주방]가로사이즈:", "320CM");break;
						case 2 : map.put("[주방]가로사이즈:", "기타");break;				
						}; break;				
					case "kitchenCountertop" : 
						switch(fieldValue) {
						case 0 : map.put("[주방]상판유형:", "PT");break;
						case 1 : map.put("[주방]상판유형:", "인조대리석");break;				
						}; break;
					case "kitchenDoor" : 
						switch(fieldValue) {
						case 0 : map.put("[주방]도어유형:", "하이그로시");break;
						case 1 : map.put("[주방]도어유형:", "PET");break;
						case 2 : map.put("[주방]도어유형:", "엘전사");break;				
						case 3 : map.put("[주방]도어유형:", "UV도장");break;				
						case 4 : map.put("[주방]도어유형:", "원목");break;				
						}; break;
					case "kitchenTile" : 
						switch(fieldValue) {
						case 0 : map.put("[주방]벽타일:", "기존유지");break;
						case 1 : map.put("[주방]벽타일:", "교체시공");break;			
						}; break;
					
					case "tileType" : 
						switch(fieldValue) {
						case 0 : map.put("[타일]시공항목:", "주방");break;
						case 1 : map.put("[타일]시공항목:", "현관");break;
						case 2 : map.put("[타일]시공항목:", "발코니");break;				
						case 3 : map.put("[타일]시공항목:", "바닥");break;				
						}; break;
					case "tileArea" : 
						map.put("[타일]면적:", fieldValue.toString()+"m²"); break;
				}
			}		
		}
		return map;
	}	
}
