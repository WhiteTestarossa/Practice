//
//  ViewController.m
//  UIView
//
//  Created by Daniel Belokursky on 19.02.22.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *viewsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"ViewDidLoad");
//    NSLog(@"%f", self.view.frame.size.width);
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CGFloat width = self.view.bounds.size.width / 8;
    CGFloat height = self.view.bounds.size.height;
    CGFloat x = 0.0;
    CGFloat y = height - (height / 3);

    CGRect start = CGRectMake(x, y, width, width);
    self.viewsArray = [[NSMutableArray alloc] init];
    for (int i = 1; i < 9; i++){
        for (int j = 1; j < 5; j++) {
            UIView *view = [[UIView alloc] initWithFrame:start];
            [view setBackgroundColor:[UIColor lightGrayColor]];
            
            [self.view addSubview:view];
            [view setAutoresizingMask: UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
            [self.viewsArray addObject:view];
            start.origin.x += width * 2;
        }
        if ((i + 1) % 2) {
            start.origin.x = x;
        } else {
            start.origin.x = width;
        }
        start.origin.y -= width;
    }
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    for (UIView *v in self.viewsArray) {
        [v setBackgroundColor:[UIColor brownColor]];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
