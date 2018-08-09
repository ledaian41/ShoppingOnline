/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.shoppingonline.util;

import com.sam.shoppingonline.entity.FileModel;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * This class used to support upload file
 *
 * @author Le An
 */
public class UploadFileUtil {

    /**
     * upload file to server
     *
     * @param file
     * @param context
     * @return
     * @throws IOException
     */
    public static MultipartFile uploadFile(FileModel file, ServletContext context) throws IOException {
        MultipartFile multipartFile = file.getFile();
        String uploadPath = context.getRealPath("") + File.separator + "image" + File.separator;
        FileCopyUtils.copy(file.getFile().getBytes(), new File(uploadPath + file.getFile().getOriginalFilename()));
        return multipartFile;
    }
}
