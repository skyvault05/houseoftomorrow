package hot.aws;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
@Service
public class S3Manager {
   
   private static final AWSCredentials credentials = new BasicAWSCredentials(
         "id", 
         "secret"
         );
   
   private static final AmazonS3 s3client = AmazonS3ClientBuilder
           .standard()
           .withCredentials(new AWSStaticCredentialsProvider(credentials))
           .withRegion(Regions.AP_NORTHEAST_2)
           .build();
      
   private static final String amazonPath = "https://houseoftomorrow.s3.ap-northeast-2.amazonaws.com/";
   private static ObjectMetadata meta;    
   
   public String saveUploadedFiles(MultipartFile file) throws IOException {

      if (file.isEmpty()) {
         System.out.println("file not found");
      }
      byte[] bytes = file.getBytes();
      //System.out.println("bytes :"+bytes);
      //System.out.println(bytes.length);
      
      String randomFileName = UUID.randomUUID() + file.getOriginalFilename();
      sendFiles(randomFileName, bytes);
      System.out.println(amazonPath+randomFileName);
      return amazonPath + randomFileName;
   }
   
   public String upload(MultipartFile file) throws IOException{
	   String fileName = file.getOriginalFilename();
	   
	   s3client.putObject(new PutObjectRequest("houseoftomorrow", fileName, file.getInputStream(), null));
	   
	   
	   return s3client.getUrl("houseoftomorrow", fileName).toString();
   }
   
   public static boolean sendFiles(String name, byte[] file) {
      ObjectMetadata uploadMetaData = new ObjectMetadata();
      uploadMetaData.setContentLength(file.length);
      ByteArrayInputStream is = new ByteArrayInputStream(file);
      try {
         s3client.putObject(makeRequest(is, name, uploadMetaData));
         return true;
      } catch (Exception e) {
         e.printStackTrace();
      }
      return false;
   }
   
   public static PutObjectRequest makeRequest(InputStream is, String fileName, ObjectMetadata uploadMetaData) {      
      return new PutObjectRequest("houseoftomorrow", fileName, is, uploadMetaData).withCannedAcl(CannedAccessControlList.PublicRead);
   }
}
