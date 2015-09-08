

#define IS_IPHONE4 \
([[UIScreen mainScreen] bounds].size.width == 480 || [[UIScreen mainScreen] bounds].size.height == 480)

#define IS_IPHONE5 \
([[UIScreen mainScreen] bounds].size.width == 568 || [[UIScreen mainScreen] bounds].size.height == 568)

#define IS_IPAD \
   ([[UIScreen mainScreen] bounds].size.width == 768 || [[UIScreen mainScreen] bounds].size.height == 768)

NSString* machineName()
{
    static NSString* name = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        struct utsname systemInfo;
        uname(&systemInfo);
        name = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    });
    return name;
}
Then define a few macros as needed:

#define IS_IPHONE_6      [machineName() isEqualToString:@"iPhone7,2"]
#define IS_IPHONE_6_PLUS [machineName() isEqualToString:@"iPhone7,1"]
