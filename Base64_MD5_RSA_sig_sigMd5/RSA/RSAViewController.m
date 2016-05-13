//
//  RSAViewController.m
//  Base64_MD5_RSA_sig_sigMd5
//
//  Created by FanLang on 16/5/12.
//  Copyright © 2016年 FanLang. All rights reserved.
//

#import "RSAViewController.h"
#import "HBRSAHandler.h"
@interface RSAViewController ()
@property (weak, nonatomic) IBOutlet UILabel *PSAJia;

@property (weak, nonatomic) IBOutlet UILabel *RSAJie;
@property (weak, nonatomic) IBOutlet UILabel *RSAQian;
@property (weak, nonatomic) IBOutlet UILabel *RSAYan;

@property (weak, nonatomic) IBOutlet UILabel *MD5Qian;

@property (weak, nonatomic) IBOutlet UILabel *MD5Yan;
@property (nonatomic, copy)NSString * string;


@end

@implementation RSAViewController
{
    HBRSAHandler* _handler;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *publicKeyFilePath = [[NSBundle mainBundle] pathForResource:@"rsa_public_key.pem" ofType:nil];
    
    NSString *privateKeyFilePath = [[NSBundle mainBundle] pathForResource:@"rsa_private_key.pem" ofType:nil];
    
    HBRSAHandler* handler = [HBRSAHandler new];
    [handler importKeyWithType:KeyTypePublic andPath:publicKeyFilePath];
    [handler importKeyWithType:KeyTypePrivate andPath:privateKeyFilePath];
    _handler = handler;
    
    
}

- (IBAction)RSAJia:(id)sender {
    NSArray * ary = @[@"我喜欢听音乐，尤其是英文的歌曲", @"很喜欢西城男孩的歌曲，很有乡村感觉", @"酷狗推荐的最好听的英文歌也不错", @"英文的歌曲可以锻炼我们的英语听力", @"还可以培养我们的英语语感，非常的有效果"];
    
    NSString * string = ary[arc4random()%5];

    
    self.string = string;
    
    self.PSAJia.text = [_handler encryptWithPublicKey:string];
    
    
}

- (IBAction)RSAJie:(id)sender {
    
    self.RSAJie.text = [_handler decryptWithPrivatecKey:self.PSAJia.text];
}

- (IBAction)RSAQian:(id)sender {
    
    self.RSAQian.text = [_handler signString:self.string];
    
}
- (IBAction)RSAYan:(id)sender {
    
            BOOL result = [_handler verifyString:self.string withSign:self.RSAQian.text];
            self.RSAYan.text = [NSString stringWithFormat:@"验证签名结果(1成功，0失败)： %d",result];
}
- (IBAction)MD5Qian:(id)sender {
    
    self.MD5Qian.text = [_handler signMD5String:self.string];
    
}

- (IBAction)MD5Yan:(id)sender {
    
    BOOL result = [_handler verifyMD5String:self.string withSign:self.MD5Qian.text];
    self.MD5Yan.text = [NSString stringWithFormat:@"验证签名结果(1成功，0失败)： %d",result];
    
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
