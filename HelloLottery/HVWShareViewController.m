//
//  HVWShareViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/9.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWShareViewController.h"
#import "HVWArrowSettingItem.h"
#import "HVWSettingGroup.h"
#import <MessageUI/MessageUI.h>

@interface HVWShareViewController () <MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@end

@implementation HVWShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 配置数据
    HVWSettingItem *weiboShare = [HVWArrowSettingItem itemWithIcon:@"WeiboSina" title:@"新浪微博分享"];
    HVWSettingItem *smsShare = [HVWArrowSettingItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    
    // 为了避免block内持有本控制器，导致内存泄露，先声明一个弱指针
    __weak HVWShareViewController *shareController = self;
    
    smsShare.runningBlock = ^ {
        // 方法1：只能打开短信窗口，不能指定内容
        //        NSURL *smsURL = [NSURL URLWithString:@"sms://10086"];
        //        [[UIApplication sharedApplication] openURL:smsURL];

        // 方法2：
        //获取短信发送控制器
        if (![MFMessageComposeViewController canSendText]) return;
        
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        
        // 短信内容
        messageController.body = @"吃饭了没有?";
        
        // 收件人
        messageController.recipients = @[@"10086"];
        
        // 设置代理，特别注意代理是messageComposeDelegate，不是delegate
        messageController.messageComposeDelegate = shareController;
        
        // 显示控制器
        [shareController presentViewController:messageController animated:YES completion:nil];
    };
    
    HVWSettingItem *mailShare = [HVWArrowSettingItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    mailShare.runningBlock = ^ {
      // 方法1：直接调用
//        NSURL *mailURL = [NSURL URLWithString:@"mailto://hellovoidworld@163.com"];
//        [[UIApplication sharedApplication] openURL:mailURL];

      // 方法2：使用控制器
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        
        // 发送主题
        [mailController setSubject:@"重要作战会议"];
        
        // 邮件内容
        [mailController setMessageBody:@"就是那个...该吃饭了吧" isHTML:NO];
        
        // 收件人
        [mailController setToRecipients:@[@"hellovoidworld@163.com"]];
        
        // 抄送人
        [mailController setCcRecipients:@[@"hellovoidworld@163.com"]];
         
        // 密送人
         [mailController setBccRecipients:@[@"hellovoidworld@163.com"]];
         
        // 附件
        UIImage *image = [UIImage imageNamed:@"LoginScreen"];
        NSData *data = UIImagePNGRepresentation(image);
        [mailController addAttachmentData:data mimeType:@"image/png" fileName:@"attach.png"];
        
        // 代理
        mailController.mailComposeDelegate = shareController;
        
        // 弹出mail控制器
        [shareController presentViewController:mailController animated:YES completion:nil];
        
    };
    
    HVWSettingGroup *group = [[HVWSettingGroup alloc] init];
    group.items = @[weiboShare, smsShare, mailShare];
    [self.data addObject:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MFMessageComposeViewControllerDelegate 代理方法
/** 关闭信息后 */
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    // 关闭信息窗口
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    // 检测发送情况
    if (MessageComposeResultSent == result) {
        NSLog(@"成功发送!");
    } else if (MessageComposeResultFailed == result) {
        NSLog(@"发送失败!");
    } else if (MessageComposeResultCancelled == result) {
        NSLog(@"取消发送!");
    } else {
        NSLog(@"发生错误!");
    }
}

/** 关闭邮件后 */
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
