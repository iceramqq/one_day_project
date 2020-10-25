package com.biz.team.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("fileServiceV1")
public class FileServiceImplV1 implements FileService{

	@Autowired
	private ResourceLoader resourceLoader;
	
	@Override
	public String fileUp(MultipartFile file) {
		
		Resource resource = resourceLoader.getResource("/resources/img");
		String saveFileName = "";
		
		
		try {
			
			String rootFolder = resource.getURI().getPath();
			log.debug(rootFolder.toString());
			if(file == null) {
				return null;
			}
			
			File dir = new File(rootFolder);
			
			// file을 upload할 폴더를 검사하여 없으면 새로 생성해달라
			if(!dir.exists()) {
				// mkdir()은 제일끝의 폴더 1개만 생성
				// mkdirs() 모든 경로의 폴더를 한꺼번에 생성
				dir.mkdirs();
			}
			
			// 원본 파일이름 된다.
			String originalFileName = file.getOriginalFilename();
			
			/*
			 * 원본 파일이름을 임의 값을 부착한 변형된 파일 이름으로 바꾸기
			 * 1. UUID값을 생성하고
			 * 2. 원본 파일이름에 UUID를 부착하기
			 * 3. UUID값이 부착된 파일이름은 서버에 업로드가 될것이고
			 * 만약 해커가 해당 파일이름을 알게되어 동일한 이름의 파일을 만들어 
			 * 업로드하면, 다시 새로운 UUID가 부착되어 원래 저장된 파일을 보호한다.
			 */
			
			String strUUID = UUID.randomUUID().toString();
			saveFileName = strUUID + originalFileName;
			
			// 서버의 저장폴더 + 파일이름을 합성하여 파일 저장 준비
			File saveFile = new File(rootFolder,saveFileName);
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// UUID가 부착된 파일이름을 controller로  return하여 DB에 저장하는 용도로
		return saveFileName;
	}

	/*
	 * 파일이름을 받아서 파일을 삭제
	 */
	@Override
	public boolean fileDelete(String h_file) {
		
		boolean ret = false;
		Resource resource = resourceLoader.getResource("/resources/img");
		String rootFolder;
		try {
			rootFolder = resource.getURI().getPath();
			File deleteFile = new File(rootFolder,h_file);
			if(deleteFile.exists()) {
				// 파일을 삭제하면 true return
				ret = deleteFile.delete();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}

}
