//
//  ProductDetailsViewController.m
//  BuildingMaterialsCity
//
//  Created by xiaozhan on 15/5/26.
//  Copyright (c) 2015年 LYRotoosoft. All rights reserved.
//

#import "ProductDetailsViewController.h"
#import "RowView.h"
#import "AppDelegate.h"


#define kDuration 0.5
#define kRowH 50
#define kNameTag 10

@interface ProductDetailsViewController ()
{
    NSMutableDictionary *dict;
    
    NSMutableArray *featureNameTableArray;
    NSMutableArray *featureDescriptionTableArray;
    
    
    NSString *orderBy;
    AppDelegate *app;
    
    UIAlertView *alert;
    UITextField * newFeatureName;
    UITextField * newFeatureDes;
    
    
    NSArray *_allNames;
}
@end

@implementation ProductDetailsViewController


@synthesize webData;
@synthesize soapResults;
@synthesize xmlParser;
@synthesize elementFound;
@synthesize matchingElement;
@synthesize conn;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetProdFeatureBySProduct];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 获取指定商品的所有特征
//查询客户信息
-(void)GetProdFeatureBySProduct
{
    //初始化进度框，置于当前的View中
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    //如果设置此属性则当前的view置于后台
    HUD.dimBackground = YES;
    HUD.labelText = @"请稍等"; //设置对话框文字
    //显示对话框
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        sleep(3);
    }completionBlock:^{
        //操作执行完后取消对话框
        [HUD removeFromSuperview];
        HUD = nil;
    }];
    NSString *shopName = @"测试商铺";
    NSString *pClass = [NSString stringWithFormat:@"配件"];
    NSString *pName = [NSString stringWithFormat:@"橱柜"];


//    if([app.opnames containsObject:@"用户管理"])
//    {
//        byUserId = @"0";
//    }
    
    /* 需要以后做判断 */
    //    customerclass = @"0";
    
    
    
    //设置之后解析XML时用的关键字，与响应报文中Body标签之间的getMobileCodeInfoResult标签想对应
    matchingElement = @"GetProdFeatureBySProductResult";
    //创建SOAP消息，内容格式就是网站声提示的请求豹纹的实体主体部分
    NSString *soapMsg = [NSString stringWithFormat:
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                         "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                         "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                         "xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "
                         "<soap12:Body>"
                         "<GetProdFeatureBySProduct xmlns=\"http://tempuri.org/\">"
                         "<shname>%@</shname>"
                         "<pcl>%@</pcl>"
                         "<prname>%@</prname>"
                         "</GetProdFeatureBySProduct>"
                         "</soap12:Body>"
                         "</soap12:Envelope>",shopName,pClass,pName];
    
    NSLog(@"app.shopName,pClass,pName:   %@   %@   %@  ",app.shopName,pClass,pName);
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.100/jct/DataWebService.asmx"];
    NSLog(@"soapMsg:%@",soapMsg);
    
    //根据上面的URL创建一个请求
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu",(unsigned long)[soapMsg length]];
    //添加请求的详细信息，与请求报文前半部分的各字段对应
    [req addValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    //设置请求行方法为POST，与请求报文第一行对应
    [req setHTTPMethod:@"POST"];
    
    //将SOAP消息加到请求中
    [req setHTTPBody:[soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    
    //创建连接
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        webData = [NSMutableData data];
    }
}


#pragma mark - 更新该商品所有的属性
//查询客户信息
-(void)UpdateSProductInfo
{
    //初始化进度框，置于当前的View中
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    //如果设置此属性则当前的view置于后台
    HUD.dimBackground = YES;
    HUD.labelText = @"请稍等"; //设置对话框文字
    //显示对话框
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        sleep(3);
    }completionBlock:^{
        //操作执行完后取消对话框
        [HUD removeFromSuperview];
        HUD = nil;
    }];
    NSString *shopName = @"测试商铺";
    NSString *pClass = [NSString stringWithFormat:@"配件"];
    NSString *pName = [NSString stringWithFormat:@"橱柜"];
    
    
    
    NSString *newFeatureNameString = [featureNameTableArray componentsJoinedByString:@","];
    NSString *featureDescriptionString = [featureDescriptionTableArray componentsJoinedByString:@","];

    
    //设置之后解析XML时用的关键字，与响应报文中Body标签之间的getMobileCodeInfoResult标签想对应
    matchingElement = @"ResetProdFeatureResult";
    //创建SOAP消息，内容格式就是网站声提示的请求豹纹的实体主体部分
    NSString *soapMsg = [NSString stringWithFormat:
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                         "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                         "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                         "xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "
                         "<soap12:Body>"
                         "<ResetProdFeature xmlns=\"http://tempuri.org/\">"
                         "<shname>%@</shname>"
                         "<pcl>%@</pcl>"
                         "<prname>%@</prname>"
                         "<ftnamelist>%@</ftnamelist>"
                         "<ftdeslist>%@</ftdeslist>"
                         "</ResetProdFeature>"
                         "</soap12:Body>"
                         "</soap12:Envelope>",shopName,pClass,pName,newFeatureNameString,featureDescriptionString];
    
    NSLog(@"app.shopName,pClass,pName  ,newFeatureNameString,featureDescriptionString:   %@   %@   %@   %@  %@ ",shopName,pClass,pName,newFeatureNameString,featureDescriptionString);
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.100/jct/DataWebService.asmx"];
    NSLog(@"soapMsg:%@",soapMsg);
    
    //根据上面的URL创建一个请求
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu",(unsigned long)[soapMsg length]];
    //添加请求的详细信息，与请求报文前半部分的各字段对应
    [req addValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    //设置请求行方法为POST，与请求报文第一行对应
    [req setHTTPMethod:@"POST"];
    
    //将SOAP消息加到请求中
    [req setHTTPBody:[soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    
    //创建连接
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        webData = [NSMutableData data];
    }
}



#pragma mark -
#pragma mark URl Connection Data Delegate Methods

//刚开始接受响应时调用
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [webData setLength:0];
}

