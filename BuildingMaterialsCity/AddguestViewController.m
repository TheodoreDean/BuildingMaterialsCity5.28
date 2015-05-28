//
//  ToguestViewCOntroller.m
//  BuildingMaterialsCity
//
//  Created by LYRotoosoft on 15/5/7.
//  Copyright (c) 2015年 LYRotoosoft. All rights reserved.
//

#import "ToguestViewController.h"

@interface ToguestViewController ()

@end

@implementation ToguestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    
    UILabel *item = [[UILabel alloc] initWithFrame:CGRectMake(0,20,320,20)];
    item.text = @"添加客户";
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
    
    //客户类型
    self.toType.layer.cornerRadius=0.0f;
    self.toType.layer.masksToBounds=YES;
    self.toType.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.toType.layer.borderWidth= 0.5f;
    
    //客户姓名
    self.toName.layer.cornerRadius=0.0f;
    self.toName.layer.masksToBounds=YES;
    self.toName.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.toName.layer.borderWidth= 0.5f;
    
    //手机号码
    self.toTel.layer.cornerRadius=0.0f;
    self.toTel.layer.masksToBounds=YES;
    self.toTel.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.toTel.layer.borderWidth= 0.5f;
    
    //地址
    self.toAdderss.layer.cornerRadius=0.0f;
    self.toAdderss.layer.masksToBounds=YES;
    self.toAdderss.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.toAdderss.layer.borderWidth= 0.5f;
    
    //小区
    self.toXiaoQu.layer.cornerRadius=0.0f;
    self.toXiaoQu.layer.masksToBounds=YES;
    self.toXiaoQu.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.toXiaoQu.layer.borderWidth= 0.5f;
    
    //客户备注
    self.beizhu.layer.cornerRadius = 0.0f;
    self.beizhu.layer.masksToBounds=YES;
    self.beizhu.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.beizhu.layer.borderWidth= 0.5f;
    
    
    //意向产品
    self.toProduct.layer.cornerRadius=0.0f;
    self.toProduct.layer.masksToBounds=YES;
    self.toProduct.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.toProduct.layer.borderWidth= 0.5f;
    
    //创建用户 ID
    self.createrID.layer.cornerRadius=0.0f;
    self.createrID.layer.masksToBounds=YES;
    self.createrID.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.createrID.layer.borderWidth= 0.5f;
    
    //负责人ID
    self.chargerID.layer.cornerRadius=0.0f;
    self.chargerID.layer.masksToBounds=YES;
    self.chargerID.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.chargerID.layer.borderWidth= 0.5f;
    
    //商铺名称
    self.shopName.layer.cornerRadius=0.0f;
    self.shopName.layer.masksToBounds=YES;
    self.shopName.layer.borderColor=[UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1].CGColor;
    self.shopName.layer.borderWidth= 0.5f;
    
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
