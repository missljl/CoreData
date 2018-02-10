//
//  ViewController.m
//  Flie
//
//  Created by 1111 on 2018/2/10.
//  Copyright © 2018年 上海啸思. All rights reserved.
//

#import "ViewController.h"
#import "FileUtils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    NSArray *AR = @[@"写入文件",@"读取文件",@"获取完整目录",@"删除文件"];
    
    for (NSInteger i=0; i<AR.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-60,50+40*i, 120, 30)];
        btn.tag = 100+i;
        [btn setTitle:AR[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnOnlick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
    
    
    
    
}
-(void)btnOnlick:(UIButton *)btn{
    
    switch (btn.tag) {
        case 100:
            [self creatFile];
            break;
        case 101:
            [self readDataFile];
            break;
        case 102:
            [self getFilePath];
            break;
        case 103:
            [self deleteFilePaht];
            break;
        default:
            break;
    }
    
    
}
-(void)creatFile{
    
    NSString *fileName = @"textFile";
    NSString *fileContent = @"内容很唱唱唱换成那个啊啊";
    NSData *fileData = [fileContent dataUsingEncoding:NSUTF8StringEncoding];
    
    BOOL isfliePath = [FileUtils writeDataToFile:fileName data:fileData];
    NSLog(@"%d",isfliePath);
    
}
-(void)readDataFile{
    
    NSData *data = [FileUtils readDataFromFile:@"textFile"];
    
    NSLog(@"%@",data);
    
}
-(void)getFilePath{
    
    NSString *fielPath = [FileUtils getFilePath:@"textFile"];
    NSLog(@"%@",fielPath);
    
}
-(void)deleteFilePaht{
    
    BOOL isDelete = [FileUtils deleteFile:@"textFile"];
    NSLog(@"%d",isDelete);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
