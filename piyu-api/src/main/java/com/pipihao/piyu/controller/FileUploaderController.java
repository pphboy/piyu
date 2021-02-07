package com.pipihao.piyu.controller;

import com.pipihao.piyu.utils.JWTUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 文件上传类
 */
@RestController
public class FileUploaderController {

    @Value("${file.server}")
    private String fileServer;

    @Value("${file.uploadPath}")
    private String uploadPath;

    @PostMapping("/file/upload")
    public Map<String,Object> upload(@RequestParam("file") MultipartFile[] files, HttpServletRequest request) throws IOException {
        Map<String,Object> map = new HashMap<>();

        String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //现在我来测试一下中文

/*
        {
            "msg": "",
            "code": 0,
            "data": {
                "errFiles": ['filename', 'filename2'],
                "succMap": {
                    "filename3": "filepath3",
                    "filename3": "filepath3"
                }
            }
        }
*/
        map.put("msg","上传成功");
        map.put("code",0);
        Map<String,String> succMap = new HashMap<>();

        for(MultipartFile filename: files){
            // 获取文件原始名称
            String fileName = filename.getOriginalFilename();
            //获取文件后缀
            String extension = "."+ FilenameUtils.getExtension(fileName);
            //生成新的文件名称
            String newFileName= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ UUID.randomUUID().toString().replace("-","")+extension;
            // 根据日期生成目录
            String dateDirPath = uploadPath + format;
            //设置返回数据
            succMap.put(fileName,fileServer+format+"/"+newFileName);

            File dateDir = new File(dateDirPath);
            if (!dateDir.exists())
                dateDir.mkdirs();
            // 处理文件上传
            filename.transferTo(new File(dateDir, newFileName));

        }
        Map<String,Object> data = new HashMap<>();
        data.put("succMap",succMap);
        data.put("errFiles",new ArrayList<>());

        map.put("data",data);
        return map;
    }
}
