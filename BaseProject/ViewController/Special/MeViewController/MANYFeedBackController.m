//
//  MANYFeedBackController.m
//  MANY
//
//  Created by 金顺度 on 15/11/12.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYFeedBackController.h"

@interface MANYFeedBackController ()
@property (nonatomic,strong) UITextView *content;
@property (nonatomic,strong) UITextField *connectField;

@property (nonatomic,strong) UILabel *fixedLb;
@end

@implementation MANYFeedBackController
- (UILabel *)fixedLb {
    if (!_fixedLb) {
        _fixedLb = [[UILabel alloc]init];
        _fixedLb.textColor = [UIColor lightGrayColor];
        _fixedLb.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:_fixedLb];
        [_fixedLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(74);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _fixedLb;
}
- (UITextView *)content {
    if (!_content) {
        _content = [[UITextView alloc]init];
        _content.editable = YES;
        _content.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _content.layer.borderWidth = 1;
        _content.layer.cornerRadius = 3;
        [self.view addSubview:_content];
        [_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.fixedLb.mas_bottom).mas_equalTo(10);
            make.height.mas_equalTo(100);
        }];
//        [_content setBackground:[UIImage imageNamed:@"appPriceImg"]];
    }
    return _content;
}
- (UITextField *)connectField {
    if (!_connectField) {
        _connectField = [[UITextField alloc]init];
        [self.view addSubview:_connectField];
        [_connectField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.content.mas_bottom).mas_equalTo(10);
            make.height.mas_equalTo(25);
        }];
        [_connectField setBackground:[UIImage imageNamed:@"appPriceImg"]];
    }
    return _connectField;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [MANYTool addBackItemToVC:self];
    UIBarButtonItem *submit = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(submit)];
    [submit setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = submit;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.fixedLb.text = @"意见随便提，反正我不听😒";
    self.content.hidden = NO;
//    self.content.placeholder = @"";
    self.connectField.placeholder = @"留下号码，我来找你😏";
    
}
- (void)submit {
    NSLog(@"不爽咯，提交意见。");
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
