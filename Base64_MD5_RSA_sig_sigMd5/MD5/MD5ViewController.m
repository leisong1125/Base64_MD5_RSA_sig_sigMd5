//
//  MD5ViewController.m
//  Base64_MD5_RSA_sig_sigMd5
//
//  Created by FanLang on 16/5/12.
//  Copyright © 2016年 FanLang. All rights reserved.
//

#import "MD5ViewController.h"
#import "NSString+MD5.h"

@interface MD5ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *MD5;
@property (weak, nonatomic) IBOutlet UILabel *desJia;
@property (weak, nonatomic) IBOutlet UILabel *desJie;

@end

@implementation MD5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)md5Jia:(id)sender {
    NSArray * ary = @[@"我喜欢听音乐，尤其是英文的歌曲", @"很喜欢西城男孩的歌曲，很有乡村感觉", @"酷狗推荐的最好听的英文歌也不错", @"英文的歌曲可以锻炼我们的英语听力", @"还可以培养我们的英语语感，非常的有效果"];
    
    NSString * string = ary[arc4random()%5];
    
    self.MD5.text = [NSString md5Encryption:string];
    
    
    
}
- (IBAction)desJia:(id)sender {
    NSArray * ary = @[@"我喜欢听音乐，尤其是英文的歌曲", @"很喜欢西城男孩的歌曲，很有乡村感觉", @"酷狗推荐的最好听的英文歌也不错", @"英文的歌曲可以锻炼我们的英语听力", @"还可以培养我们的英语语感，非常的有效果"];
    
    NSString * string = ary[arc4random()%5];
    
    self.desJia.text = [NSString encryptWithText:string key:@"10086" vector:@"123321"];
    
    
    
}
- (IBAction)desJie:(id)sender {
    
    self.desJie.text = [NSString decryptWithText:self.desJia.text key:@"10086" vector:@"123321"];
    
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