//每接收到一部分数据就追加到webData中
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [webData appendData:data];
}

//出现错误时
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    conn = nil;
    webData = nil;
}

//完成接收数据时调用
-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *theXML = [[NSString alloc] initWithBytes:[webData mutableBytes]
                                                length:[webData length]
                                              encoding:NSUTF8StringEncoding];
    NSLog(@"theXML:  %@",theXML);
    //是用NSXMLParser解析我们想要的结果
    xmlParser  = [[NSXMLParser alloc] initWithData:webData];
    [xmlParser setDelegate:self];
    [xmlParser setShouldResolveExternalEntities:YES];
    [xmlParser parse];
}

#pragma mark -
#pragma mark XML Parser Delegate Methods

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    _notes = [NSMutableArray new];
}

//开始解析一个元素名
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    _currentTagName = elementName;
    if ([_currentTagName isEqualToString:@"result"]) {
        NSString * _id = [attributeDict objectForKey:@"diffgr:id"];
        //实例化一个可变的字典对象，用于存放
        dict = [NSMutableDictionary new];
        //把id放入字典中
        [dict setObject:_id forKey:@"diffgr:id"];
        
        //把可变字典 放入到 可变数组集合_notes变量中
        [_notes addObject:dict];
    }
}

//追加找到的元素值，一个元素值可能要分几次追加
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    dict = [_notes lastObject];
    if ([_currentTagName isEqualToString:@"PCLASS"] && dict) {//商品类型
        [dict setObject:string forKey:@"PCLASS"];
    }
    if ([_currentTagName isEqualToString:@"PRODUCTNAME"] && dict) {//商品名
        [dict setObject:string forKey:@"PRODUCTNAME"];
    }
    if ([_currentTagName isEqualToString:@"FEATURENAME"] && dict) {//特征名称
        [dict setObject:string forKey:@"FEATURENAME"];
    }
    
    if ([_currentTagName isEqualToString:@"FEATUREDES"] && dict) {//特征描述
        [dict setObject:string forKey:@"FEATUREDES"];
    }

    if ([_currentTagName isEqualToString:@"info"] && dict) {//结果
        [dict setObject:string forKey:@"info"];
    }
  
}

//结束解析这个元素名
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{

    
    
    if ([elementName isEqualToString:@"GetProdFeatureBySProductResult"]) {
        
        featureNameTableArray = [[NSMutableArray alloc] init];
        featureDescriptionTableArray = [[NSMutableArray alloc] init];
        
        for(int i = 0 ; i < [_notes count]; i++)
        {
            [featureNameTableArray addObject:[[_notes objectAtIndex:i] objectForKey:@"FEATURENAME"]];

            [featureDescriptionTableArray addObject:[[_notes objectAtIndex:i] objectForKey:@"FEATUREDES"] ];

        }
        
        NSLog(@"featureNameTableArray,featureNameTableArray : %@  %@",featureNameTableArray,featureDescriptionTableArray);
              /*__________________*/
        
        
        
        //        if ([_currentTagName isEqualToString:@"info"]) {
        //            if ([[dict objectForKey:@"info"] isEqualToString:@"ok"]) {
        //
        //                [self search];
        //
        //            }else{
        //                alert  = [[UIAlertView alloc] initWithTitle:@"提示"
        //                                                    message:[dict objectForKey:@"info"]
        //                                                   delegate:self
        //                                          cancelButtonTitle:@"确定"
        //                                          otherButtonTitles:nil, nil];
        //                [alert show];
        //            }
        //        }
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [HUD removeFromSuperview];
}

//解析整个文件结束后
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    [[NSNotificationCenter defaultCenter] postNotificationName: @"reloadViewNotification" object:self.notes userInfo:nil];
    //进入该方法就意味着解析完成，需要清理一些成员变量，同时要将数据返回给表示层（表示图控制器） 通过广播机制将数据通过广播通知投送到 表示层
    
    [self.featureTableView reloadData];

}

