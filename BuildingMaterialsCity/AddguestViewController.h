//
//  ToguestViewCOntroller.h
//  BuildingMaterialsCity
//
//  Created by LYRotoosoft on 15/5/7.
//  Copyright (c) 2015年 LYRotoosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToguestViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *toType;

@property (weak, nonatomic) IBOutlet UITextField *toName;

@property (weak, nonatomic) IBOutlet UITextField *toTel;

@property (weak, nonatomic) IBOutlet UITextField *toAdderss;

@property (weak, nonatomic) IBOutlet UITextField *toXiaoQu;

@property (weak, nonatomic) IBOutlet UITextField *beizhu;






@property (weak, nonatomic) IBOutlet UITextField *toProduct;

@property (weak, nonatomic) IBOutlet UITextField *createrID;

@property (weak, nonatomic) IBOutlet UITextField *chargerID;

@property (weak, nonatomic) IBOutlet UITextField *shopName;


- (IBAction)save:(id)sender;

@end
