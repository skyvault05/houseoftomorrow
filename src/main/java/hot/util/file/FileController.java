package hot.util.file;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hot.aws.S3Manager;

@Controller
public class FileController {
	@Autowired
	S3Manager s3Manager;
	
	@PostMapping("/file")
	public ResponseEntity<?> handleImageUpload(@RequestParam("file") MultipartFile file) {
		String fileName;
		try {
			if (file.isEmpty()) {
				return new ResponseEntity("please select a file!", HttpStatus.OK);
			}
			fileName = s3Manager.saveUploadedFiles(file);
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
		return ResponseEntity.ok().body(fileName);
	}
}