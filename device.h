

#define IS_IPHONE4 \
([[UIScreen mainScreen] bounds].size.width == 480 || [[UIScreen mainScreen] bounds].size.height == 480)

#define IS_IPHONE5 \
([[UIScreen mainScreen] bounds].size.width == 568 || [[UIScreen mainScreen] bounds].size.height == 568)

#define IS_IPAD \
   ([[UIScreen mainScreen] bounds].size.width == 768 || [[UIScreen mainScreen] bounds].size.height == 768)