//出错时，例如强制结束解析
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    if (soapResults) {
        soapResults = nil;
    }
}







#pragma mark 添加一行
- (IBAction)add:(UIBarButtonItem *)sender {
    
    alert = [[UIAlertView alloc]initWithTitle:@"添加新特征" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"添加",nil];
    
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    alert.delegate = self;
    
    newFeatureName = [alert textFieldAtIndex:0];
    newFeatureName.placeholder = @"请输入特征名称";
    
    newFeatureDes = [alert textFieldAtIndex:1];
    newFeatureDes.placeholder = @"请输入特征描述";
    newFeatureDes.secureTextEntry = NO;
//    
//    newFeatureName = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
//    newFeatureName.placeholder = @"请输入特征名";
//    
//    newFeatureName.tag = 1001;
//    
//    newFeatureDes = [[UITextField alloc]initWithFrame:CGRectMake(0, 20, 100, 20)];
//    newFeatureDes.placeholder = @"请输入特征描述";
//    newFeatureDes.tag = 1002;
    
//
//    [alert addSubview:newFeatureName];
//
//    [alert addSubview:newFeatureDes];
    
    [alert show];
    
    
   }




- (IBAction)delete:(UIBarButtonItem *)sender {
    [featureDescriptionTableArray removeLastObject];
    [featureNameTableArray removeLastObject];
    
    NSLog(@"delete : %@ %@",featureDescriptionTableArray,featureNameTableArray);
    [self.featureTableView  reloadData];

    
}






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [featureNameTableArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
//    //特征名称
//    UILabel *customNameL = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, 35, 20)];
//    customNameL.text = [featureNameTableArray objectAtIndex:[indexPath row]];
//    customNameL.font = [UIFont fontWithName:@"Helvetica" size:11.0f];
//    customNameL.backgroundColor = [UIColor clearColor];
//    customNameL.textAlignment = 1;
//    [cell.contentView addSubview:customNameL];
//    
//    //特征描述
//    UILabel *communityL = [[UILabel alloc] initWithFrame:CGRectMake(35, 12, 125, 20)];
//    communityL.text = [featureDescriptionTableArray objectAtIndex:[indexPath row]];
//    communityL.font = [UIFont fontWithName:@"Helvetica" size:9.0f];
//    communityL.backgroundColor = [UIColor clearColor];
//    communityL.textAlignment = 1;
//    [cell.contentView addSubview:communityL];
    
    //特征名称
    UITextField *customNameL1 = [[UITextField alloc] initWithFrame:CGRectMake(0, 12, 35, 20)];
    customNameL1.text = [featureNameTableArray objectAtIndex:[indexPath row]];
    customNameL1.font = [UIFont fontWithName:@"Helvetica" size:11.0f];
    customNameL1.backgroundColor = [UIColor clearColor];
    customNameL1.textAlignment = 1;
    [cell.contentView addSubview:customNameL1];
    
    //特征描述
    UITextField *communityL1 = [[UITextField alloc] initWithFrame:CGRectMake(35, 12, 125, 20)];
    communityL1.text = [featureDescriptionTableArray objectAtIndex:[indexPath row]];
    communityL1.font = [UIFont fontWithName:@"Helvetica" size:9.0f];
    communityL1.backgroundColor = [UIColor clearColor];
    communityL1.textAlignment = 1;
    [cell.contentView addSubview:communityL1];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

#pragma delete 滑动删除

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

//单元格返回的编辑风格，包括删除 添加 和 默认  和不可编辑三种风格
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete ;//返回编辑风格：  -：删除； +：添加  无：不可编辑
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [featureNameTableArray  removeObjectAtIndex:indexPath.row];
        [featureDescriptionTableArray  removeObjectAtIndex:indexPath.row];
        
        [self.featureTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}



#pragma mark UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    

    
    if (buttonIndex == 0)
        
    {
        
        NSLog(@"取消");
        
    }else if (buttonIndex == 1)
        
    {
        
        NSLog(@"确定");
        
        

        [featureNameTableArray addObject: [newFeatureName  text] ];
        [featureDescriptionTableArray addObject:[newFeatureDes  text]];

        [self.featureTableView reloadData];
    }
    
}


- (IBAction)admit:(UIButton *)sender {
    
    [self UpdateSProductInfo];
}
@end
