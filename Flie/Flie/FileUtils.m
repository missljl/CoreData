//
//  FileUtils.m
//  Flie
//
//  Created by 1111 on 2018/2/10.
//  Copyright © 2018年 上海啸思. All rights reserved.
//

#import "FileUtils.h"

@implementation FileUtils
/*-------------------------------------------------------*/
//删除文件
+(BOOL)deleteFile:(NSString *)filePath
{
    
    return [self deleteDir:filePath];
    
}
///返回文件完整路径路径
+ (NSString *)getFilePath:(NSString *)fileName
{
    NSString *dirPath = [[self getDecumentPath] stringByAppendingPathComponent:fileName];
    return dirPath;
}
//写入数据
+ (BOOL)writeDataToFile:(NSString*)fileName data:(NSData*)data
{
    NSString *filePath=[self getFilePath:fileName];
    return [self creatFile:filePath withData:data];
}
//读取文件
+ (NSData*)readDataFromFile:(NSString*)fileName
{
    NSString *filePath=[self getFilePath:fileName];
    return [self readFile:filePath];
}

/*------------------------------------------------*/


//返回caches路径
+(NSString *)getCachaesDirectory{
    
    
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    return cachesPath;
    
}
//返回decuments路径
+(NSString *)getDecumentPath{
    
    NSString *decumentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    return decumentPath;
    
}
//创建文件
+(BOOL)creatDir:(NSString *)dirPath{
    
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {
        return NO;
    }else{
        
        [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
        return YES;
    }
    
    
}
//删除文件
+(BOOL)deleteDir:(NSString *)dirPath{
    
    
    if([[NSFileManager defaultManager] fileExistsAtPath:dirPath])//如果存在临时文件的配置文件
        
    {
        NSError *error=nil;
        return [[NSFileManager defaultManager]  removeItemAtPath:dirPath error:&error];
        
    }
    
    return  NO;
    
    
    
}
//移动或重新命名文件 to:不能是已存在的
+(BOOL)moveDir:(NSString *)srcPath to:(NSString *)desPath{
    
    
    NSError *error=nil;
    if([[NSFileManager defaultManager] moveItemAtPath:srcPath toPath:desPath error:&error]!=YES)// prePath 为原路径、     cenPath 为目标路径
    {
    
        NSLog(@"移动文件失败");
        return NO;
    }
    else
    {
        NSLog(@"移动文件成功");
        return YES;
    }
    
    
    
}
//创建文件并写入数据
+(BOOL)creatFile:(NSString *)filePath withData:(NSData *)data{
    
    
    return  [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}
    
///从一个文件中读取文件
+(NSData*)readFile:(NSString *)filePath
{
    return [NSData dataWithContentsOfFile:filePath options:0 error:NULL];
}



@end
