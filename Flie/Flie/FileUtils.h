//
//  FileUtils.h
//  Flie
//
//  Created by 1111 on 2018/2/10.
//  Copyright © 2018年 上海啸思. All rights reserved.
//
/*
文件整理操作类
 NSFileManager常用的文件方法：
 -(NSData*)contentsAtPath:path 从一个文件中读取数据
 -(BOLL)createFileAtPath:path contents:(NSData*)data attributes: attr 向一个文件写入数据
 -(BOOL)removeItemAtPath:path error:err 删除一个文件
 -(BOOL)moveItemAtPath:from toPath:to error:err 重命名或移动一个文件(to 不能是已存在的)
 -(BOOL)copyItemAtPath:from toPath:to error:err 复制文件(to 不能是已存在的)
 -(BOOL)contentsEqualAtPath:path1 andPath:path2 比较这两个文件的内容
 -(BOOL)fileExistsAtPath:path 测试文件是否存在
 -(BOOL)isReadableFileAtPath:path 测试文件是否存在，并且是否能执行读操作
 -(BOOL)isWritableFileAtPath:path 测试文件是否存在，并且是否能执行写操作
 -(NSDictionary*)attributesOfItemAtPath:path error:err 获取文件的属性
 ********************************************************************************
 NSFileManager常用的目录方法
 -(NSString*)currentDirectoryPath 获取当前目录
 
 -(BOOL)changeCurrentDirectoryPath:path 更改当前目录
 
 -(BOOL)copyItemAtPath:from toPath:to error:err 复制目录结构
 
 -(BOOL)createDirectoryAtPath:path withIntermediateDirectories:(BOOL)flag attributes:attr 创建一个新目录
 
 -(BOOL)fileExistsAtPath:path isDirectory:(BOOL*)flag 测试文件是不是目录(flag中存储结果)
 
 -(NSArray*)contentsOfDirectoryAtPath:path error:err 列出目录内容
 
 -(NSDirectoryEnumerator*)enumeratorAtPath:path 枚举目录的内容
 
 -(BOOL)removeItemAtPath:path error:err 删除空目录
 
 -(BOOL)moveItemAtPath:from toPath:to error:err 重命名或移动一个目录
 
 
 
*/
#import <Foundation/Foundation.h>

@interface FileUtils : NSObject


/***********************文件操作**********************/



+(BOOL)deleteFile:(NSString *)filePath;
//返回文件完整路径路径
+(NSString *)getFilePath:(NSString *)fileName;
//创建（写）文件
+ (BOOL)writeDataToFile:(NSString*)fileName data:(NSData*)data;
//读取数据（读取）
+ (NSData*)readDataFromFile:(NSString*)fileName;


@end
