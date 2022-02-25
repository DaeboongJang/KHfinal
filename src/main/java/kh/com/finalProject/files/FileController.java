package kh.com.finalProject.files;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.com.finalProject.reply.ReplyDTO;

@Controller
@RequestMapping("/files")
public class FileController {
   @Autowired
   private HttpSession session;

   @Autowired
   private FileService service;

   public FileController() {
      System.out.println("FileController 인스턴스 생성");
   }

   // 파일 업로드
   @RequestMapping(value = "/SummerNoteImageFile", produces = "application/json;charset=UTF-8")
   @ResponseBody
   public String SummerNoteImageFile(MultipartFile file, HttpServletRequest request) throws Exception {
      // 저장 경로 설정
      String realPath = session.getServletContext().getRealPath("/upload");


      // JsonObject형 jsonObject변수를 만들어 FileServiece에 넘는 작업
      JsonObject jsonObject = service.SummerNoteImageFile(realPath, file);
      System.out.println("fileController jsonObject : " + jsonObject.toString());

      // jsp 파일로 return 해주는 작업
      return jsonObject.toString();
   }

}