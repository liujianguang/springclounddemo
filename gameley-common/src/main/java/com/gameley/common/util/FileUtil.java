package com.gameley.common.util;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileUtil {
    /**
     * 删除某个文件夹下的所有文件夹和文件
     *
     * @param delpath
     * @throws FileNotFoundException IOException
     * @return boolean
     */
    public static boolean deletefile(String delpath) throws Exception {
        File file = new File(delpath);
        if (file.isDirectory()) {
            String[] filelist = file.list();
            for (String delFile : filelist) {
                File delfile = new File(delpath + File.separator + delFile);
                if (delfile.isDirectory()) {
                    deletefile(delpath + File.separator + delFile);
                }

            }

        }

        return true;
    }

    /**
     * 如果不存在则创建目录
     * @param path
     * @return boolean
     * @throws IOException
     */
    public static boolean createdir(String path) throws IOException {
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        return true;

    }

    /**
     * 创建文件，如果不存在父目录则先创建父目录
     * @param path
     * @return  File
     * @throws IOException
     */
    public static File createfile(String path) throws IOException {
        File file = new File(path);
        File fileParent = file.getParentFile();
        if(!fileParent.exists()){
            fileParent.mkdirs();
        }
        file.createNewFile();
        return file;
    }

    /**
     * 下载文件
     * @param file   要下载的文件
     * @param filename  下载文件名
     * @return
     */
    public static ResponseEntity<FileSystemResource> export(File file,String filename) {
        if (file == null) {
            return null;
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
        if(filename==null){
            headers.add("Content-Disposition", "attachment; filename=" + System.currentTimeMillis() + ".xls");
        }else {
            headers.add("Content-Disposition", "attachment; filename=" + filename);
        }
        headers.add("Pragma", "no-cache");
        headers.add("Expires", "0");
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(file.length())
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .body(new FileSystemResource(file));
    }
}
