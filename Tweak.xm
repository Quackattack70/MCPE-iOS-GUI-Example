#include <device.h>

@interface minecraftpeViewController: UIViewController{
}
@end

%group I_PAD
%hook minecraftpeViewController

UIView* popview = [[UIView alloc] initWithFrame:
   CGRectMake(100, 100, 500, 500)];

%new
-(void)exitClick:(UIButton*)sender {
   [popview removeFromSuperview];
}

%new
-(void)OnClick:(UIButton*)sender {
   popview.backgroundColor = [UIColor whiteColor];
   UIButton* exitButton = [UIButton buttonWithType: UIButtonTypeCustom];
   [exitButton setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
   exitButton.frame = CGRectMake(3, 3, 30, 30);
   [exitButton setTitle: @"X" forState: UIControlStateNormal];
   [exitButton addTarget:self action:@selector(exitClick:) forControlEvents: UIControlEventTouchUpInside];
   [popview addSubview: exitButton];
   [self.view addSubview: popview];
}

-(void)viewDidLoad {
   %orig;
   UIButton* button = [UIButton buttonWithType: UIButtonTypeCustom];
   button.frame = CGRectMake(10, 100, 100, 70);
   [button setTitle:@"Click me" forState: UIControlStateNormal];
   [button setTintColor:[UIColor grayColor]];
   [button setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
   [button addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview: button];
}

%end
%end





%group I_PHONE
%hook minecraftpeViewController

UIView* popview2 = [[UIView alloc] initWithFrame:
   [[UIScreen mainScreen]bounds]];

%new
-(void)exitClick:(UIButton*)sender {
   [popview2 removeFromSuperview];
}

%new
-(void)OnClick:(UIButton*)sender {
   popview2.backgroundColor = [UIColor whiteColor];
   UIButton* exitButton = [UIButton buttonWithType: UIButtonTypeCustom];
   [exitButton setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
   exitButton.frame = CGRectMake(3, 3, 30, 30);
   [exitButton setTitle: @"X" forState: UIControlStateNormal];
   [exitButton addTarget:self action:@selector(exitClick:) forControlEvents: UIControlEventTouchUpInside];
   [popview2 addSubview: exitButton];
   [self.view addSubview: popview2];
}

-(void)viewDidLoad {
   %orig;
   UIButton* button = [UIButton buttonWithType: UIButtonTypeCustom];
   button.frame = CGRectMake(10, 100, 100, 70);
   [button setTitle:@"Click me" forState: UIControlStateNormal];
   [button setTintColor:[UIColor grayColor]];
   [button setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
   [button addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview: button];
}

%end
%end

%ctor {
   if(IS_IPAD){
      %init(I_PAD);
   }
   if(IS_IPHONE5 || IS_IPHONE4){
      %init(I_PHONE);
   }
   
}
