//
//  ViewController.m
//  JsonTestDemo
//
//  Created by pierce on 2017/4/14.
//  Copyright © 2017年 Leyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self convertJsonToOC];
    [self convertOCToJson];
}

#pragma mark - JSON 解析
- (void)convertOCToJson {

    NSString *testString = @"Test Json";
    NSArray *testArray = @[@"iOS",@"Android",@"Unity 3d"];
 
    NSDictionary *testDictionary = @{
                                     @"name":@"lipeihan",
                                     @"age":@(18),
                                     @"skill":@[@"iOS",@"Android",@"Unity 3d"]
                                     };
    
    NSLog(@"-----testString----");
    [self jsonConvertedByObjectiveCObject:testString];
    
    NSLog(@"-----testArray----");
    [self jsonConvertedByObjectiveCObject:testArray];
    
    NSLog(@"-----testDictionary----");
    [self jsonConvertedByObjectiveCObject:testDictionary];
    
}

- (BOOL)jsonConvertedByObjectiveCObject:(id)ocObject {

    BOOL isValid = [NSJSONSerialization isValidJSONObject:ocObject];
    
    if (isValid) {
        
        /**
         *	通过OC对象生成JSON Data数据
         *	obj:被转换的OC对象
         *	options：生成JSON数据的选项
         *	error：错误
         *	返回JSON Data数据
         */
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:ocObject
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:nil];
        
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        
        NSLog(@"jsonString = %@",jsonString);
    } else {
        NSLog(@"ocObject can not be converted to JSON Data");
    }
 
    return isValid;
}

- (void)convertJsonToOC {
    
    NSString *jsonString = @"{\"name\":\"lipeihan\",\"age\":18,\"skill\":[\"iOS\",\"Android\",\"Unity 3d\"]}";
    
    NSData *jsonData =  [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    /**
     *	通过NSData的方式生成OC对象
     *	data:JSON 数据
     *	options:
     *      NSJSONReadingOptions
     *          NSJSONReadingMutableContainers  = (1UL << 0),
     *          容器可变，NSMutableDictionary 或NSMutableArray。
     *
     *          NSJSONReadingMutableLeaves      = (1UL << 1),
     *          叶子可变，返回的 JSON 对象中字符串的值为 NSMutableString。
     *
     *          NSJSONReadingAllowFragments     = (1UL << 2)
     *          允许 JSON 字符串最外层既不是 NSArray 也不是 NSDictionary，但必须是有效的 JSON 片段
     *	error：错误
     *	return：返回OC对象
     */
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"convertJsonToOC = %@" ,jsonObj);
}

@end
