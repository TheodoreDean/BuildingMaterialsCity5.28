//
//  VisitViewController.m
//  BuildingMaterialsCity
//
//  Created by LYRotoosoft on 15/5/7.
//  Copyright (c) 2015年 LYRotoosoft. All rights reserved.
//

#import "VisitViewController.h"
#import "ChangeVisitViewController.h"

@interface VisitViewController ()

@end

@implementation VisitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    
    UILabel *item = [[UILabel alloc] initWithFrame:CGRectMake(0,20,320,20)];
    item.text = @"回访详情";
    item.textAlignment = 1;
    item.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    item.textColor = [UIColor whiteColor];
    [navBar addSubview:item];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(20,24,10,13)];
    [left setImage:[UIImage imageNamed:@"fh.png"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:left];
    
    [self.view addSubview:navBar];
    
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255 green:249.0/255 blue:250.0/255 alpha:1];
    
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    [right setFrame:CGRectMake(288,24,12,12)];
    [right setImage:[UIImage imageNamed:@"tj.png"] forState:UIControlStateNormal];
    [right addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:right];
    
    self.visitGuest.layer.cornerRadius=0.0f;//回访客户 姓名
    self.visitGuest.layer.masksToBounds=YES;
    self.visitGuest.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.visitGuest.layer.borderWidth= 0.5f;
    self.visitGuest.text = @"\t回访客户: aaaa";
    
    self.orderNo.layer.cornerRadius=0.0f;//订单号
    self.orderNo.layer.masksToBounds=YES;
    self.orderNo.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.orderNo.layer.borderWidth= 0.5f;
    self.orderNo.text = @"\t订单号: 12345678";
    
    self.createTime.layer.cornerRadius=0.0f;//创建时间
    self.createTime.layer.masksToBounds=YES;
    self.createTime.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.createTime.layer.borderWidth= 0.5f;
    self.createTime.text = @"\t创建时间: 2014-02-19";
    
    self.instalTime.layer.cornerRadius=0.0f;//安装时间
    self.instalTime.layer.masksToBounds=YES;
    self.instalTime.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.instalTime.layer.borderWidth= 0.5f;
    self.instalTime.text = @"\t安装时间: 2015-02-19";
    
    self.visitName.layer.cornerRadius=0.0f;//回访人员 姓名
    self.visitName.layer.masksToBounds=YES;
    self.visitName.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.visitName.layer.borderWidth= 0.5f;
    self.visitName.text = @"\t回访人员: babb";
    
    self.visitBeizhu.layer.cornerRadius=0.0f;//备注
    self.visitBeizhu.layer.masksToBounds=YES;
    self.visitBeizhu.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.visitBeizhu.layer.borderWidth= 0.5f;
    self.visitBeizhu.text = @"\t回访备注: 324fwf";

    self.visitContent.layer.cornerRadius=0.0f;//回访内容
    self.visitContent.layer.masksToBounds=YES;
    self.visitContent.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.visitContent.layer.borderWidth= 0.5f;
    self.visitContent.text = @"\t回访内容: 察看结果，有效，无限，效果不错";
    
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)add{
    
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

- (IBAction)changeBtn:(id)sender {
    ChangeVisitViewController *change = [[ChangeVisitViewController alloc] initWithNibName:@"ChangeVisitViewController" bundle:nil];
    [self presentViewController:change animated:YES completion:nil];
}
@end
