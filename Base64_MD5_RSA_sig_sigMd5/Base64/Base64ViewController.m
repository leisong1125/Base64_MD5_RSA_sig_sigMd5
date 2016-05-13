//
//  Base64ViewController.m
//  Base64_MD5_RSA_sig_sigMd5
//
//  Created by FanLang on 16/5/12.
//  Copyright © 2016年 FanLang. All rights reserved.
//

#import "Base64ViewController.h"
#import "ZZBase64.h"
@interface Base64ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *jia;
@property (weak, nonatomic) IBOutlet UILabel *jie;

@property (weak, nonatomic) IBOutlet UILabel *dataJia;

@property (weak, nonatomic) IBOutlet UILabel *dataJie;


@property (nonatomic, copy)NSString * string;
@end

@implementation Base64ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)jia:(id)sender {
    NSArray * ary = @[@"我喜欢听音乐，尤其是英文的歌曲", @"很喜欢西城男孩的歌曲，很有乡村感觉", @"酷狗推荐的最好听的英文歌也不错", @"英文的歌曲可以锻炼我们的英语听力", @"还可以培养我们的英语语感，非常的有效果"];
    
    self.string = ary[arc4random()%5];
    
    self.jia.text = [ZZBase64 encodeBase64String:self.string];
    
}
- (IBAction)jie:(id)sender {
    
    self.jie.text = [ZZBase64 decodeBase64String:self.jia.text];
}

- (IBAction)dataJia:(id)sender {
    NSArray * ary = @[@"我喜欢听音乐，尤其是英文的歌曲", @"很喜欢西城男孩的歌曲，很有乡村感觉", @"酷狗推荐的最好听的英文歌也不错", @"英文的歌曲可以锻炼我们的英语听力", @"还可以培养我们的英语语感，非常的有效果"];
    
    NSString * string = ary[arc4random()%5];
    
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    self.dataJia.text = [ZZBase64 encodeBase64Data:data];
    
    
}

- (IBAction)dataJie:(id)sender {
    
    NSData * data = [self.dataJia.text dataUsingEncoding:NSUTF8StringEncoding];
    
    self.dataJie.text = [ZZBase64 decodeBase64Data:data];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
