package com.godsky.findlove.user.model.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.godsky.findlove.user.model.vo.ImageFile;

@Service
public class ImageService {

	private Map imageFilesMap;

	public ImageService() {
		init();
	}

	// 초기화
	private void init() {
		imageFilesMap = new HashMap();

	}

	// id로 이미지파일 가져오기
	public ImageFile get(String user_id) {
		return (ImageFile) imageFilesMap.get(user_id);

	}

	public ImageFile save(MultipartFile multipartFile) {
		String genId = UUID.randomUUID().toString();
		ImageFile imageFile = null;

		try {
			String savedFileName = saveToFile(multipartFile, genId);
			imageFile = new ImageFile(savedFileName, genId, multipartFile.getContentType(), (int)multipartFile.getSize());
			imageFilesMap.put(genId, imageFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imageFile;

	}

	// 저장후 저장된 파일 이름 반환
	private String saveToFile(MultipartFile src, String user_id) throws IOException {
		String fileName = src.getOriginalFilename();
		byte[] bytes = src.getBytes();
		String saveFileName = user_id + "." + getExtension(fileName);
		String savePath = ImageFile.IMAGE_DIR + saveFileName;

		// 파일 쓰기
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(savePath));
		bos.write(bytes);
		bos.flush();
		bos.close();

		return saveFileName;

	}

	// 파일이름으로부터 확장자 반환
	// 파일 이름에 확장자 구분을 위한 .문자가 없거나 가장 끝에 있는 경우는 빈 문자열 ""을 리턴
	private String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');

		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}

}
