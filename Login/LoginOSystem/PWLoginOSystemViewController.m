//
//  PWLoginOSystemViewController.m
//  PmwayBeta
//
//  Created by 孙旭 on 2019/8/19.
//  Copyright © 2019 Sunwanqing. All rights reserved.
//

#import "PWLoginOSystemViewController.h"
#import "PWOrganizationSListViewController.h"

@interface PWLoginOSystemViewController ()
@property(nonatomic,strong) UITextField * ZHTextField;
@property(nonatomic,strong) UITextField * MMTextField;
@property(nonatomic,strong) UIButton * LogInBt;
@end

@implementation PWLoginOSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    [self CreateLoginBgView];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}
-(void)CreateLoginBgView{
    UIImageView * BgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    BgImageView.backgroundColor =[UIColor redColor];
    BgImageView.image = [UIImage imageNamed:@"loginBG"];
    [self.view addSubview:BgImageView];
    [self CreateSubViews];
    
}
-(void)CreateSubViews{
    [self.view addSubview:self.ZHTextField];
    [self.view addSubview:self.MMTextField];
    [self.view addSubview:self.LogInBt];
}
-(UIButton *)LogInBt{
    if (!_LogInBt) {
        _LogInBt = [[UIButton alloc]initWithFrame:CGRectMake(_MMTextField.frame.origin.x, _MMTextField.frame.origin.y+50, _MMTextField.frame.size.width, _MMTextField.frame.size.height)];
        [_LogInBt setTitle:@"登录" forState:UIControlStateNormal];
        [_LogInBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _LogInBt.layer.cornerRadius=10;
        _LogInBt.layer.masksToBounds = YES;
        _LogInBt.layer.borderWidth = 1;
        _LogInBt.titleLabel.font = [UIFont systemFontOfSize:14];
        _LogInBt.layer.borderColor = [UIColor whiteColor].CGColor;
        [_LogInBt addTarget:self action:@selector(OnClickLoginAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _LogInBt;
}
-(void)OnClickLoginAction{
    PWOrganizationSListViewController *vc = [[PWOrganizationSListViewController alloc]init];
//    UINavigationController *na = [[UINavigationController alloc]initWithRootViewController:vc];
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:na animated:YES completion:nil];
//    HWPopController *popController = [[HWPopController alloc] initWithViewController:vc];
//    popController.popPosition = HWPopPositionBottom;
//    popController.popType = HWPopTypeBounceInFromBottom;
//    popController.dismissType = HWDismissTypeSlideOutToBottom;
//    popController.shouldDismissOnBackgroundTouch = NO;
//    [popController presentInViewController:self];
}
-(UITextField *)ZHTextField{
    if (!_ZHTextField) {
        _ZHTextField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.2, SCREEN_HEIGHT*0.3, SCREEN_WIDTH*0.6, 30)];
//        _ZHTextField.backgroundColor = [UIColor redColor];
        _ZHTextField.layer.masksToBounds = YES;
        _ZHTextField.layer.cornerRadius = 10;
        _ZHTextField.layer.borderColor = [UIColor whiteColor].CGColor;
        _ZHTextField.layer.borderWidth = 1;
        _ZHTextField.textColor = [UIColor whiteColor];
        _ZHTextField.placeholder = @"手机号";
        _ZHTextField.font = [UIFont systemFontOfSize:14];
        _ZHTextField.tintColor = [UIColor whiteColor];
        _ZHTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
        _ZHTextField.keyboardType = UIKeyboardTypeNumberPad;
        UIImageView * LeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        LeftImageView.image = [UIImage imageNamed:@"手机账号"];
        _ZHTextField.leftView = LeftImageView;
        _ZHTextField.leftViewMode=UITextFieldViewModeAlways;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"手机号" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                                                            NSFontAttributeName:_ZHTextField.font
                                                                                                            }];
        _ZHTextField.attributedPlaceholder = attrString;
        _ZHTextField.clearsOnBeginEditing=YES;
        _ZHTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    }
    return _ZHTextField;
}
-(UITextField *)MMTextField{
    if (!_MMTextField) {
        _MMTextField = [[UITextField alloc]initWithFrame:CGRectMake(_ZHTextField.frame.origin.x, _ZHTextField.frame.origin.y+50, _ZHTextField.frame.size.width, _ZHTextField.frame.size.height)];
        _MMTextField.layer.masksToBounds = YES;
        _MMTextField.layer.cornerRadius = 10;
        _MMTextField.layer.borderColor = [UIColor whiteColor].CGColor;
        _MMTextField.layer.borderWidth = 1;
        _MMTextField.textColor = [UIColor whiteColor];
        _MMTextField.placeholder = @"手机号";
        _MMTextField.font = [UIFont systemFontOfSize:14];
        _MMTextField.tintColor = [UIColor whiteColor];
        _MMTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
        _MMTextField.keyboardType = UIKeyboardTypeNumberPad;
        UIImageView * LeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        LeftImageView.image = [UIImage imageNamed:@"密码"];
        _MMTextField.leftView = LeftImageView;
        _MMTextField.leftViewMode=UITextFieldViewModeAlways;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                                                        NSFontAttributeName:_MMTextField.font
                                                                                                        }];
        _MMTextField.attributedPlaceholder = attrString;
        _MMTextField.clearsOnBeginEditing=YES;
        _MMTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
        _MMTextField.secureTextEntry = YES;
    }
    return _MMTextField;
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
