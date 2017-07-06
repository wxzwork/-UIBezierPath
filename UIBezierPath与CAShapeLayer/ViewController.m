//
//  ViewController.m
//  UIBezierPath与CAShapeLayer
//
//  Created by WOSHIPM on 17/1/5.
//  Copyright © 2017年 WOSHIPM. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.view.frame.size.width-110, 64,100, 40);
    [self.view addSubview:button];
    [button setTitle:@"画个哆啦A梦" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
//   一、 CAShapeLayer画图
    CAShapeLayer *layer=[[CAShapeLayer alloc] init];
    layer.frame = CGRectMake(40, 70, 100, 50);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
//    二、UIBezierPath和CAShapeLayer结合画图
 
//   1、矩形。 Rect是所画图形的frame
    UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(160, 70, 100, 50)];
    CAShapeLayer *layer1=[[CAShapeLayer alloc] init];
    layer1.path=path.CGPath;
    
    layer1.fillColor=[UIColor greenColor].CGColor;//图形的填充颜色
    layer1.strokeColor=[UIColor redColor].CGColor;//图形的边框颜色    [self.view.layer addSublayer:layer1];
    
    
//   2、椭圆。Rect是所画图形的frame，cornerRadius是椭圆的圆角，当图形的长宽一样，圆角为长宽的一半时即为圆形

    //椭圆
    UIBezierPath *path2=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 140, 100, 50) cornerRadius:30];
    //圆
//    UIBezierPath *path2=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 140, 100, 100) cornerRadius:50];
    CAShapeLayer *layer2=[[CAShapeLayer alloc] init];
    layer2.path=path2.CGPath;
    layer2.fillColor=[UIColor whiteColor].CGColor;
    layer2.strokeColor=[UIColor blueColor].CGColor;
    [self.view.layer addSublayer:layer2];
    
    
//    3、画圆弧。画满一圈即为圆
    
    //ArcCenter:圆心
    //radius:半径
    //startAngle:开始角度
    //endAngle:结束角度
    //clockwise:是否顺时针方向
    
    //指定起点和终点画圆弧
    UIBezierPath *cornerPath=[UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50 startAngle:M_PI endAngle:3*M_PI clockwise:YES];
    CAShapeLayer *layer3 = [[CAShapeLayer alloc] init];
    layer3.path = cornerPath.CGPath;
    layer3.fillColor = [UIColor clearColor].CGColor;
    layer3.strokeColor = [UIColor greenColor].CGColor;
    // 3.0f设置线的宽度
    [layer3 setLineWidth:5.0f];
    
    [self.view.layer addSublayer:layer3];
    
    //4、虚线。虚线的话， 是通过设置CAShapeLayer的宽度及线的间距，进而
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 设置虚线颜色为blackColor
    
    [shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
    
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:0.5f];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
      [NSNumber numberWithInt:1],nil]];
    
    
    // Setup the path
    CGMutablePathRef path3 = CGPathCreateMutable();
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
    CGPathMoveToPoint(path3, NULL, 50 , 280);
    CGPathAddLineToPoint(path3, NULL, 250,280);
    
    CGPathMoveToPoint(path3, NULL, 250, 280);
    CGPathAddLineToPoint(path3, NULL, 250,320);
    
    CGPathMoveToPoint(path3, NULL, 250, 320);
    CGPathAddLineToPoint(path3, NULL, 50,320);
    
    CGPathMoveToPoint(path3, NULL, 50, 320);
    CGPathAddLineToPoint(path3, NULL, 50,280);
    [shapeLayer setPath:path3];
    CGPathRelease(path3);
    [self.view.layer addSublayer:shapeLayer];
    
    
// 5、曲线
//    单点曲线
    //贝塞尔曲线的画法是由起点、终点、控制点三个参数来画的 
    [self curve];
    [self Curve2];
    
}
-(void)curve{
    CGPoint startPoint   = CGPointMake(50, 350);
    CGPoint endPoint     = CGPointMake(300, 350);
    CGPoint controlPoint = CGPointMake(175, 300);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
}
#pragma mark - 双控制点曲线
- (void)Curve2{
 
    
    //贝塞尔曲线的画法是由起点、终点、控制点三个参数来画的，为了解释清楚这个点，我写了几行代码来解释它
    CGPoint startPoint   = CGPointMake(50, 400);
    CGPoint endPoint     = CGPointMake(300, 400);
    CGPoint controlPoint1 = CGPointMake(112.5, 350);
    CGPoint controlPoint2 = CGPointMake(237.5, 450);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(controlPoint1.x, controlPoint1.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer4 = [CALayer layer];
    layer4.frame = CGRectMake(controlPoint2.x, controlPoint2.y, 5, 5);
    layer4.backgroundColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer4];
    
   
}

-(void)buttonAction:(UIButton *)button{
//      [self clearDisplayView];
    
    SecondViewController *secondVC=[SecondViewController new];
    [self.navigationController pushViewController:secondVC animated:YES];
    


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    /*
      **/
//     1. UIBezierPathCAShapeLayer： UIBezierPath是在 UIKit 中的一个类，继承于NSObject,可以创建基于矢量的路径.此类是Core Graphics框架关于path的一个OC封装。使用此类可以定义常见的圆形、多边形等形状 。我们使用直线、弧（arc）来创建复杂的曲线形状。每一个直线段或者曲线段的结束的地方是下一个的开始的地方。每一个连接的直线或者曲线段的集合成为subpath。一个UIBezierPath对象定义一个完整的路径包括一个或者多个subpaths。
//     2. CAShapeLayer： 继承于CALayer。 每个CAShapeLayer对象都代表着将要被渲染到屏幕上的一个任意的形状(shape)。具体的形状由其path(类型为CGPathRef)属性指定。 普通的CALayer是矩形，所以需要frame属性。CAShapeLayer它本身没有形状，它的形状来源于其属性path 。CAShapeLayer有不同于CALayer的属性，它从CALayer继承而来的属性在绘制时是不起作用的。
//     
   
}


@end
