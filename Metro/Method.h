#ifndef Eworkpal_MethodDef_h
#define Eworkpal_MethodDef_h

//本地化
#define NSLocal(str) NSLocalizedString(str,nil)
//ios版本
#define IOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7
//obj转成字符串
#define String(s) ([s isEqual:[NSNull null]]||s==nil)?@"":[NSString stringWithFormat:@"%@",s]
//int转字符串
#define StringD(d) [NSString stringWithFormat:@"%d",d]
//float转字符串
#define StringF(f) [NSString stringWithFormat:@"%f",f]
#define StringCat(s1,s2) [NSString stringWithFormat:@"%@%@",s1,s2]
#define StringCat3(s1,s2,s3) [NSString stringWithFormat:@"%@%@%@",s1,s2,s3]
#define  setRightButton(buttonRight,local)   ({[buttonRight setTitle:NSLocal(local) forState:UIControlStateNormal];\
[buttonRight sizeToFit];\
[buttonRight setFrame:CGRectMake(SCREEN_WIDTH-10-buttonRight.width, buttonRight.frame.origin.y, buttonRight.width, buttonRight.height)];})\
//#define StrCat(fistPara,...) ({\
//    va_list arguments;\
//    id eachObject;\
//    NSString *s=@"";\
//    s=fistPara;\
//    va_start(arguments, fistPara);\
//    while ((eachObject = va_arg(arguments, id))) {\
//           s= NSString stringWithFormat:@"%@%@",s,eachObject);\
//    }\
//    va_end(arguments);\
//    s;\
//})\

//#define StrCat(...)  ({\
//  NSArray *arr=[NSArray arrayWithObject:##__VA_ARGS__];\
//  for(int i=0;i<arr.count;i++) {s=[NSString stringWithFormat:@"%@%@",s,[arr objectAtIndex:i]];}\
//  s;\
//})
//init-CGRectMake
#define iR(x,y,w,h)  initWithFrame:CGRectMake(x,y,w,h)
//字符串比较
#define Eq(s1,s2) [String(s1) isEqualToString:String(s2)]
//是否为空
#define IsNull(obj) ([obj  isEqual:[NSNull null]]||obj==nil)
//GUID
#define GUID [[NSUUID UUID] UUIDString]
//取设备号
#define kDevice [[[UIDeviceHardware alloc] init] platformString]
//字体
#define FONT(S) [UIFont systemFontOfSize:S]
//Color
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//Color
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
//Color
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
//是否空白串
#define IsBlankString(string)  ((string==nil||string==NULL)||([string isKindOfClass:[NSNull class]])||([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0))
//反射
#define REFLECT(object,dict,modelTypeName) Class testClass=NSClassFromString(modelTypeName);object=[[testClass alloc] init];unsigned int outCount,i;NSMutableArray*keys=[@[] mutableCopy];objc_property_t*properties=class_copyPropertyList(testClass,&outCount);for(i=0;i<outCount;i++){objc_property_t property=properties[i];NSString*key=[[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];[keys addObject:key];}for(NSString*key in keys) {if([dict objectForKey:key]!=nil){[object setValue:[dict valueForKey:key] forKey:key];}}
//今天 yyyy-MM-dd
#define TodayStr ({NSDateFormatter *formatter = [[NSDateFormatter alloc] init];NSTimeZone *timeZone = [NSTimeZone localTimeZone];[formatter setTimeZone:timeZone];[formatter setDateFormat : @"yyyy-MM-dd"];[formatter stringFromDate:[NSDate date]];})
//现在 yyyy-MM-dd HH:mm:ss
#define NowStr ({NSDateFormatter *formatter = [[NSDateFormatter alloc] init];NSTimeZone *timeZone = [NSTimeZone localTimeZone];[formatter setTimeZone:timeZone];[formatter setDateFormat : @"yyyy-MM-dd HH:mm:ss"];[formatter stringFromDate:[NSDate date]];})
//日期 yyyy-MM-dd
#define DateStr(date) ({NSDateFormatter *formatter = [[NSDateFormatter alloc] init];NSTimeZone *timeZone = [NSTimeZone localTimeZone];[formatter setTimeZone:timeZone];[formatter setDateFormat : @"yyyy-MM-dd"];\
[date timeIntervalSinceDate:StrFromTime(@"2000-01-01 00:00:00")]<0.0?@"":[formatter stringFromDate:date];})\
//时间 yyyy-MM-dd HH:mm:ss
#define TimeStr(date) ({NSDateFormatter *formatter = [[NSDateFormatter alloc] init];NSTimeZone *timeZone = [NSTimeZone localTimeZone];[formatter setTimeZone:timeZone];[formatter setDateFormat : @"yyyy-MM-dd HH:mm:ss"];[formatter stringFromDate:date];})
//时间 yyyy-MM-dd HH:mm
#define TimeMStr(date) ({NSDateFormatter *formatter = [[NSDateFormatter alloc] init];NSTimeZone *timeZone = [NSTimeZone localTimeZone];[formatter setTimeZone:timeZone];[formatter setDateFormat : @"yyyy-MM-dd HH:mm"];[formatter stringFromDate:date];})
//串转nsdate
#define StrFromTime(dateString) ({NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];[dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];[dateFormatter dateFromString:dateString];})
#define  LabelTag(tag)   (UILabel *)[cell viewWithTag:tag]
//新建字典
#define new_Dic(dic)   NSMutableDictionary *dic=[@{}mutableCopy]
//新建集合
#define new_Arr(arr)   NSMutableArray *arr=[@[]mutableCopy]
#define Get_value(dic,key) [dic objectForKey:key]
#define Set_value(dic,key,value) [dic setObject:value forKey:key];
#endif
