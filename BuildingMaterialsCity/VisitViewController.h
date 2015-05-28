//
//  VisitViewController.h
//  BuildingMaterialsCity
//
//  Created by LYRotoosoft on 15/5/7.
//  Copyright (c) 2015年 LYRotoosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>



@property (weak, nonatomic) IBOutlet UILabel *visitGuest;

@property (weak, nonatomic) IBOutlet UILabel *orderNo;

@property (weak, nonatomic) IBOutlet UILabel *createTime;

@property (weak, nonatomic) IBOutlet UILabel *instalTime;

@property (weak, nonatomic) IBOutlet UILabel *visitName;

@property (weak, nonatomic) IBOutlet UILabel *visitBeizhu;

@property (weak, nonatomic) IBOutlet UILabel *visitContent;


- (IBAction)changeBtn:(id)sender;



@end
